<#
This script will export resource groups from azure using the aztfexport tool written by https://github.com/Azure/aztfexport (MPL 2.0 License)
After that, it will export all conditional access policies in a human-readable format with the tool Invoke-ConditionalAccessDocumentation written by https://github.com/nicolonsky/ConditionalAccessDocumentation?tab=readme-ov-file
Finally, it will export all azure resources and output them by using az rest commands.

Optionally, you may need to run the following:

az extension add --name resource-graph
Install-Module -Name Microsoft.Graph.Identity.Governance
Install-Module -Name Microsoft.Graph.Authentication

Qadriyyah Abdullah [Ms Bey] 2025
#>

function rgExport {

    debugLog "Beginning resource group export." "Cyan"

    #Declare empty array for later
    $rg = @()
    $groups = az group List
    #Convert az group list from JSON and grab the ID value
    $id = ($groups | ConvertFrom-Json).ID

    foreach ($val in $id) {
        #The ID contains the full path, we extract the name which is the last value in this path
        $rg += $val.Split("/")[4]
    }

    #Counter for the end user
    $ct = 0
    foreach ($grp in $rg) { 
        $pth = "C:\temp\hashicorp\terraform\aztfexport\$grp"
        #If the path does not exist
        if (!(Test-path $pth)) {
            #Try to create the path
            try {mkdir $pth} catch {debugLog "Unable to create directory $pth" "Red" ; exit 1}
            debugLog "$pth created" "Cyan"
        }
        #If the path is not empty
        elseif ((Get-ChildItem -Path $pth | Measure-Object).Count -ne 0) {
            $cont = $false
            while (!$cont) {
                $del = Read-Host -Prompt "It looks like $pth is not empty. Would you like to empty it contents, or skip it?"
                if ($del -match '[Ee]mpty') {
                    #Empty all the contents
                    try {Remove-Item -Recurse -Force $pth} catch {debugLog "Unable to delete $pth" "Red" ; exit 1}
                    #Recreate the folder
                    try {mkdir $pth} catch {debugLog "Unable to create directory $pth" "Red" ; exit 1}
                    debugLog "$pth has been recreated" "Cyan"
                    $cont = $true
                }
                elseif ($del -match '[Ss]kip') {
                    $skip = $true
                    $cont = $true
                }
                else {
                    debugLog "Please enter either 'Empty' or 'Skip'" "Magenta"
                }
            }
        }
        if (!$skip) {
            Set-Location $pth 
            #Run aztfexport command
            try {debugLog "We are going to attempt to export $grp now" "Cyan" ; aztfexport.exe resource-group --non-interactive $grp} catch {debugLog "Unable to execute AZTFExport." "Red" ; exit 1}
            debugLog "$grp has been exported!" "Green" ; $ct += 1
        }
        else {
            continue
        }
    }
    
    debugLog "$ct resource groups have been exported." "Cyan"
}

function CAExport {

    debugLog "Beginning conditional access export." "Cyan"

    #Make sure the user can use an external script, and that they are okay with it
    $ans = Read-Host -Prompt "We are going to install an external script from the powershell gallery (https://github.com/nicolonsky/ConditionalAccessDocumentation). Is that okay?"
    if ($ans -match "[Yy][Ee]?[Ss]?") {
        #Install github script from PS Gallery
        try {Install-Script -Name Invoke-ConditionalAccessDocumentation -Scope CurrentUser} catch {debugLog "Install script failed." "Red" ; exit 1}
        #Connect to MS Graph with the appropriate scopes
        try {Connect-MgGraph -NoWelcome -Scopes "Application.Read.All", "Group.Read.All", "Policy.Read.All", "RoleManagement.Read.Directory", "User.Read.All"} catch {debugLog "Connect MG Graph failed." "Red" ; exit 1}
        #Run the PS Gallery Script
        Invoke-ConditionalAccessDocumentation.ps1 ; debugLog "By default, this will create a new PATH variable entry to your Documents/Powershell/Scripts folder. This is where the output will be stored." "Blue"
    }
    else {
        debugLog "CAExport will not be ran." "Magenta" ; exit 0
    }

}

