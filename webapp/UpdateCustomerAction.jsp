<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
    request.setCharacterEncoding("UTF-8");

    String accountNumber = request.getParameter("accountNumber");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String nic = request.getParameter("nic");
    String address = request.getParameter("address");
    String phoneNumber = request.getParameter("phoneNumber");

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement(
            "UPDATE customer SET username=?, password=?, name=?, nic=?, address=?, phone_number=? WHERE account_number=?")) {

        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, name);
        ps.setString(4, nic);
        ps.setString(5, address);
        ps.setString(6, phoneNumber);
        ps.setString(7, accountNumber);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            response.sendRedirect("ViewCustomers.jsp");
        } else {
            out.println("<p style='color:red;'>Update failed. Customer not found.</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error updating customer: " + e.getMessage() + "</p>");
    }
%>
