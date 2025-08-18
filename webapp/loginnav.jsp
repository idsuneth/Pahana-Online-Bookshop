<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Navigation - Pahana Edu</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('assets/image/image1.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Glass effect container */
        .container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 320px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: bold;
            color: #ffffff;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
        }

        /* Login buttons */
        .login-btn {
            display: block;
            width: 220px;
            margin: 12px auto;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            background: linear-gradient(135deg, #00bfa5, #00796b);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .login-btn:hover {
            transform: translateY(-3px);
            background: linear-gradient(135deg, #00796b, #004d40);
            box-shadow: 0 6px 14px rgba(0,0,0,0.3);
        }

        /* Back button style */
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            background: linear-gradient(135deg, #ff8a65, #d84315);
            color: white;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .back-btn:hover {
            background: linear-gradient(135deg, #d84315, #bf360c);
            transform: scale(1.05);
        }

        /* Animation for fade-in */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-10px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Login As</h2>
    <a href="adminLogin.jsp" class="login-btn">Admin</a>
    <a href="cashierlogin.jsp" class="login-btn">Cashier</a>
    <a href="customerLogin.jsp" class="login-btn">Customer</a>

    <!-- Back button linking to home.jsp -->
    <a href="index.jsp" class="back-btn">⬅ Back to Home</a>
</div>

</body>
</html>
