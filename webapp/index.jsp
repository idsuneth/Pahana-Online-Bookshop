<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Pahana Bookshop</title>
    <!-- Google Fonts: Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            background: url('assets/image/image1.jpg') no-repeat center center fixed;
            background-size: cover;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            position: relative;
        }

        /* Overlay for readability */
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(10, 25, 80, 0.55);
            z-index: -1;
        }

        /* Navbar */
        .navbar {
            background: rgba(30, 144, 255, 0.95);
            padding: 18px 40px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
            position: sticky;
            top: 0;
            z-index: 100;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
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

        /* Main container */
        .container {
            max-width: 720px;
            margin: 110px auto 50px;
            background: rgba(30, 144, 255, 0.65);
            border-radius: 24px;
            padding: 60px 50px 70px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.55);
            text-align: center;
            animation: fadeInUp 1s ease forwards;
        }

        .container h2 {
            font-size: 2.75rem;
            font-weight: 700;
            margin-bottom: 20px;
            letter-spacing: 1.2px;
            text-shadow: 0 1px 5px rgba(0,0,0,0.3);
        }

        .container p {
            font-size: 1.25rem;
            line-height: 1.7;
            margin-bottom: 45px;
            font-weight: 500;
        }

        /* Button group */
        .button-group {
            display: flex;
            justify-content: center;
            gap: 28px;
            flex-wrap: wrap;
            margin-bottom: 40px; /* spacing below buttons */
        }

        .button-group a {
            padding: 16px 48px;
            background: linear-gradient(135deg, #ff8c00, #ffa500);
            color: white;
            font-weight: 700;
            text-decoration: none;
            border-radius: 50px;
            box-shadow: 0 6px 18px rgba(255, 140, 0, 0.65);
            transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            user-select: none;
            letter-spacing: 0.8px;
            font-size: 1.1rem;
            will-change: transform, box-shadow;
        }

        .button-group a:hover,
        .button-group a:focus {
            background: linear-gradient(135deg, #ffa500, #ff8c00);
            box-shadow: 0 10px 28px rgba(255, 140, 0, 0.85);
            transform: scale(1.1);
            outline: none;
        }

        .button-group a .material-icons {
            margin-right: 8px;
            font-size: 1.3rem;
        }

        /* Footer */
        .footer {
            background: rgba(10, 25, 80, 0.9);
            padding: 20px 30px;
            font-size: 14px;
            text-align: center;
            font-weight: 600;
            box-shadow: 0 -6px 22px rgba(0, 0, 0, 0.65);
            position: fixed;
            bottom: 0;
            width: 100%;
            user-select: none;
            line-height: 1.35;
            letter-spacing: 0.8px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 45px 25px 55px;
                margin: 90px auto 55px;
            }
            .button-group {
                flex-direction: column;
                gap: 20px;
            }
            .button-group a {
                width: 100%;
                text-align: center;
                padding: 18px 0;
                font-size: 1.15rem;
            }
        }

        /* Simple fadeInUp animation */
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(25px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Pahana Bookshop</h1>
    </div>

    <!-- Welcome Section -->
    <div class="container">
        <div class="button-group">
            <a href="loginnav.jsp"><span class="material-icons">login</span>Login</a>
            <a href="help.jsp"><span class="material-icons">help</span>Help</a>
        </div>

        <h2>Welcome to Pahana Bookshop</h2>
        <p>Manage customers, items, and billing operations with ease using our web-based management system.</p>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Pahana Bookshop | All Rights Reserved.</p>
        <p>📌 Developed by Pahana Edu IT Team | 📧 support@pahanaedu.lk | ☎ +94 77 123 4567</p>
    </div>
</body>
</html>
