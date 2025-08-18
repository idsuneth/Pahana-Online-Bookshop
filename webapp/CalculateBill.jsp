<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*, java.util.*, com.system.util.DBUtil" %>

<%
    class BillItem {
        public int billItemId;
        public int billId;
        public String itemName;
        public int quantity;
        public double pricePerUnit;
    }

    class Bill {
        public int billId;
        public String accountNumber;
        public double totalAmount;
        public Timestamp billDate;
        public List<BillItem> items = new ArrayList<>();
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List<Bill> bills = new ArrayList<>();

    try {
        conn = DBUtil.getConnection();

        // Get all bills
        String billSql = "SELECT bill_id, account_number, total_amount, bill_date FROM bill ORDER BY bill_id DESC";
        ps = conn.prepareStatement(billSql);
        rs = ps.executeQuery();

        while (rs.next()) {
            Bill bill = new Bill();
            bill.billId = rs.getInt("bill_id");
            bill.accountNumber = rs.getString("account_number");
            bill.totalAmount = rs.getDouble("total_amount");
            bill.billDate = rs.getTimestamp("bill_date");
            bills.add(bill);
        }
        rs.close();
        ps.close();

        // For each bill, get bill items
        String itemSql = "SELECT bill_item_id, bill_id, item_name, quantity, price_per_unit FROM bill_item WHERE bill_id = ?";
        ps = conn.prepareStatement(itemSql);

        for (Bill bill : bills) {
            ps.setInt(1, bill.billId);
            rs = ps.executeQuery();

            while (rs.next()) {
                BillItem item = new BillItem();
                item.billItemId = rs.getInt("bill_item_id");
                item.billId = rs.getInt("bill_id");
                item.itemName = rs.getString("item_name");
                item.quantity = rs.getInt("quantity");
                item.pricePerUnit = rs.getDouble("price_per_unit");
                bill.items.add(item);
            }
            rs.close();
        }
        ps.close();

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading bills: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception ignored) {}
        if (ps != null) try { ps.close(); } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Calculate Bill - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; background: #f0f4f8; padding: 40px; color: #34495e; }
    h2 { text-align: center; margin-bottom: 30px; color: #2c3e50; }
    .bill-container {
        max-width: 900px;
        margin: 0 auto 40px auto;
        background: white;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        padding: 20px 30px;
    }
    .bill-header {
        margin-bottom: 20px;
        font-weight: 700;
        font-size: 1.2rem;
        color: #27ae60;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 15px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #27ae60;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .back-button {
        display: inline-block;
        margin-top: 20px;
        background: #2980b9;
        color: white;
        padding: 10px 25px;
        border-radius: 25px;
        text-decoration: none;
        font-weight: 600;
    }
    .back-button:hover {
        background: #1c5980;
    }
</style>
</head>
<body>

<h2>Bill List and Details</h2>

<%
    if (bills.isEmpty()) {
%>
    <p style="text-align:center; font-weight:bold;">No bills found.</p>
<%
    } else {
        for (Bill bill : bills) {
%>
    <div class="bill-container">
        <div class="bill-header">
            Bill ID: <%= bill.billId %> | Account Number: <%= bill.accountNumber %> | Date: <%= bill.billDate %> | Total Amount: Rs. <%= String.format("%.2f", bill.totalAmount) %>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Quantity</th>
                    <th>Price per Unit (Rs)</th>
                    <th>Total (Rs)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (BillItem item : bill.items) {
                        double total = item.quantity * item.pricePerUnit;
                %>
                <tr>
                    <td><%= item.itemName %></td>
                    <td><%= item.quantity %></td>
                    <td><%= String.format("%.2f", item.pricePerUnit) %></td>
                    <td><%= String.format("%.2f", total) %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
<%
        }
    }
%>

<a href="adminDashboard.jsp" class="back-button">← Back to Dashboard</a>

</body>
</html>
