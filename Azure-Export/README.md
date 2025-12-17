***

# Azure Resource & Conditional Access Documentation Export

**Automate the export of Azure resource groups, Conditional Access policies, and directory inventory using PowerShell and Azure CLI.**

## Features

- Export Azure Resource Groups using [`aztfexport`](https://github.com/Azure/aztfexport).[1]
- Export Conditional Access policies in a human-readable format using [`Invoke-ConditionalAccessDocumentation`](https://github.com/nicolonsky/ConditionalAccessDocumentation?tab=readme-ov-file).
- Export Azure tenant resources (apps, users, groups, roles, and locations) with `az rest` and Microsoft Graph PowerShell.
- Interactive workflow supporting granular and full export options.

## Prerequisites

Install the following tools and modules before use:

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [`aztfexport`](https://github.com/Azure/aztfexport) ([MPL 2.0 license](https://github.com/Azure/aztfexport/blob/main/LICENSE))[1]
- PowerShell 7+
- [Microsoft Graph PowerShell SDK](https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation)
- [Azure Resource Graph extension](https://learn.microsoft.com/en-us/azure/governance/resource-graph/extension-azure-cli)

```powershell
# Optional but recommended:
az extension add --name resource-graph
Install-Module -Name Microsoft.Graph.Identity.Governance
Install-Module -Name Microsoft.Graph.Authentication
```

## Setup

1. Clone this repo and ensure all required tools are installed.
2. Place the script file in your local machine.
3. Start a PowerShell session as Administrator.

## Usage

The repo’s main script provides a wizard to select export options:

```powershell
# Run the script and follow prompts
.\AzureTF_Export.ps1
```

**Export options include:**

- Resource Groups (via aztfexport)
- Conditional Access Policies (via Invoke-ConditionalAccessDocumentation)
- Azure Resources (via az rest and Graph PowerShell)
- All of the above, sequentially

Sample workflow:

```plaintext
1. Prompts for Azure login
2. Prompts to select export types
3. Automatically exports data to C:\temp\hashicorp\terraform\aztfexport\
```

## Attributions

- [`aztfexport`](https://github.com/Azure/aztfexport) (MPL 2.0 License)[1]
- [`Invoke-ConditionalAccessDocumentation`](https://github.com/nicolonsky/ConditionalAccessDocumentation?tab=readme-ov-file) (MIT License)

## Authors

Qadriyyah Abdullah [Ms Bey], 2025

## License

The `Azure-Terraform-Export.ps1` script in this folder is licensed under the GNU General Public License v3.0 (GPL-3.0). For more details, see the [GPL-3.0 license](https://www.gnu.org/licenses/gpl-3.0.en.html).

***

**For any issues, feature requests, or contributions, please open an issue or pull request!**

[1](https://github.com/Azure/aztfexport)