function resourceExport {

    #Declare parameter to determine if we need to run connect-mggraph
    Param (
        [System.Boolean]$enrolled
    )

    debugLog "Beginning resource export." "Cyan"

    if (!$enrolled) {
        debugLog "Connecting to Graph" "Cyan"
        Connect-MgGraph -NoWelcome -Scopes "Application.Read.All", "Group.Read.All", "Policy.Read.All", "RoleManagement.Read.Directory", "User.Read.All"
    }

    $azUser = @()
    $azGrp = @()

    #Apps are service principals in Azure
    $azApps = try {Invoke-MgGraphRequest -uri "https://graph.microsoft.com/v1.0/servicePrincipals"} catch {debugLog "API Request for Service Princpals failed." "Red" ; exit 1}
    debugLog "Applications have been downloaded" "Green"
    #Get locations
    $azLoc = try {az rest --method get --url "https://management.azure.com/subscriptions/<subscription-id>/locations?api-version=2022-12-01"} catch {debugLog "API Request for Locations failed." "Red" ; exit 1}
    debugLog "Locations have been downloaded" "Green"
    #Get all users
    $resp = try {Invoke-MgGraphRequest -uri "https://graph.microsoft.com/v1.0/users?`$top=999"} catch {debugLog "API Request for Users failed." "Red" ; exit 1}
    $azUser += $resp.Value
    debugLog "First set of users have been downloaded" "Green"
    #Only retrieves 999 results -> Page max. Check if nextLink is in the response, indicating a next page.
    do {
        #Set url to next link value
        $uri = $resp.'@odata.nextLink'
        $resp = try {Invoke-MgGraphRequest -uri $uri} catch {debugLog "API Request for next page of users failed." "Red" ; exit 1}
        debugLog "Next set of users have been downloaded" "Green"
        $azUser += $resp.Value
    } while ($resp.'@odata.nextLink')
    #Get all groups
    $resp = try {Invoke-MgGraphRequest -uri "https://graph.microsoft.com/v1.0/groups?`$top=999"} catch {debugLog "API Request for Users failed." "Red" ; exit 1}
    debugLog "First set of groups have been downloaded" "Green"
    $azGrp += $resp.Value
    #Only retrieves 999 results -> Page max. Check if nextLink is in the response, indicating a next page.
    do {
        #Set url to next link value
        $uri = $resp.'@odata.nextLink'
        $resp = try {Invoke-MgGraphRequest -uri $uri} catch {debugLog "API Request for next page of users failed." "Red" ; exit 1}
        debugLog "Next set of groups have been downloaded" "Green"
        $azGrp += $resp.Value
    } while ($resp.'@odata.nextLink')
    #Get all role definitions
    $azRoles = try {Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/v1.0/roleManagement/directory/roleDefinitions"} catch {debugLog "API request for role definitions failed." "Red" ; exit 1}
    debugLog "Role definitions have been downloaded" "Green"

    #Convert all value fields from JSON
    $azApps = $azApps.Value
    $azLoc = ($azLoc | ConvertFrom-Json).Value
    $azRoles = $azRoles.Value

    #Declare empty array for each object category
    $hrApp = @()
    $hrLoc = @()
    $hrRole = @()

    #These are more or less the same foreach loop. Create custom PS objects to store the name and id as human readable values, then sort by name
    foreach ($app in $azApps) {
        $hrApp += [PSCustomObject] @{
            Name = $app.appDisplayName
            ID = $app.appId
        }
    }
    $hrApp = $hrApp | Sort-Object Name
    debugLog "Application array is complete" "Green"
    foreach ($loc in $azLoc) {
        $hrLoc += [PSCustomObject] @{
            Location = $loc.displayName
            ID = ($loc.id).Split("/")[2]
        }
    }
    $hrLoc = $hrLoc | Sort-Object Location
    debugLog "Location array is complete" "Green"
    foreach ($rol in $azRoles) {
        $hrRole += [PSCustomObject] @{
            Name = $rol.DisplayName
            Description = $rol.Description
            ID = $rol.Id
        }
    }
    $hrRole = $hrRole | Sort-Object Name
    debugLog "Role array is complete" "Green"

    #Export everything
    $hrApp | Export-Csv 'C:\temp\hashicorp\terraform\aztfexport\azureApps.csv' -NoTypeInformation
    $hrLoc | Export-Csv 'C:\temp\hashicorp\terraform\aztfexport\azureLocations.csv' -NoTypeInformation
    $azUser | Out-File 'C:\temp\hashicorp\terraform\aztfexport\azureUsers.txt'
    $azGrp | Out-File 'C:\temp\hashicorp\terraform\aztfexport\azureGroups.txt'
    $hrRole | Export-Csv 'C:\temp\hashicorp\terraform\aztfexport\azureRoles.csv' -NoTypeInformation
}

function debugLog {

    Param (
        [string]$text,
        [string]$color
    )

    $func = "AzureTF_Export"

    #I use red for errors.
    if ($color -eq "Red") {
        $out = (Get-Date -UFormat "%Y-%m-%d %H:%M:%S") + " " + $text
        $out | Out-File C:\temp\$func-debug.txt -Append
        Write-Host $text -ForegroundColor $color
    }
    else {
        Write-Host $text -ForegroundColor $color
    }

}

#It looks pretty neat
Write-Host "
   _____                                ___________                             __   
  /  _  \ __________ _________   ____   \_   _____/__  _________   ____________/  |_ 
 /  /_\  \\___   /  |  \_  __ \_/ __ \   |    __)_\  \/  /\____ \ /  _ \_  __ \   __\
/    |    \/    /|  |  /|  | \/\  ___/   |        \>    < |  |_> >  <_> )  | \/|  |  
\____|__  /_____ \____/ |__|    \___  > /_______  /__/\_ \|   __/ \____/|__|   |__|  
        \/      \/                  \/          \/      \/|__|                       

" -ForegroundColor DarkBlue

$rdy = Read-Host -Prompt "We are going to log you into Microsoft. Do you have adequate permissions to view all resources?"

if ($rdy -match "[Yy][Ee]?[Ss]?") {
    debugLog "Logging into Azure!" "Cyan"
    az login
}
elseif ($rdy -match "[Nn][Oo]?") {
    debugLog "Please come back when you are ready." "Red" ; exit 0
}
else {
    debugLog "Please enter either Y(es) or N(o)" "Magenta"
}

$val = $false

while (!$val) {
    $choice = Read-Host -Prompt "Would you like to export: 
                                1. Resource Groups 
                                2. Conditional Access Policies 
                                3. Azure Resources
                                4. All`n"
    switch ($choice) {
        (1) {
            debugLog "Moving to rgExport" "Green" ; rgExport ; $val = $true
        }
        (2){
            debugLog "Moving to CAExport" "Green" ; CAExport ; $val = $true
        }
        (3){
            debugLog "Moving to resourceExport" "Green" ; resourceExport -enrolled $false; $val = $true
        }
        (4){
            debugLog "We will move to all functions in order" "Green" ; rgExport ; CAExport ; resourceExport -enrolled $true ; $val = $true
        }
        default {
            debugLog "Please enter 1, 2, 3, or 4" "Magenta"
        }
    }
}
