<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>
<%
    // Get account number from session
    String accountNumber = (String) session.getAttribute("accountNumber");
    if (accountNumber == null) {
        // Not logged in, redirect to login page
        response.sendRedirect("CustomerLogin.jsp");
        return;
    }

    String username = "";
    String name = "";
    String nic = "";
    String address = "";
    String phoneNumber = "";

    try (Connection conn = DBUtil.getConnection()) {
        String sql = "SELECT username, name, nic, address, phone_number FROM customer WHERE account_number = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, accountNumber);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    username = rs.getString("username");
                    name = rs.getString("name");
                    nic = rs.getString("nic");
                    address = rs.getString("address");
                    phoneNumber = rs.getString("phone_number");
                } else {
                    out.println("<p>User profile not found.</p>");
                    return;
                }
            }
        }
    } catch (Exception e) {
        out.println("<p>Error loading profile: " + e.getMessage() + "</p>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Customer Profile - Pahana Edu</title>
<style>
    /* Reset */
    * {
        box-sizing: border-box;
    }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #a8edea, #fed6e3);
        margin: 0;
        padding: 40px 20px;
        color: #2c3e50;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .profile-container {
        background: #ffffffee;
        max-width: 600px;
        width: 100%;
        padding: 35px 40px;
        border-radius: 15px;
        box-shadow:
            0 10px 20px rgba(0, 0, 0, 0.1),
            inset 0 0 10px rgba(255, 255, 255, 0.6);
        backdrop-filter: saturate(180%) blur(10px);
        border: 1px solid #a1d8d3;
        transition: box-shadow 0.3s ease;
    }
    .profile-container:hover {
        box-shadow:
            0 20px 40px rgba(0, 0, 0, 0.15),
            inset 0 0 15px rgba(255, 255, 255, 0.8);
    }
    h2 {
        text-align: center;
        font-weight: 700;
        font-size: 2rem;
        color: #00796b;
        margin-bottom: 40px;
        letter-spacing: 1.2px;
        user-select: none;
    }
    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 15px;
    }
    td {
        padding: 15px 20px;
        vertical-align: middle;
        font-size: 1.1rem;
        user-select: text;
    }
    td.label {
        font-weight: 700;
        width: 40%;
        background-color: #e0f2f1;
        border-radius: 10px 0 0 10px;
        color: #004d40;
        box-shadow: inset 2px 0 6px rgba(0,77,64,0.15);
    }
    td.value {
        background-color: #f7fcfc;
        border-radius: 0 10px 10px 0;
        color: #2c3e50;
        box-shadow: inset -2px 0 6px rgba(41,128,185,0.07);
        word-break: break-word;
    }
    .back-link {
        display: block;
        margin: 35px auto 0 auto;
        text-align: center;
        text-decoration: none;
        font-weight: 600;
        font-size: 1.1rem;
        color: #00796b;
        border: 2px solid #00796b;
        padding: 12px 30px;
        border-radius: 30px;
        width: fit-content;
        transition: all 0.3s ease;
        user-select: none;
    }
    .back-link:hover {
        background-color: #00796b;
        color: #fff;
        box-shadow: 0 5px 15px rgba(0,121,107,0.5);
    }
    @media (max-width: 640px) {
        .profile-container {
            padding: 25px 20px;
        }
        h2 {
            font-size: 1.6rem;
            margin-bottom: 30px;
        }
        td {
            font-size: 1rem;
            padding: 12px 15px;
        }
    }
</style>
</head>
<body>

<div class="profile-container" role="region" aria-label="Customer profile details">
    <h2>Your Profile</h2>
    <table>
        <tr>
            <td class="label">Account Number</td>
            <td class="value"><%= accountNumber %></td>
        </tr>
        <tr>
            <td class="label">Username</td>
            <td class="value"><%= username %></td>
        </tr>
        <tr>
            <td class="label">Full Name</td>
            <td class="value"><%= name %></td>
        </tr>
        <tr>
            <td class="label">NIC</td>
            <td class="value"><%= nic %></td>
        </tr>
        <tr>
            <td class="label">Address</td>
            <td class="value"><%= address %></td>
        </tr>
        <tr>
            <td class="label">Phone Number</td>
            <td class="value"><%= phoneNumber %></td>
        </tr>
    </table>

    <a class="back-link" href="CustomerDashboard.jsp" aria-label="Back to Customer Dashboard">← Back to Dashboard</a>
</div>

</body>
</html>
