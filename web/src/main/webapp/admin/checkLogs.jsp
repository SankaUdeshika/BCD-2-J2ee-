<%@ page import="javax.naming.InitialContext" %>
<%@ page import="lk.jiat.ee.core.remote.LogService" %>
<%@ page import="lk.jiat.ee.core.model.LogHistory" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/19/2025
  Time: 3:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Transactions | Banking System</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #34495e;
            --accent-color: #3498db;
            --light-color: #ecf0f1;
            --white: #ffffff;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --error-color: #e74c3c;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--light-color);
            color: var(--primary-color);
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 30px;
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h1 {
            color: var(--primary-color);
            margin: 0;
        }

        .header-actions {
            display: flex;
            gap: 15px;
        }

        /* Filter Section */
        .filter-section {
            background-color: var(--light-color);
            padding: 20px;
            border-radius: 6px;
            margin-bottom: 30px;
        }

        .filter-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 15px;
        }

        .filter-group {
            margin-bottom: 0;
        }

        .filter-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--secondary-color);
            font-size: 14px;
        }

        .filter-group input,
        .filter-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .filter-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 10px;
        }

        /* Transaction Table */
        .transaction-table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1000px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid var(--light-color);
        }

        th {
            background-color: var(--light-color);
            color: var(--secondary-color);
            font-weight: 600;
            position: sticky;
            top: 0;
        }

        tr:hover {
            background-color: rgba(52, 152, 219, 0.05);
        }

        .status {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-cleared {
            background-color: var(--success-color);
            color: white;
        }

        .status-pending {
            background-color: var(--warning-color);
            color: white;
        }

        .status-void {
            background-color: var(--error-color);
            color: white;
        }

        .status-stopped {
            background-color: var(--secondary-color);
            color: white;
        }

        .action-btn {
            background: none;
            border: none;
            color: var(--accent-color);
            cursor: pointer;
            margin-right: 10px;
            font-size: 14px;
        }

        .action-btn.view {
            color: var(--accent-color);
        }

        .action-btn.void {
            color: var(--error-color);
        }

        .action-btn.print {
            color: var(--secondary-color);
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            gap: 10px;
        }

        .pagination button {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: var(--white);
            cursor: pointer;
        }

        .pagination button.active {
            background-color: var(--accent-color);
            color: white;
            border-color: var(--accent-color);
        }

        .pagination button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        /* Summary Cards */
        .summary-cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .summary-card {
            background-color: var(--white);
            border-radius: 6px;
            padding: 20px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            border: 1px solid var(--light-color);
        }

        .summary-card h3 {
            margin-top: 0;
            font-size: 14px;
            color: var(--secondary-color);
        }

        .summary-card .value {
            font-size: 24px;
            font-weight: 600;
            margin: 10px 0;
        }

        .summary-card .change {
            font-size: 12px;
            color: var(--secondary-color);
        }

        .positive {
            color: var(--success-color);
        }

        .negative {
            color: var(--error-color);
        }

        @media (max-width: 768px) {
            .filter-row {
                grid-template-columns: 1fr 1fr;
            }

            .summary-cards {
                grid-template-columns: 1fr 1fr;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .header-actions {
                width: 100%;
                justify-content: flex-end;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Check Logs</h1>
        <div class="header-actions">
            <button class="btn btn-primary">New Check</button>
            <button class="btn btn-secondary">Export</button>
        </div>
    </div>

    <%
        try{
            InitialContext ic = new InitialContext();
            LogService logService = (LogService) ic.lookup("lk.jiat.ee.core.remote.LogService");
            List<LogHistory> logList = logService.getLogs();
            pageContext.setAttribute("logList",logList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    %>


    <!-- Transaction Table -->
    <div class="transaction-table-container">
        <table>
            <thead>
            <tr>
                <th>Log ID</th>
                <th>Log Date</th>
                <th>Log Type</th>
                <th>Log Message</th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="log" items="${logList}">
                <tr>
                    <td>${log.logid}</td>
                    <td>${log.logdate}</td>
                    <td>${log.logType}</td>
                    <td>${log.message}</td>

                </tr>
            </c:forEach>


            <tr>
                <td>1025</td>
                <td>1001 - Primary Checking</td>
                <td>2023-04-15</td>
                <td>ABC Suppliers</td>
                <td>$1,250.00</td>
                <td><span class="status status-cleared">Cleared</span></td>
                <td>2023-04-18</td>
                <td>
                    <button class="action-btn view">View</button>
                    <button class="action-btn print">Print</button>
                </td>
            </tr>
            <tr>
                <td>1026</td>
                <td>1001 - Primary Checking</td>
                <td>2023-04-16</td>
                <td>John Smith</td>
                <td>$500.00</td>
                <td><span class="status status-cleared">Cleared</span></td>
                <td>2023-04-19</td>
                <td>
                    <button class="action-btn view">View</button>
                    <button class="action-btn print">Print</button>
                </td>
            </tr>
            <tr>
                <td>1027</td>
                <td>1003 - Business Account</td>
                <td>2023-04-17</td>
                <td>Office Solutions Inc</td>
                <td>$2,850.75</td>
                <td><span class="status status-pending">Pending</span></td>
                <td>-</td>
                <td>
                    <button class="action-btn view">View</button>
                    <button class="action-btn void">Void</button>
                </td>
            </tr>
            <tr>
                <td>1028</td>
                <td>1002 - Savings Account</td>
                <td>2023-04-18</td>
                <td>City Utilities</td>
                <td>$175.50</td>
                <td><span class="status status-pending">Pending</span></td>
                <td>-</td>
                <td>
                    <button class="action-btn view">View</button>
                    <button class="action-btn void">Void</button>
                </td>
            </tr>
            <tr>
                <td>1029</td>
                <td>1001 - Primary Checking</td>
                <td>2023-04-19</td>
                <td>Jane Doe</td>
                <td>$350.00</td>
                <td><span class="status status-stopped">Stopped</span></td>
                <td>-</td>
                <td>
                    <button class="action-btn view">View</button>
                </td>
            </tr>
            <tr>
                <td>1030</td>
                <td>1003 - Business Account</td>
                <td>2023-04-20</td>
                <td>Tech Supplies Co</td>
                <td>$1,850.25</td>
                <td><span class="status status-void">Void</span></td>
                <td>-</td>
                <td>
                    <button class="action-btn view">View</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- Pagination -->
    <div class="pagination">
        <button disabled>Previous</button>
        <button class="active">1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>Next</button>
    </div>
</div>

<script>
    // Set default date range (last 30 days)
    document.addEventListener('DOMContentLoaded', function() {
        const today = new Date();
        const thirtyDaysAgo = new Date();
        thirtyDaysAgo.setDate(today.getDate() - 30);

        document.getElementById('dateTo').valueAsDate = today;
        document.getElementById('dateFrom').valueAsDate = thirtyDaysAgo;
    });

    // In a real application, you would have:
    // - AJAX calls to load transaction data
    // - Filter functionality
    // - Pagination controls
    // - Action handlers for view/void/print buttons
</script>
</body>
</html>
