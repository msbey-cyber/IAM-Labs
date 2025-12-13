# 🧭 Okta Administration Lab – Access Requests & Approval Workflow

This project demonstrates how to configure **Access Requests and Approval workflows** in Okta using the built‑in **Self Service** application request feature.  
You will enable app request options, configure approval requirements, designate approvers, set expiration timelines, and test the end-to-end experience from a user’s perspective.

> Based on skills aligned with **Okta Workforce Identity Administration** and **Identity Governance** access request workflows.

---

## 🧰 Technologies Used
- Okta Admin Console (Developer Tenant)
- Okta Applications & Self Service Access
- Request & Approval Workflow
- Identity Governance Concepts (IGA Lite)
- User Dashboard (End-User Experience)

---

## 🧠 Key Learning Objectives
- Enable and configure Okta **Self Service App Requests**
- Allow users to request access to specific apps
- Configure **approval requirements** and designate approvers
- Set request expiration and notification settings
- Validate the full access-request process from the user’s experience
- Understand how Okta’s access request system supports governance workflows

---

# 🧩 Exercise 1 – Enable Self Service App Requests

### **Task 1: Navigate to Self Service Settings**
1. In the Okta Admin Console, go to:  
   **Applications → Self Service**  
2. Under **User App Requests**, click **Edit**. 
   ![descriptive alt text](./images/218.png) 
   

---

### **Task 2: Enable Org‑Managed App Requests**
1. Enable the setting:  
   ✔ **Allow users to add org‑managed apps**  
2. Click **Save**.
   ![descriptive alt text](./images/219.png)


**Result:**  
Users can now request access to apps that administrators have explicitly enabled for Self Service.

---

# 🧩 Exercise 2 – Enable Self Service for a Specific App

### **Task 1: Select the Application**
1. Go to **Applications → Applications**  
2. Click your app (for this lab: **Test SAML App**)  
   ![descriptive alt text](./images/220.png)

---

### **Task 2: Configure Self Service Settings**
1. Go to the **Assignments** tab.  
2. In the right‑hand panel under **Self Service**, click **Edit**.  
   ![descriptive alt text](./images/221.png)

---

### **Task 3: Turn on App Requests**
1. Enable:  
   ✔ **Allow users to request app**

2. Optional: Add a note for the requester.

3. Under **Approval**, select:  
   ✔ **Required**

4. Add an approver:
   - Enter approver’s name (you may add multiple steps)
   - Choose entitlements (default = *Write*)

   ![descriptive alt text](./images/222.png)

5. Scroll down and set the following options:  
- ✔ *Email requester when approved*  
- ✔ *Email requester when denied*  
- Approver must respond within:  
  **3 Days**
- Click **Save**.
![descriptive alt text](./images/223.png)

---

### **Task 5: Confirm App Appears in Self Service Catalog**
1. Return to **Applications → Self Service**  
2. Under **Available Apps**, confirm your app is listed.  
   ![descriptive alt text](./images/224.png)

---

# 🧩 Exercise 3 – User Experience: Requesting Access

### **Task 1: Sign In as an End User**
1. Open a new incognito window.
2. Log in as **Test User**.  
   ![descriptive alt text](./images/225.png)

3. Complete MFA if prompted.  
   ![descriptive alt text](./images/226.png)
   ![descriptive alt text](./images/227.png)
   ![descriptive alt text](./images/228.png)
   ![descriptive alt text](./images/229.png)

4. Note that the Test SAML App is unavailable under Test User's list of apps.
   ![descriptive alt text](./images/237.png)
   
---

### **Task 2: Open the Request App Option**
1. From the Okta Dashboard, click **Request an app** at the bottom.  
   ![descriptive alt text](./images/236.png)

2. Enter a message explaining why access is needed:  
   *“Please allow me access to the Test SAML App for a group project.”*

3. Click **Send to IT Admin**.  
   ![descriptive alt text](./images/245.png)

4. A confirmation message appears at the bottom right of the screen.  
   ![descriptive alt text](./images/246.png)
---

# 🧩 Exercise 4 – Admin Experience: Receiving the Request

### **Task 1: View Email Notification**
1. The designated approver receives an email:

![descriptive alt text](./images/235.png)

The email includes:
- User request details  
- App name  
- User identity  
- User’s justification message

### **Task 2: Open the Requested Application in the Admin Console**

2. In the Okta Admin Console, navigate to:  
   **Applications → Applications**, then select the app the user requested (Test SAML App).
![descriptive alt text](./images/238.png)

### **Task 3: Assign the Application to the User**

3. Navigate to the **Assignments** tab of the selected application.  
   Then click **Assign → Assign to People**.  
![descriptive alt text](./images/239.png)

4. In the **Assign Test SAML App to People** window, find the user who submitted the request (Test User) and click **Assign**.
![descriptive alt text](./images/240.png)

5. Confirm the assignment by clicking **Save and Go Back**. 
![descriptive alt text](./images/241.png)

6. The user now appears as **Assigned**. Click **Done**.
![descriptive alt text](./images/242.png)

---

# 🧩 Exercise 5 – Validation

### **Task 1: Confirm Request Appears in User Apps**
1. The **Assignments** tab now lists the user under **People**, confirming successful provisioning.    
![descriptive alt text](./images/243.png)

At this point, the administrator has successfully approved and provisioned access to the application requested by the end user.

2. The user can now log in and access the newly assigned application from their Okta dashboard.
   ![descriptive alt text](./images/244.png)
This validates a correct end‑to‑end configuration.

---

## ✅ Conclusion

This lab provided a complete, practical walkthrough of enabling and managing **Access Request and Approval workflows** in Okta.  
You enabled Self Service app requests, configured approval requirements, assigned approvers, set expiration conditions, and tested the entire workflow from both the admin and end‑user perspectives.

These steps mirror real‑world Identity Governance and Administration (IGA) processes, demonstrating how organizations control access through request workflows, approvals, and audit‑ready notifications.  
Mastering this workflow showcases your ability to support secure, scalable, and compliant access provisioning using Okta.

---

**Author:** *Qadriyyah Abdullah [Ms Bey]*  
**Date:** *December 2025*  
**Tags:** `Okta` `AccessRequests` `IdentityGovernance` `AdminWorkflow` `SSO` `IAM`
