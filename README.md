# Azure-Active-Directory

This project documents focused on **managing users, roles, and licenses in Microsoft Entra ID (Azure Active Directory)**.  

The exercises demonstrate identity lifecycle management tasks including user creation, role assignment, bulk import operations, and license administration.

---

## 🧰 Technologies Used
- Microsoft Entra ID (Azure Active Directory)
- Microsoft 365 Admin Center
- Microsoft Graph PowerShell
- Role-Based Access Control (RBAC)
- Identity Lifecycle Management

---

## 🧠 Key Learning Objectives
- Manage users and directory roles in Entra ID.  
- Apply RBAC and principle of least privilege.  
- Perform bulk user operations using CSV and PowerShell.  
- Assign licenses and verify usage locations.  
- Restore deleted user accounts.

---

# 🧩 Exercise 1 – Add and Test a New User

### **Task 1: Add a New User**
1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com) as a **Global Administrator** using your Microsoft 365 admin credentials.  
2. In the left-hand menu, expand **Identity → Users → All Users**.  
3. Select **+ New user → Create new user**.
1.png
5. Provide the following:
   - **User principal name:** `ChrisG`
   - **Display name:** `Chris Green`
   - Ensure **Auto-generate password** is enabled.  
6. Copy the generated password securely — you’ll need it for sign-in.  
7. Select **Review + Create**, then confirm user creation.  

### **Task 2: Sign In as the New User and Attempt App Creation**
1. Open an **InPrivate/Incognito** browser window.  
2. Navigate again to [https://entra.microsoft.com](https://entra.microsoft.com).  
3. Sign in as **Chris Green** using the provided username and password.  
4. When prompted, update the password:
   - **Current Password:** Auto-generated password  
   - **New Password:** Your secure choice  
5. After signing in, use the search bar to locate **Enterprise Applications**.  
6. Select **+ New Application** — observe that “Create your own application” is unavailable.  
7. Explore settings like **Consent and Permissions** and **User Settings** to verify lack of admin privileges.  
8. Sign out from the Chris Green session.

---

# 🧩 Exercise 2 – Assign Role and Create an Application

### **Task 1: Assign Application Administrator Role**
1. Sign in as an **Administrator** in the Entra admin center.  
2. Navigate to **Identity → Users → All Users → Chris Green**.  
3. In the left-hand menu, select **Assigned Roles → + Add Assignments**.  
4. Choose the **Application Administrator** role from the dropdown.  
5. Under **Assignment Type**, mark **Active**, and use a justification like “Needed for lab.”  
6. Select **Assign**, then **Refresh** to confirm the new role assignment.  

### **Task 2: Verify New Role Permissions**
1. Launch a new InPrivate browser session.  
2. Sign in as **Chris Green** again.  
3. Return to **Enterprise Applications** via search.  
4. Confirm that **+ New Application** and **Create your own application** options are now available.  
5. Sign out once verified.

---

# 🧩 Exercise 3 – Remove the Assigned Role

### **Task 1: Remove the Application Administrator Role**
1. Sign in as the **Administrator** again.  
2. In the search bar, type **Roles and Administrators** and open it.  
3. Select **Application Administrator** from the list.  
4. On the **Assignments** page, locate **Chris Green**, select the checkbox beside the user, and choose **Remove**.  
5. Confirm removal, then close the window.  

---

# 🧩 Exercise 4 – Bulk User Creation

### **Task 1: Bulk Creation Using CSV**
1. From Entra ID, navigate to **Identity → Users → All Users**.  
2. Select **Bulk Operations → Bulk Create**.  
3. Download the provided **CSV template**.  
4. Open the file and populate sample user details (e.g., name, username, and department).  
5. Save the CSV with your tenant domain (e.g. `user1@<tenantname>.onmicrosoft.com`).  
6. Upload the file back under the **Bulk Create** section and select **Submit**.  
7. Confirm successful creation — new users should appear in the user list.

### **Task 2: Bulk Creation Using PowerShell**
1. Ensure **PowerShell version 7.2+** is installed.  
2. Open PowerShell and install the Microsoft Graph module:
   ```powershell
   Install-Module Microsoft.Graph -Scope CurrentUser -Verbose
   Get-InstalledModule Microsoft.Graph
3. Connect to Microsoft Graph:
   ```powershell
   Connect-MgGraph -Scopes "User.ReadWrite.All"
4. Define password policy:
   ```powershell
   $PWProfile = @{
    Password = "<Enter-Complex-Password>";
    ForceChangePasswordNextSignIn = $false
   }
5. Create new user and assign role:
   ```powershell
   New-MgUser -DisplayName "New PW User" -GivenName "New" -Surname "User" -MailNickname "newuser" -UsageLocation "US" -UserPrincipalName "newuser@<tenantname>.onmicrosoft.com" -PasswordProfile $PWProfile -AccountEnabled -Department "Research" -JobTitle "Trainer"
6. Verify user creation:
   ```powershell
   Get-MgUser

# 🧩 Exercise 5 – Remove and Restore Users

### **Task 1 – Delete a User**
1. Navigate to Identity → Users → All Users.
2. Select Chris Green and choose Delete → Yes.

### **Task 2 – Restore Deleted User**
1. From the side menu, Deleted Users → find Chris Green.
2. Click Restore User, confirm, then check All Users to verify.

# 🧩 Exercise 6 – Assign a Windows 10/11 License

### **Task 1 – Locate an Unlicensed User**
1. Search for Jane Smith → open profile.
2. Confirm or set Usage Location.
3. In the Licenses tab, verify No license assigned.

### **Task 2 – Assign License**
1. Open https://admin.microsoft.com.
2. Navigate to Billing → Licenses.
3. Select Windows 10/11 Enterprise E3 → + Assign Licenses.
4. Search for Jane Smith → Assign.
5. Return to Entra ID → verify license is now present.

# ✅ Summary
Completed Tasks

User creation (single via GUI and bulk via automation using PowerShell Graph modules)
Role assignment (in GUI and PowerShell) and revocation
Account deletion and restoration
License assignment via Microsoft 365 Admin Center
These steps implement core IAM governance concepts aligned with enterprise Identity & Access Administration best practices.

Author: Qadriyyah Abdullah [Ms Bey]
Date: December 2025
Tags: SC-300 AzureAD Microsoft Entra ID IdentityGovernance RoleManagement
