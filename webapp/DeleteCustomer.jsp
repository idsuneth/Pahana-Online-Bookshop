<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
String accountNumber = request.getParameter("accountNumber");
if (accountNumber == null || accountNumber.trim().isEmpty()) {
    out.println("<p style='color:red;'>Invalid request. No account number provided.</p>");
} else {
    Connection conn = null;
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    
    try {
        conn = DBUtil.getConnection();
        conn.setAutoCommit(false); // Start transaction
        
        // Step 1: Delete bill items first (most dependent)
        String deleteBillItemsSql = "DELETE FROM bill_item WHERE bill_id IN (SELECT bill_id FROM bill WHERE account_number = ?)";
        ps1 = conn.prepareStatement(deleteBillItemsSql);
        ps1.setString(1, accountNumber);
        int billItemsDeleted = ps1.executeUpdate();
        
        // Step 2: Delete bills  
        String deleteBillsSql = "DELETE FROM bill WHERE account_number = ?";
        ps2 = conn.prepareStatement(deleteBillsSql);
        ps2.setString(1, accountNumber);
        int billsDeleted = ps2.executeUpdate();
        
        // Step 3: Delete the customer
        String deleteCustomerSql = "DELETE FROM customer WHERE account_number = ?";
        ps3 = conn.prepareStatement(deleteCustomerSql);
        ps3.setString(1, accountNumber);
        int customerDeleted = ps3.executeUpdate();
        
        if (customerDeleted > 0) {
            conn.commit(); // Commit the transaction
            response.sendRedirect("ViewCustomers.jsp"); // redirect back to the list
            return;
        } else {
            conn.rollback();
            out.println("<p style='color:red;'>No customer found with account number: " + accountNumber + "</p>");
        }
        
    } catch (Exception e) {
        try {
            if (conn != null) conn.rollback(); // Rollback on error
        } catch (SQLException rollbackEx) {
            // Log rollback exception if needed
        }
        out.println("<p style='color:red;'>Error deleting customer: " + e.getMessage() + "</p>");
    } finally {
        // Close all resources
        if (ps1 != null) try { ps1.close(); } catch (Exception ignored) {}
        if (ps2 != null) try { ps2.close(); } catch (Exception ignored) {}
        if (ps3 != null) try { ps3.close(); } catch (Exception ignored) {}
        if (conn != null) {
            try { 
                conn.setAutoCommit(true); // Reset auto-commit
                conn.close(); 
            } catch (Exception ignored) {}
        }
    }
}
%>