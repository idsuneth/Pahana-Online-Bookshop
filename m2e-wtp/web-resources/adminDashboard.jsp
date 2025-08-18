<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard - Pahana Edu</title>
    <style>
        /* Fonts & Reset */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);
            margin: 0;
            padding: 0;
            color: #204051;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: url('assets/image/image2.jpg') no-repeat center center fixed;
        }

        /* Back button */
        .back-button-container {
            text-align: right;
            padding: 15px 25px;
            background: #d0e8f2cc;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .back-button {
            background: #4caf50;
            color: white;
            border: none;
            padding: 12px 26px;
            border-radius: 30px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 6px 15px rgba(76, 175, 80, 0.5);
            transition: background 0.3s ease, box-shadow 0.3s ease;
            user-select: none;
            font-size: 1rem;
        }
        .back-button:hover {
            background: #66bb6a;
            box-shadow: 0 8px 20px rgba(102, 187, 106, 0.8);
        }

        /* Title */
        h1 {
            text-align: center;
            color: #2c6e49;
            margin: 40px 0 60px 0;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 3px;
            text-shadow: 1px 1px 3px #8cd790;
        }

        /* Dashboard grid container */
        .dashboard-container {
            max-width: 960px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
            padding: 0 25px 50px 25px;
            flex-grow: 1;
        }

        /* Dashboard buttons */
        button.dashboard-options {
            background: #e0f2f1;
            color: #2c6e49;
            border: 2px solid #2c6e49;
            border-radius: 20px;
            padding: 40px 15px;
            font-size: 1.2rem;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 10px 25px rgba(44, 110, 73, 0.3);
            text-align: center;
            user-select: none;
            transition: transform 0.25s ease, box-shadow 0.25s ease, background 0.3s ease, color 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        button.dashboard-options i {
            font-size: 3rem;
            margin-bottom: 16px;
            color: #2c6e49;
            filter: drop-shadow(0 0 4px rgba(44, 110, 73, 0.7));
        }
        button.dashboard-options:hover {
            background: #2c6e49;
            color: #a1c4fd;
            box-shadow: 0 15px 35px rgba(161, 196, 253, 0.6);
            transform: translateY(-8px) scale(1.05);
        }

        /* Footer styling */
        footer {
            background: #d0e8f2;
            text-align: center;
            padding: 20px 10px;
            font-size: 1rem;
            color: #2c6e49;
            box-shadow: inset 0 1px 5px rgba(44, 110, 73, 0.15);
            user-select: none;
            font-style: italic;
            letter-spacing: 1px;
        }

        /* Responsive font sizes */
        @media (max-width: 600px) {
            button.dashboard-options {
                font-size: 1rem;
                padding: 30px 10px;
            }
            button.dashboard-options i {
                font-size: 2.5rem;
                margin-bottom: 10px;
            }
        }
    </style>
    <!-- FontAwesome CDN for icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-p0VjH6XoiG7BQ0e0a3t8jqjOKYCNjjxoiGQJESI5rsuF+fyKq3CQWEdkkJl5C0qBEr2sAdTnscJr4Sb7VTjZ0w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
</head>
<body>
    <div class="back-button-container">
        <button class="back-button" onclick="location.href='adminLogin.jsp'">
            ← Back to Login
        </button>
    </div>

    <h1>Welcome to Admin Dashboard</h1>

    <div class="dashboard-container">
        <button class="dashboard-options" onclick="location.href='AddCustomer.jsp'">
            <i class="fas fa-user-plus"></i>
            Add Customer
        </button>
        <button class="dashboard-options" onclick="location.href='ViewCustomers.jsp'">
            <i class="fas fa-users"></i>
            View Customers
        </button>
        <button class="dashboard-options" onclick="location.href='AddCashier.jsp'">
            <i class="fas fa-user-tie"></i>
            Add Cashier
        </button>
        <button class="dashboard-options" onclick="location.href='ViewCashiers.jsp'">
            <i class="fas fa-user-friends"></i>
            View Cashiers
        </button>
        <button class="dashboard-options" onclick="location.href='AddItem.jsp'">
            <i class="fas fa-box-open"></i>
            Add Item
        </button>
        <button class="dashboard-options" onclick="location.href='ViewItems.jsp'">
            <i class="fas fa-list-alt"></i>
            View Items
        </button>
        <button class="dashboard-options" onclick="location.href='CalculateBill.jsp'">
            <i class="fas fa-calculator"></i>
            View Calculate Bill
        </button>
    </div>
    
    <footer>
        &copy; 2025 Pahana Edu Bookshop. All rights reserved.
    </footer>
</body>
</html>
