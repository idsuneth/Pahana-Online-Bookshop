<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Customer Login - Pahana Edu</title>
    <style>
        /* Reset and box-sizing */
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #a1c4fd, #c2e9fb);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('assets/image/image3.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #34495e;
        }

        .container {
            background: #fff;
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            font-weight: 800;
            font-size: 28px;
            margin-bottom: 30px;
            color: #1a237e;
            letter-spacing: 1.1px;
        }

        form label {
            display: block;
            text-align: left;
            margin: 15px 0 8px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px 15px;
            border-radius: 10px;
            border: 1.8px solid #bdc3c7;
            font-size: 16px;
            outline-offset: 2px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #304ffe;
            box-shadow: 0 0 8px rgba(48, 79, 254, 0.4);
            outline: none;
        }

        button {
            margin-top: 30px;
            width: 100%;
            padding: 14px 0;
            border-radius: 35px;
            border: none;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            background-color: #304ffe;
            color: white;
            box-shadow: 0 8px 20px rgba(48,79,254,0.5);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        button:hover {
            background-color: #1a237e;
            box-shadow: 0 10px 25px rgba(26, 35, 126, 0.7);
        }

        .back-button {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 20px;
            background-color: #ff7043;
            color: white;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 700;
            transition: background-color 0.3s ease;
            user-select: none;
        }

        .back-button:hover {
            background-color: #bf360c;
        }

        p {
            margin-top: 15px;
            font-weight: 700;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>👤 Customer Login</h2>
        <form action="CustomerLoginServlet" method="post">
            <label for="account_number">Account Number:</label>
            <input type="text" name="account_number" id="account_number" placeholder="Enter Account Number" required>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" placeholder="Enter Password" required>

            <button type="submit">Login</button>
        </form>

        <% String error = request.getParameter("error");
           if (error != null) { %>
            <p><%= error %></p>
        <% } %>

        <a class="back-button" href="loginnav.jsp">← Back</a>
    </div>
</body>
</html>
