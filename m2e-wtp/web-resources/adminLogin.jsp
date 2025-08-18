<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Pahana Edu</title>
    <style>
        * {
          box-sizing: border-box;
        }

        body {
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          background: url('assets/image/image3.jpg') no-repeat center center fixed;
          background-size: cover;
          margin: 0;
          padding: 0;
          display: flex;
          align-items: center;
          justify-content: center;
          height: 100vh;
          position: relative;
        }

        body::before {
          content: "";
          position: fixed;
          top: 0; left: 0; right: 0; bottom: 0;
          background: rgba(0, 0, 0, 0.3);
          z-index: -1;
        }

        .container {
          background: rgba(255, 255, 255, 0.95);
          padding: 40px 35px;
          border-radius: 16px;
          box-shadow:
            0 8px 30px rgba(0, 0, 0, 0.2),
            inset 0 0 50px rgba(255, 255, 255, 0.3);
          width: 100%;
          max-width: 420px;
          text-align: center;
          animation: fadeIn 0.8s ease forwards;
        }

        .container h2 {
          background: linear-gradient(135deg, #4facfe, #00f2fe);
          color: white;
          padding: 18px 0;
          border-radius: 12px;
          margin-bottom: 30px;
          font-size: 28px;
          font-weight: 700;
          text-shadow: 0 2px 5px rgba(0, 0, 0, 0.25);
        }

        label {
          display: block;
          text-align: left;
          margin: 12px 0 6px;
          font-weight: 600;
          color: #444;
          font-size: 15px;
        }

        input[type="text"],
        input[type="password"] {
          width: 100%;
          padding: 14px 15px;
          margin-bottom: 20px;
          border: 1.8px solid #ccc;
          border-radius: 10px;
          font-size: 16px;
          transition: border-color 0.3s ease;
          box-shadow: inset 1px 1px 3px rgba(0,0,0,0.05);
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
          border-color: #0099ff;
          outline: none;
          box-shadow: 0 0 8px #00bfff88;
        }

        button {
          background: linear-gradient(135deg, #007bff, #0056b3);
          color: white;
          border: none;
          padding: 14px;
          width: 100%;
          border-radius: 12px;
          font-size: 18px;
          font-weight: 700;
          cursor: pointer;
          box-shadow: 0 6px 15px rgba(0, 123, 255, 0.5);
          transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
          background: linear-gradient(135deg, #0056b3, #003f7f);
          transform: translateY(-3px);
        }

        .back-button {
          margin-top: 25px;
          display: inline-block;
          background: #6c757d;
          color: white;
          padding: 12px 28px;
          font-size: 16px;
          border-radius: 10px;
          text-decoration: none;
          font-weight: 600;
          box-shadow: 0 4px 12px rgba(108, 117, 125, 0.5);
          transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .back-button:hover {
          background: #495057;
          transform: scale(1.05);
        }

        @keyframes fadeIn {
          0% {
            opacity: 0;
            transform: translateY(-15px);
          }
          100% {
            opacity: 1;
            transform: translateY(0);
          }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2> Admin Login</h2>
        <form action="loginServlet" method="post">
            <input type="hidden" name="role" value="admin">

            <label for="username">Username:</label>
            <input type="text" name="username" id="username" placeholder="Enter Admin Username" required>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" placeholder="Enter Password" required>

            <button type="submit">Login</button>
        </form>

        <a class="back-button" href="loginnav.jsp">← Back</a>
    </div>
</body>
</html>
