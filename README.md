# 📚 Pahana Online Book Shop – Java Project  

![Java](https://img.shields.io/badge/Java-17-orange?logo=java)  
![MySQL](https://img.shields.io/badge/MySQL-Database-blue?logo=mysql)  
![Maven](https://img.shields.io/badge/Maven-Build%20Tool-red?logo=apache-maven)  
![GitHub](https://img.shields.io/badge/Version%20Control-GitHub-black?logo=github)  


> 🛒 A Java-based **Online Book Shop Management System** with admin, cashier, customer, and billing functionalities.  
> Developed as part of **CIS6003 – Advanced Programming Module**.  

---
## ✨ Features  
✅ **Admin Panel** – Manage books, customers, and cashiers  
✅ **Customer Management** – Search books, manage profile, purchase books  
✅ **Billing System** – Generate invoices & order history  
✅ **Database Integration** – MySQL database with `database.sql` file  
✅ **User-Friendly UI** – Clean, responsive navigation  

---
## 🛠️ Technologies Used  
- ☕ Java (JDK 17)  
- 📦 Maven (Dependency Management)  
- 🗄️ MySQL Database  
- 🔗 JDBC for database connectivity  
- 🖥️ Eclipse IDE  

---
## ⚙️ Setup Instructions  
### 1️⃣ Clone Repository
>git clone https://github.com/idsuneth/Pahana-Online-Bookshop.git
>
### 2️⃣ Import in Eclipse
>Import in Eclipse
>
✅File → Import → Existing Maven Project → Select folder

### 3️⃣ Database Setup
>Run database.sql in MySQL (XAMPP or Workbench)
>Update credentials in DBConnection.java if needed:
private static final String USERNAME = "root";
private static final String PASSWORD = "yourpassword";
private static final String DB_URL = "jdbc:mysql://localhost:3306/pahana_bookshop";
>
4️⃣ Run Project
>Launch from Eclipse
>Default Admin Login:
>
Username: admin
Password: admin123

📝 Release Notes
🔖 v1.0 – Initial Release (18-Aug-2025)
First release of the Pahana Online Book Shop system.Core modules implemented: Customer management, cashier management, item (book) database, and billing.Admin login & authentication included.
🔖 v1.1 – Added database.sql with table structures and sample data (18-Aug-2025)
Added database sql file with all table structures and sample data for easy setup.
🔖 v1.2 – Bug Tracking Update (19-Aug-2025)
Bill Printing Issue
Problem: When generating a bill, the system prints the entire page instead of just the bill section.
🔖 v1.3 – Customer Delete Function Error – Fixes (19-Aug-2025)
Resolved Customer Delete Bug caused by foreign key constraints
Customer delete now works correctly
🔖 v1.4 – Final Submission Release (20-Aug-2025)
Minor UI improvements and polish
Stable version ready for submission

📷 Screenshots

📌Home Page
📌Login Page
📌Admin Dashboard
📌Cashier Dashboard
📌Customer Dashboard
📌Add customer page
📌Add Cashier Page
📌Add item page
📌Calculate bill 
📌Help

👨‍💻 Author

H.M.I.D SUNETH
🎓 CIS6003 – Advanced Programming

⭐ If you like this project, don’t forget to star the repo on GitHub!
