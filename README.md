# 🧭 Identity and Access Management Labs Portfolio

Welcome to my **Identity and Access Management (IAM)** Labs Portfolio: a collection of hands‑on projects demonstrating practical administration and security skills across enterprise identity platforms.  
Each lab shows how I implement, configure, and govern user access in different environments to support secure identity lifecycle management.

> Designed to reflect real‑world scenarios from Microsoft Entra ID (Azure AD) and Okta Workforce Identity platforms.

---

## 📘 Labs Included

| Lab | Technology | Description |
|-----|-------------|--------------|
| [Azure Active Directory Lab](https://github.com/msbey-cyber/IAM-Labs/blob/main/Azure-Active-Directory.md) | Microsoft Entra ID | Create users, manage groups, set Group Policy, and test access permissions in an Azure AD environment. |
| [Azure Active Directory Audits Lab](https://github.com/msbey-cyber/IAM-Labs/blob/main/Azure-AD-Access-Audit.md) | Microsoft Entra ID | Generate audit‑style reports by reviewing user access, role changes, group memberships, app assignments, and orphaned accounts using Microsoft Entra ID and Microsoft Graph PowerShell. |
| [Azure AD Governance & Lifecycle Automation Lab](https://github.com/msbey-cyber/IAM-Labs/blob/main/Access-Packages-Lifecycle-Governance.md) | Microsoft Entra ID | Configure Access Packages, Entitlement Management, and Expiration Policies for identity lifecycle governance. |
| [Okta Access Requests & Approval Workflow Lab](https://github.com/msbey-cyber/IAM-Labs/blob/main/Okta-Access-Requests-and-Approvals.md) | Okta Workforce Identity Cloud | Configure Okta Self‑Service app requests with approval workflows and validate end‑to‑end access provisioning. |
| [Okta MFA & Policy Configuration Lab](https://github.com/msbey-cyber/IAM-Labs/blob/main/Okta-Verify-MFA.md) | Okta Workforce Identity Cloud | Enable and configure Okta Verify MFA, assign required factors, enforce MFA at sign‑in, and test end‑user enrollment and authentication. |
| [Okta SSO Integration Lab: SAML & OIDC Configuration](https://github.com/msbey-cyber/IAM-Labs/blob/main/Okta-SAML-OIDC-SSO.md) | Okta Workforce Identity Cloud | SAML and OIDC application integration in Okta, including custom SSO configuration, attribute mapping, redirect URI setup, and secure client credential management. |
| [Okta User & Group Management Lab](https://github.com/msbey-cyber/IAM-Labs/blob/main/Okta-User-Group-Management.md) | Okta Workforce Identity Cloud | Create users, build and assign groups, reset passwords, and suspend accounts through the Okta Admin Console. |
| [Azure Resource & Conditional Access Export Lab](https://github.com/msbey-cyber/IAM-Labs/tree/main/Azure-Export) | Microsoft Entra ID, Azure, PowerShell, Microsoft Graph, Terraform | Automate export of Azure resource groups, Conditional Access policies, and Entra ID apps/users/groups/roles to CSV and Terraform‑ready files for audit, access reviews, and configuration backup. |


---

## 🧰 Technologies Used
- Microsoft Entra ID (Azure Active Directory)
- Okta Admin Console / Workforce Identity Cloud
- PowerShell / Microsoft Graph API (users, groups, service principals, roles)
- Identity Governance and Access Lifecycle Automation concepts
- Azure Portal & Azure Resource Manager (ARM)
- Azure CLI (`az`) and `az rest`
- Azure Resource Graph (extension)
- `aztfexport` (Azure → Terraform export)
- Infrastructure as Code (Terraform-ready exports)
- CSV/JSON export for audit and reporting

---

## 🧠 Skills Demonstrated
- User and Group Provisioning & Access Control
- Privileged Account and Session Management
- Identity Lifecycle Governance (Access Reviews, Approvals, Expiration Policies)
- Cross‑Platform Directory Integration and Administration
- Compliance and Security Monitoring
- Automated discovery and export of Azure/Entra ID identities, roles, and resources for audit and access review
- Use of Microsoft Graph PowerShell (`Invoke-MgGraphRequest`, `Connect-MgGraph`) to query users, groups, service principals, and directory roles at scale (including pagination handling)
- Documentation of Conditional Access policies in a human‑readable format to support security posture reviews and compliance evidence
- Integration of Azure CLI (`az`, `az rest`) with PowerShell to inventory Azure resources and subscription locations via ARM/management APIs
- Conversion of Azure resource groups into Terraform‑ready configuration using `aztfexport`, enabling infrastructure‑as‑code and configuration backup
- Robust scripting practices in PowerShell (functions, error handling with `try/catch`, logging, user prompts, and safe handling of existing output directories)
- Practical Azure IAM governance: building exports that support “who has access to what” analysis across apps, roles, groups, and policies

---

**Author:** Qadriyyah Abdullah [Ms Bey]  
**Date:** December 2025  
**Connect:** [LinkedIn](https://www.linkedin.com/in/qadriyyah) | [Portfolio](https://github.com/msbey-cyber)
