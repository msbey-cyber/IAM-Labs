# 🧭 Okta Administration Lab – User and Group Management

This project demonstrates key day‑to‑day administrative tasks in **Okta**, including creating users, managing groups, resetting passwords, and disabling accounts.  
It provides hands‑on practice managing identity lifecycle operations in Okta’s Admin Console.

> Based on skills aligned with Okta Workforce Identity and Access Administration objectives.

---

## 🧰 Technologies Used
- Okta Admin Console (Developer Tenant)  
- Okta Directory Management  
- Group and Access Assignments  
- User Lifecycle Management (Activation, Password Reset, Suspension)  

---

## 🧠 Key Learning Objectives
- Create and manage users in Okta Directory.  
- Build and assign groups for role‑based access control.  
- Reset or change user passwords securely.  
- Suspend and reactivate user accounts to control access.  

---

# 🧩 Exercise 1 – Create a New User

### **Task 1: Sign in to the Okta Admin Console**
1. Go to `https://integrator-XXXXXXX-admin.okta.com` (Replace `XXXXXX` with your Okta domain ID).  
2. Sign in using your Okta administrator credentials.

### **Task 2: Create a User**
3. In the left sidebar, navigate to **Directory → People**.
![descriptive alt text](./images/71.png)  
4. Click **Add Person**.
![descriptive alt text](./images/72.png) 
5. Fill in user details:  
   - **First name:** Test  
   - **Last name:** User  
   - **Username:** `testuser@cybergeeks.store`  
   - **Primary email:** `testuser@cybergeeks.store`  
Under **Activation Options:**  
   - Select **Activate now**.  
   - Check **I will set password** and enter a temporary password. 
Click **Save**.
![descriptive alt text](./images/73.png)

### **Task 3: Verify User Creation**
1. Open an Incognito tab and sign in as Test User by entering the testuser email, temporary password, and click "Verify".
![descriptive alt text](./images/88.png)
2. Enter a new password that meets the listed password requirements, then click "Change Password".
![descriptive alt text](./images/89.png)
3. Set up the Okta Verify app on your mobile device and enter the generated numbers.
![descriptive alt text](./images/90.png)
4. In the upper right-hand corner of the screen, you should see you're logged in as Test User
![descriptive alt text](./images/91.png)
5. Sign out of Test User's account and close the Incognito window.
![descriptive alt text](./images/92.png)
6. Return to **Directory → People** to search for `Test User` and verify the account appears with the correct attributes.
![descriptive alt text](./images/93.png)  

---

# 🧩 Exercise 2 – Create and Assign Groups

### **Task 1: Create a Group**
1. In the left menu, select **Directory → Groups**. Click **Add Group**.
![descriptive alt text](./images/74.png) 
3. Enter the name and description of the new group:  
   - **Name:** `Engineering‑Team`  
   - **Description:** `All engineering staff`  
Click **Save**.
![descriptive alt text](./images/75.png)
4. Click Directory -> Groups in the left-hand menu, select "All" under "Group source type" and verify that "Engineering Team" was added.
![descriptive alt text](./images/76.png)

### **Task 2: Add Members**
1. Select the Engineering Team under Group Name and click **Assign People**.
![descriptive alt text](./images/77.png)
3. Click the "+" button to the right of `Test User` to add them to the Engineering Team group.
4. ![descriptive alt text](./images/78.png)  
5. Click **Assign**, then **Done**.
![descriptive alt text](./images/79.png)

### **Task 3: Validate Group Membership**
1. In **Directory → Groups**, search for and click on `Engineering‑Team` to confirm that the group lists `Test User` as a member.
![descriptive alt text](./images/80.png)
![descriptive alt text](./images/94.png)

---

# 🧩 Exercise 3 – Reset a User Password

### **Task 1: Issue a Password Reset**
1. Navigate to **Directory → People** and click the user’s name (`Test User`).
![descriptive alt text](./images/81.png)
3. Select **Resend Password Email → Reset Password**.
![descriptive alt text](./images/82.png)
5. Choose one of the following:  
   - **Send a reset password email** – Okta emails the user a reset link.  
   - **Create a temporary password** – creates and displays a temporary login password.
Then click "Reset Password"
![descriptive alt text](./images/83.png)
6. Communicate the reset details to the user as appropriate.

### **Task 2: Validate Password Reset**
1. Attempt to sign in as `Test User` using the old password → login fails.
![descriptive alt text](./images/111.png)
3. Use the new temporary password or reset link → successfully sign in after reset.  

---

# 🧩 Exercise 4 – Suspend or Disable a User Account

### **Task 1: Locate the User**
1. Go to **Directory → People** and open `Test User`.
![descriptive alt text](./images/84.png)

### **Task 2: Suspend the User**
1. Click **More Actions → Suspend**.
![descriptive alt text](./images/85.png)
3. Confirm the suspension when prompted.

### **Task 3: Validate Suspension**
1. Attempt to sign in as `Test User` → login fails with “Unable to sign in” message.
![descriptive alt text](./images/111.png)  
3. In the Okta Admin Console, notice the `Suspended` status under Test User's account.
![descriptive alt text](./images/86.png)

> Note: Suspended users can be re‑enabled later using **More Actions → Unsuspend**.

---

## ✅ Conclusion

This lab provided practical hands‑on experience with foundational **Okta administration tasks**. You created and managed users, established groups for access control, performed a secure password reset, and suspended a user account to simulate lifecycle offboarding. These activities demonstrated core skills for Identity and Access Management (IAM) administrators—including user provisioning, group‑based access, and account lifecycle governance—within the Okta Admin Console.

---

**Author:** *Qadriyyah Abdullah [Ms Bey]*  
**Date:** *December 2025*  
**Tags:** `Okta` `Identity & Access Management` `Lifecycle Governance` `User Administration` `Password Reset` `Group Management`
