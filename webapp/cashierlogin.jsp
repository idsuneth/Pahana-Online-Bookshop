<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cashier Login - Pahana Edu</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background: url('assets/image/image3.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .login-container {
            background: #ffffffdd;
            backdrop-filter: blur(12px);
            padding: 40px 35px;
            border-radius: 18px;
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.18);
            width: 100%;
            max-width: 420px;
            text-align: center;
            position: relative;
            transition: box-shadow 0.3s ease;
        }

        .login-container:hover {
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
        }

        .login-container h2 {
            margin-bottom: 30px;
            color: #1a237e;
            font-size: 30px;
            font-weight: 800;
            letter-spacing: 1.2px;
            text-shadow: 1px 1px 2px #b0c4de;
        }

        .login-container label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            font-weight: 700;
            color: #344055;
            letter-spacing: 0.02em;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 14px 16px;
            margin-bottom: 24px;
            border: 2px solid #a1c4fd;
            border-radius: 12px;
            font-size: 17px;
            transition: border-color 0.3s ease;
            box-shadow: inset 0 2px 6px #e0f0ff;
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            border-color: #304ffe;
            outline: none;
            box-shadow: 0 0 8px #304ffe99;
        }

        .login-container input[type="submit"] {
            background: linear-gradient(45deg, #304ffe, #1a237e);
            color: white;
            border: none;
            padding: 14px 0;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            width: 100%;
            box-shadow: 0 6px 15px rgba(48, 79, 254, 0.6);
            transition: background 0.3s ease, box-shadow 0.3s ease;
        }

        .login-container input[type="submit"]:hover {
            background: linear-gradient(45deg, #1a237e, #304ffe);
            box-shadow: 0 8px 22px rgba(26, 35, 126, 0.85);
        }

        .back-button {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 26px;
            background-color: #ff7043;
            color: white;
            border-radius: 14px;
            text-decoration: none;
            font-weight: 700;
            font-size: 15px;
            box-shadow: 0 6px 12px rgba(255, 112, 67, 0.5);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            user-select: none;
        }

        .back-button:hover {
            background-color: #bf360c;
            box-shadow: 0 10px 25px rgba(191, 54, 12, 0.7);
        }

        .error-message {
            color: #d32f2f;
            margin-top: 18px;
            font-weight: 700;
            font-size: 15px;
            letter-spacing: 0.03em;
            text-shadow: 1px 1px 2px #fce4ec;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Cashier Login</h2>
    <form action="CashierLoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <input type="submit" value="Login">
    </form>

    <a class="back-button" href="loginnav.jsp">← Back</a>

    <% 
        String error = request.getParameter("error");
        if (error != null) { 
    %>
        <div class="error-message"><%= error %></div>
    <% 
        } 
    %>
</div>

</body>
</html>
