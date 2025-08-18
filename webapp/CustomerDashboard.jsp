<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Customer Dashboard - Pahana Edu</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<style>
    /* Reset */
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #e0f7fa, #fce4ec);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        user-select: none;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        color: #37474f;
        background: url('assets/image/image1.jpg') no-repeat center center fixed;
    }

    /* Navbar with glass effect */
    .navbar {
        background: rgba(255 255 255 / 0.4);
        backdrop-filter: saturate(180%) blur(12px);
        box-shadow: 0 8px 32px rgba(31, 38, 135, 0.1);
        padding: 25px 20px;
        text-align: center;
        font-size: 28px;
        font-weight: 700;
        letter-spacing: 2px;
        text-transform: uppercase;
        color: #00796b;
        user-select: none;
        position: sticky;
        top: 0;
        z-index: 100;
        border-bottom: 1.5px solid rgba(0, 121, 107, 0.3);
    }

    /* Dashboard container */
    .dashboard {
        flex: 1;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        padding: 60px 25px;
        gap: 36px;
        max-width: 1100px;
        margin: 0 auto;
    }

    /* Cards with soft neumorphism */
    .card {
        width: 220px;
        height: 220px;
        background: #f0f4f8;
        border-radius: 28px;
        box-shadow:
            8px 8px 15px #c7d1da,
            -8px -8px 15px #ffffff;
        color: #37474f;
        text-decoration: none;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 30px 20px;
        transition:
            transform 0.3s cubic-bezier(.4,0,.2,1),
            box-shadow 0.3s ease,
            color 0.3s ease;
        cursor: pointer;
        user-select: none;
        border: 2px solid transparent;
    }

    .card i {
        font-size: 64px;
        color: #00796b;
        margin-bottom: 20px;
        filter: drop-shadow(0 3px 3px rgba(0, 121, 107, 0.3));
        transition: color 0.3s ease;
    }

    .card h3 {
        font-size: 22px;
        font-weight: 700;
        letter-spacing: 0.04em;
        transition: color 0.3s ease;
    }

    .card:focus,
    .card:hover {
        transform: translateY(-10px) scale(1.05);
        box-shadow:
            4px 4px 10px #a8c0c8,
            -4px -4px 10px #ffffff;
        border-color: #00796b;
        color: #004d40;
    }

    .card:focus i,
    .card:hover i {
        color: #004d40;
        filter: drop-shadow(0 4px 5px rgba(0, 77, 64, 0.6));
    }

    .card:focus h3,
    .card:hover h3 {
        color: #004d40;
    }

    /* Footer with subtle glass effect */
    .footer {
        background: rgba(255 255 255 / 0.35);
        backdrop-filter: saturate(180%) blur(10px);
        box-shadow: inset 0 0 10px rgba(255, 255, 255, 0.4);
        color: #00796b;
        text-align: center;
        padding: 20px;
        font-size: 15px;
        font-weight: 600;
        letter-spacing: 1px;
        user-select: none;
        border-top: 1.5px solid rgba(0, 121, 107, 0.3);
    }

    /* Responsive */
    @media (max-width: 768px) {
        .dashboard {
            gap: 28px;
            padding: 40px 15px;
        }
        .card {
            width: 100%;
            max-width: 320px;
            height: 220px;
        }
    }
</style>
</head>
<body>

<div class="navbar" role="banner" aria-label="Site navigation">
    Welcome  | Customer Dashboard - Pahana Edu
</div>

<div class="dashboard" role="main">
    <a class="card" href="ViewCustomerProfile.jsp" title="View your profile" role="button" tabindex="0" aria-label="View Profile">
        <i class="fas fa-user-circle" aria-hidden="true"></i>
        <h3>View Profile</h3>
    </a>

    <a class="card" href="ViewMyBills.jsp" title="See your bills" role="button" tabindex="0" aria-label="View My Bills">
        <i class="fas fa-receipt" aria-hidden="true"></i>
        <h3>View My Bills</h3>
    </a>

    <a class="card" href="logout.jsp" title="Logout from your account" role="button" tabindex="0" aria-label="Logout">
        <i class="fas fa-sign-out-alt" aria-hidden="true"></i>
        <h3>Logout</h3>
    </a>
</div>

<div class="footer" role="contentinfo">
    &copy; 2025 Pahana Edu. All rights reserved.
</div>

</body>
</html>
