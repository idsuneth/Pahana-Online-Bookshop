<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Cashier Dashboard</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
<!-- Font Awesome CDN -->
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
/>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #81c784, #4caf50);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #1b5e20;
    }

    .container {
        background: #ffffffcc; /* white with some transparency */
        max-width: 480px;
        width: 90%;
        padding: 40px 35px;
        border-radius: 16px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        text-align: center;
        user-select: none;
    }

    h1 {
        font-weight: 600;
        font-size: 28px;
        margin-bottom: 8px;
        color: #2e7d32;
        letter-spacing: 0.05em;
    }

    p.status {
        font-weight: 500;
        color: #388e3c;
        margin-bottom: 32px;
        font-size: 18px;
        letter-spacing: 0.04em;
    }

    h2 {
        font-weight: 600;
        font-size: 22px;
        margin-bottom: 25px;
        letter-spacing: 0.1em;
        text-transform: uppercase;
        color: #1b5e20;
    }

    ol {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-direction: column;
        gap: 20px; /* space between boxes */
    }

    ol li {
        background: #4caf50;
        border-radius: 12px;
        box-shadow: 0 8px 15px rgba(76, 175, 80, 0.4);
        transition: all 0.3s ease;
    }

    ol li:hover {
        background: #388e3c;
        box-shadow: 0 12px 25px rgba(56, 142, 60, 0.6);
        transform: translateY(-4px);
    }

    ol li a {
        display: flex;
        align-items: center;
        color: #fff;
        text-decoration: none;
        padding: 20px 30px;
        font-size: 18px;
        font-weight: 600;
        letter-spacing: 0.04em;
        border-radius: 12px;
        user-select: none;
    }

    ol li a i {
        margin-right: 14px;
        font-size: 24px;
        vertical-align: middle;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Welcome Cashier: <%= session.getAttribute("cashierUsername") %></h1>
    <p class="status">Login Successful </p>

    <h2>Cashier Dashboard</h2>

    <ol>
        <li><a href="Cashier_displayCustomers.jsp"><i class="fa-solid fa-list-check"></i> Display Customers</a></li>
        <li><a href="Cashier_displayItems.jsp"><i class="fa-solid fa-box"></i> Display Items</a></li>
        <li><a href="Billing.jsp"><i class="fa-solid fa-receipt"></i> Calculate & Print Bill</a></li>
        <li><a href="index.jsp"><i class="fa-solid fa-door-open"></i> Exit</a></li>
    </ol>
</div>

</body>
</html>
