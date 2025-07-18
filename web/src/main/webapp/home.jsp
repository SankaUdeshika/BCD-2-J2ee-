<%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/16/2025
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Banking Admin Dashboard</title>
    <style>
        :root {
            --primary-black: #000000;
            --secondary-black: #333333;
            --light-gray: #f5f5f5;
            --medium-gray: #e0e0e0;
            --dark-gray: #777777;
            --white: #ffffff;
        }

        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--light-gray);
            color: var(--secondary-black);
        }

        .dashboard {
            display: grid;
            grid-template-columns: 250px 1fr;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            background-color: var(--white);
            border-right: 1px solid var(--medium-gray);
            padding: 20px 0;
        }

        .logo {
            padding: 0 20px 20px;
            border-bottom: 1px solid var(--medium-gray);
            margin-bottom: 20px;
            font-size: 20px;
            font-weight: bold;
            color: var(--primary-black);
        }

        .nav-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-item {
            padding: 12px 20px;
            border-left: 3px solid transparent;
            transition: all 0.3s;
        }

        .nav-item:hover {
            background-color: var(--light-gray);
            border-left: 3px solid var(--primary-black);
        }

        .nav-item.active {
            background-color: var(--light-gray);
            border-left: 3px solid var(--primary-black);
            font-weight: bold;
        }

        .nav-item a {
            text-decoration: none;
            color: var(--secondary-black);
            display: block;
        }

        /* Main Content Styles */
        .main-content {
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--medium-gray);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: var(--primary-black);
        }

        /* Cards Grid */
        .cards-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background-color: var(--white);
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            border: 1px solid var(--medium-gray);
        }

        .card-title {
            font-size: 14px;
            color: var(--dark-gray);
            margin-bottom: 10px;
        }

        .card-value {
            font-size: 24px;
            font-weight: bold;
            color: var(--primary-black);
            margin: 5px 0;
        }

        .card-change {
            font-size: 12px;
        }

        .positive {
            color: var(--primary-black);
        }

        /* Recent Activity */
        .activity-section {
            background-color: var(--white);
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            border: 1px solid var(--medium-gray);
        }

        .section-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            color: var(--primary-black);
        }

        .activity-table {
            width: 100%;
            border-collapse: collapse;
        }

        .activity-table th {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid var(--medium-gray);
            font-weight: normal;
            color: var(--dark-gray);
        }

        .activity-table td {
            padding: 12px 10px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .status {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-pending {
            background-color: var(--medium-gray);
            color: var(--secondary-black);
        }

        .status-completed {
            background-color: var(--primary-black);
            color: var(--white);
        }
    </style>
</head>
<body>
<div class="dashboard">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">BANK ADMIN</div>
        <ul class="nav-menu">
            <li class="nav-item active">
                <a href="#">Dashboard</a>
            </li>
            <li class="nav-item">
                <a href="user/createAccounts.jsp">Accounts</a>
            </li>
            <li class="nav-item">
                <a href="user/transaction.jsp">Transactions</a>
            </li>
            <li class="nav-item">
                <a href="user/customerManage.jsp">Customers</a>
            </li>
            <li class="nav-item">
                <a href="admin/checkLogs.jsp">Logs</a>
            </li>
            <li class="nav-item">
                <a href="#">Reports</a>
            </li>
            <li class="nav-item">
                <a href="#">Settings</a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1>Dashboard Overview</h1>
            <div class="user-info">
                <div class="user-avatar">AD</div>
                <span>Administrator</span>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="cards-grid">
            <div class="card">
                <div class="card-title">Total Accounts</div>
                <div class="card-value">12,458</div>
                <div class="card-change positive">+3.2% from last month</div>
            </div>

            <div class="card">
                <div class="card-title">Active Customers</div>
                <div class="card-value">8,742</div>
                <div class="card-change positive">+1.8% from last month</div>
            </div>

            <div class="card">
                <div class="card-title">Pending Approvals</div>
                <div class="card-value">127</div>
                <div class="card-change positive">-5.3% from last month</div>
            </div>
        </div>

        <!-- Recent Activity Section -->
        <div class="activity-section">
            <h2 class="section-title">Recent Transactions</h2>
            <table class="activity-table">
                <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Account</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>#TX985214</td>
                    <td>AC-4587-9654</td>
                    <td>$2,450.00</td>
                    <td>2023-11-15 09:45</td>
                    <td><span class="status status-completed">Completed</span></td>
                    <td><a href="#">View</a></td>
                </tr>
                <tr>
                    <td>#TX985213</td>
                    <td>AC-1254-3369</td>
                    <td>$12,850.00</td>
                    <td>2023-11-15 09:30</td>
                    <td><span class="status status-completed">Completed</span></td>
                    <td><a href="#">View</a></td>
                </tr>
                <tr>
                    <td>#TX985212</td>
                    <td>AC-8874-5214</td>
                    <td>$5,200.00</td>
                    <td>2023-11-15 08:15</td>
                    <td><span class="status status-pending">Pending</span></td>
                    <td><a href="#">Review</a></td>
                </tr>
                <tr>
                    <td>#TX985211</td>
                    <td>AC-9963-2145</td>
                    <td>$3,750.00</td>
                    <td>2023-11-14 16:30</td>
                    <td><span class="status status-completed">Completed</span></td>
                    <td><a href="#">View</a></td>
                </tr>
                <tr>
                    <td>#TX985210</td>
                    <td>AC-4478-6598</td>
                    <td>$9,125.00</td>
                    <td>2023-11-14 14:20</td>
                    <td><span class="status status-completed">Completed</span></td>
                    <td><a href="#">View</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>

