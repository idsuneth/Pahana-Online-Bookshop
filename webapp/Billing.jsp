<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Bill Generator</title>

<style>
    /* Reset and base */
    * {
        box-sizing: border-box;
    }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #4a90e2, #50e3c2);
        min-height: 100vh;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        color: #2c3e50;
    }
    .container {
        background: #ffffffdd;
        max-width: 550px;
        width: 100%;
        border-radius: 15px;
        padding: 30px 35px;
        box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        backdrop-filter: blur(8px);
    }
    a.back-button {
        display: inline-block;
        margin-bottom: 30px;
        color: #2980b9;
        font-weight: 600;
        text-decoration: none;
        transition: color 0.3s ease;
    }
    a.back-button:hover {
        color: #1c5980;
    }
    h2 {
        text-align: center;
        margin-bottom: 35px;
        font-weight: 700;
        font-size: 1.8rem;
        color: #34495e;
        letter-spacing: 1.2px;
    }
    form label {
        display: block;
        font-weight: 600;
        margin-top: 20px;
        margin-bottom: 8px;
        color: #34495e;
    }
    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 12px 15px;
        border-radius: 8px;
        border: 1.8px solid #bdc3c7;
        font-size: 1rem;
        transition: border-color 0.3s ease;
        outline-offset: 2px;
    }
    input[type="text"]:focus,
    input[type="number"]:focus {
        border-color: #2980b9;
        outline: none;
        box-shadow: 0 0 8px rgba(41, 128, 185, 0.3);
    }
    #items .item {
        background: #ecf0f1;
        padding: 15px 20px;
        border-radius: 12px;
        margin-top: 20px;
        box-shadow: inset 0 2px 5px rgba(0,0,0,0.05);
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 15px 25px;
        align-items: center;
    }
    #items .item label {
        margin: 0;
        font-weight: 600;
        color: #2c3e50;
    }
    button {
        margin-top: 30px;
        padding: 14px 0;
        width: 100%;
        border: none;
        border-radius: 35px;
        font-size: 1.15rem;
        font-weight: 700;
        color: white;
        background: linear-gradient(90deg, #27ae60, #2ecc71);
        cursor: pointer;
        box-shadow: 0 8px 20px rgba(39,174,96,0.5);
        transition: background 0.3s ease;
    }
    button:hover {
        background: linear-gradient(90deg, #219150, #27ae60);
    }
    button[type="button"] {
        background: #3498db;
        box-shadow: 0 8px 20px rgba(52,152,219,0.5);
        margin-top: 20px;
    }
    button[type="button"]:hover {
        background: #2980b9;
    }
    .error {
        margin-top: 20px;
        padding: 12px;
        background: #ffebe8;
        border-radius: 8px;
        color: #c0392b;
        font-weight: 600;
        text-align: center;
        box-shadow: 0 2px 8px rgba(192,57,43,0.3);
    }
    .bill {
        background: #f7f9fa;
        padding: 25px;
        margin-top: 25px;
        border-radius: 15px;
        font-family: 'Courier New', Courier, monospace;
        white-space: pre-wrap;
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        color: #2c3e50;
    }
    .print-btn {
        margin-top: 15px;
        background-color: #27ae60;
        padding: 12px 0;
        border-radius: 35px;
        border: none;
        font-size: 1.1rem;
        font-weight: 700;
        color: white;
        cursor: pointer;
        width: 100%;
        box-shadow: 0 8px 20px rgba(39,174,96,0.5);
        transition: background 0.3s ease;
    }
    .print-btn:hover {
        background-color: #219150;
    }
</style>

</head>
<body>
<div class="container">

    <!-- Back Button -->
    <a href="cashierDashboard.jsp" class="back-button">&larr; Back</a>

    <h2>Generate and Save Bill</h2>

    <form action="BillingServlet" method="post">
        <label for="accountNumber">Customer Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" placeholder="Enter account number" required>

        <div id="items">
            <div class="item">
                <label>Item Name:</label>
                <input type="text" name="itemName" placeholder="Enter item name" required>

                <label>Quantity:</label>
                <input type="number" name="quantity" step="1" min="1" placeholder="Quantity" required>

                <label>Price per Unit (Rs):</label>
                <input type="number" name="price" step="0.01" min="0" placeholder="Price per unit" required>
            </div>
        </div>

        <button type="button" onclick="addItem()">➕ Add Another Item</button>
        <button type="submit">Generate & Save Bill</button>
    </form>

    <% String msg = request.getParameter("msg");
       if ("notfound".equals(msg)) { %>
       <div class="error">No customer found with that account number.</div>
    <% } else if ("error".equals(msg)) { %>
       <div class="error">Error generating bill. Please try again.</div>
    <% } %>

    <% String bill = (String) request.getAttribute("bill");
       if (bill != null) { %>
        <div class="bill" id="billContent"><%= bill %></div>
        <button class="print-btn" onclick="printBill()">🖨 Print</button>
    <% } %>

</div>

<script>
    function addItem() {
        const itemsDiv = document.getElementById("items");
        const newItem = document.createElement("div");
        newItem.classList.add("item");
        newItem.innerHTML = `
            <label>Item Name:</label>
            <input type="text" name="itemName" placeholder="Enter item name" required>

            <label>Quantity:</label>
            <input type="number" name="quantity" step="1" min="1" placeholder="Quantity" required>

            <label>Price per Unit (Rs):</label>
            <input type="number" name="price" step="0.01" min="0" placeholder="Price per unit" required>
        `;
        itemsDiv.appendChild(newItem);
    }

    function printBill() {
        const billElement = document.getElementById("billContent");

        if (!billElement) {
            alert("No bill content found!");
            return;
        }

        // Debug logs
        console.log("Bill element HTML:", billElement.innerHTML);
        console.log("Bill element text:", billElement.textContent);

        let rawContent = billElement.innerHTML;

        // Remove form and interactive tags if any
        rawContent = rawContent.replace(/<form[^>]*>.*?<\/form>/gis, '');
        rawContent = rawContent.replace(/<input[^>]*>/gi, '');
        rawContent = rawContent.replace(/<button[^>]*>.*?<\/button>/gis, '');
        rawContent = rawContent.replace(/<label[^>]*>.*?<\/label>/gis, '');
        rawContent = rawContent.replace(/<select[^>]*>.*?<\/select>/gis, '');
        rawContent = rawContent.replace(/<textarea[^>]*>.*?<\/textarea>/gis, '');

        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = rawContent;

        let billText = tempDiv.textContent || tempDiv.innerText || '';
        billText = billText.trim();

        alert("Final bill text to print:\n" + billText);

        if (billText.length < 10) {
            alert("No valid bill content found to print!");
            return;
        }

        const printWindow = window.open('', '_blank', 'width=800,height=600');

        printWindow.document.write(`
            <!DOCTYPE html>
            <html>
            <head>
                <title>Bill Receipt</title>
                <style>
                    body {
                        font-family: 'Courier New', Courier, monospace;
                        padding: 20px;
                        background: white;
                        color: black;
                        font-size: 12px;
                        line-height: 1.4;
                        white-space: pre-wrap;
                    }
                    @media print {
                        body { padding: 10px; font-size: 10px; }
                    }
                </style>
            </head>
            <body><pre>${billText}</pre></body>
            </html>
        `);

        printWindow.document.close();

        setTimeout(function() {
            printWindow.focus();
            printWindow.print();
            setTimeout(() => printWindow.close(), 1000);
        }, 500);
    }
</script>
</body>
</html>
