<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Customer - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e0f7fa;
            margin: 0;
            padding: 40px;
            color: #004d40;
            background: url('assets/image/image3.jpg') no-repeat center center fixed;
        }
        .back-button-container {
            max-width: 500px;
            margin: 0 auto 20px auto;
            text-align: right;
        }
        .back-button {
            background: #00796b;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 121, 107, 0.4);
            transition: background 0.3s ease;
            font-size: 1rem;
        }
        .back-button:hover {
            background: #004d40;
        }
        form {
            background: white;
            max-width: 500px;
            margin: 0 auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,77,64,0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #00796b;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px 10px;
            margin-top: 5px;
            border: 1.5px solid #00796b;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button[type="submit"] {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background: #00796b;
            color: white;
            border: none;
            border-radius: 30px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button[type="submit"]:hover {
            background: #004d40;
        }
        .message {
            margin-top: 20px;
            padding: 12px;
            border-radius: 5px;
            text-align: center;
        }
        .success {
            background: #c8e6c9;
            color: #2e7d32;
        }
        .error {
            background: #ffcdd2;
            color: #c62828;
        }
    </style>
</head>
<body>

    <div class="back-button-container">
        <button class="back-button" onclick="location.href='adminDashboard.jsp'">
            ← Back to Admin Dashboard
        </button>
    </div>

    <form action="addCustomer" method="post">
        <h2>Add New Customer</h2>

        <label for="accountNumber">Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" required />

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required />

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required />

        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" required />

        <label for="nic">NIC:</label>
        <input type="text" id="nic" name="nic" required />

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required />

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required />

        <button type="submit">Add Customer</button>

        <c:if test="${not empty message}">
            <div class="message success">${message}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="message error">${errorMessage}</div>
        </c:if>
    </form>
</body>
</html>
