<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Pahana Bookshop - Help</title>
    <!-- Google Fonts & Material Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <style>
        body, html {
            margin: 0; padding: 0; height: 100%;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('assets/image/image1.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            position: relative;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(10, 25, 80, 0.6);
            z-index: -1;
        }
        .navbar {
            background: rgba(30, 144, 255, 0.95);
            padding: 18px 40px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.5);
            position: sticky;
            top: 0;
            z-index: 100;
            border-bottom: 1px solid rgba(255,255,255,0.3);
            user-select: none;
        }
        .navbar h1 {
            margin: 0;
            font-size: 2.25rem;
            letter-spacing: 3px;
            font-weight: 700;
            text-transform: uppercase;
            text-shadow: 0 1px 6px rgba(0,0,0,0.4);
        }
        .container {
            max-width: 780px;
            margin: 100px auto 70px;
            background: rgba(30, 144, 255, 0.65);
            border-radius: 24px;
            padding: 50px 50px 60px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.55);
        }
        h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            text-shadow: 0 1px 5px rgba(0,0,0,0.3);
        }
        ul {
            font-size: 1.2rem;
            line-height: 1.8;
            margin-left: 20px;
            list-style-type: disc;
        }
        ul li {
            margin-bottom: 15px;
            font-weight: 500;
        }
        a.back-link {
            display: inline-block;
            margin-top: 40px;
            padding: 12px 28px;
            background: linear-gradient(135deg, #ff8c00, #ffa500);
            color: white;
            font-weight: 700;
            border-radius: 50px;
            text-decoration: none;
            box-shadow: 0 6px 18px rgba(255,140,0,0.65);
            transition: all 0.35s ease;
            user-select: none;
            letter-spacing: 0.8px;
            font-size: 1.1rem;
        }
        a.back-link:hover {
            background: linear-gradient(135deg, #ffa500, #ff8c00);
            box-shadow: 0 10px 28px rgba(255,140,0,0.85);
            transform: scale(1.05);
        }
        /* Responsive */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 40px 25px 50px;
                margin: 80px auto 60px;
            }
            ul {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Pahana Bookshop - Help</h1>
    </div>

    <div class="container">
        <h2>System Usage Guidelines</h2>
        <ul>
            <li><strong>User Authentication:</strong> Log in with your username and password to access the system securely.</li>
            <li><strong>Add New Customers:</strong> Use the “Add Customer” section to register new accounts with required details including account number, name, address, phone, and units consumed.</li>
            <li><strong>Edit Customer Info:</strong> Update existing customer details to keep data accurate.</li>
            <li><strong>Manage Items:</strong> Add, update, or delete items available for sale to keep your inventory current.</li>
            <li><strong>View Account Details:</strong> Search and display customer account information easily.</li>
            <li><strong>Calculate and Print Bills:</strong> Generate bills automatically based on units consumed, and print for your customers.</li>
            <li><strong>Help Section:</strong> Access this guide anytime for assistance with using the system.</li>
            <li><strong>Exit System:</strong> Use the logout or exit option to safely close your session.</li>
        </ul>

        <a href="index.jsp" class="back-link">
            <span class="material-icons" style="vertical-align: middle; margin-right: 6px;">arrow_back</span>
            Back to Login
        </a>
    </div>
</body>
</html>
