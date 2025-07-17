<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="lk.jiat.ee.core.remote.CustomerService" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.jiat.ee.core.model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/17/2025
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Management | Banking Admin</title>
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

        /* Sidebar Styles (consistent with dashboard) */
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
            padding: 30px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .page-title {
            font-size: 24px;
            font-weight: bold;
            color: var(--primary-black);
        }

        /* Customer Management Sections */
        .management-section {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 30px;
        }

        /* Add Customer Form */
        .add-customer-form {
            background-color: var(--white);
            padding: 25px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            border: 1px solid var(--medium-gray);
            height: fit-content;
        }

        .section-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            color: var(--primary-black);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: var(--dark-gray);
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            background-color: var(--white);
            color: var(--secondary-black);
        }

        .form-actions {
            margin-top: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s;
        }

        .btn-primary {
            background-color: var(--primary-black);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--secondary-black);
        }

        .btn-secondary {
            background-color: var(--white);
            color: var(--primary-black);
            border: 1px solid var(--medium-gray);
        }

        .btn-secondary:hover {
            background-color: var(--light-gray);
        }

        /* Customer List Table */
        .customer-list {
            background-color: var(--white);
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            border: 1px solid var(--medium-gray);
            overflow: hidden;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .search-box {
            display: flex;
            align-items: center;
        }

        .search-box input {
            padding: 8px 12px;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            margin-left: 10px;
        }

        .customer-table {
            width: 100%;
            border-collapse: collapse;
        }

        .customer-table th {
            text-align: left;
            padding: 12px 20px;
            border-bottom: 1px solid var(--medium-gray);
            font-weight: normal;
            color: var(--dark-gray);
            background-color: var(--light-gray);
        }

        .customer-table td {
            padding: 12px 20px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .customer-table tr:last-child td {
            border-bottom: none;
        }

        .customer-table tr:hover {
            background-color: var(--light-gray);
        }

        .action-btn {
            background: none;
            border: none;
            cursor: pointer;
            margin: 0 5px;
            color: var(--dark-gray);
            transition: all 0.3s;
        }

        .action-btn:hover {
            color: var(--primary-black);
        }

        .status-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-active {
            background-color: var(--primary-black);
            color: var(--white);
        }

        .status-inactive {
            background-color: var(--medium-gray);
            color: var(--secondary-black);
        }

        .pagination {
            display: flex;
            justify-content: center;
            padding: 15px;
            border-top: 1px solid var(--medium-gray);
        }

        .pagination button {
            margin: 0 5px;
            padding: 5px 10px;
            background: none;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            cursor: pointer;
        }

        .pagination button.active {
            background-color: var(--primary-black);
            color: var(--white);
            border-color: var(--primary-black);
        }
    </style>
</head>
<body>
<div class="dashboard">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">BANK ADMIN</div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="dashboard.jsp">Dashboard</a>
            </li>
            <li class="nav-item active">
                <a href="customers.jsp">Customers</a>
            </li>
            <li class="nav-item">
                <a href="#">Accounts</a>
            </li>
            <li class="nav-item">
                <a href="#">Transactions</a>
            </li>
            <li class="nav-item">
                <a href="#">Loans</a>
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
            <h1 class="page-title">Customer Management</h1>
            <div class="user-info">
                <div class="user-avatar">AD</div>
                <span>Administrator</span>
            </div>
        </div>

        <div class="management-section">
            <!-- Add Customer Form -->
            <div class="add-customer-form">
                <h2 class="section-title">Add New Customer</h2>
                <form  action="AddCustomer" method="POST">
                    <div class="form-group">
                        <label for="firstName"> Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">Clear</button>
                        <button type="submit" class="btn btn-primary">Add Customer</button>
                    </div>

                </form>
            </div>

            <!-- Customer List -->
            <div class="customer-list">
                <div class="table-header">
                    <h2 class="section-title">Customer List</h2>
                    <div class="search-box">
                        <span>Search:</span>
                        <input type="text" placeholder="Search customers...">
                    </div>
                </div>

                <table class="customer-table">
                    <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        try{
                            InitialContext ic = new InitialContext();
                            CustomerService customerService = (CustomerService) ic.lookup("lk.jiat.ee.core.remote.CustomerService");
                            List<Customer> customerList = customerService.getAllCustomers();
                            pageContext.setAttribute("customerList",customerList);
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                    %>


                    <c:forEach var="customer" items="${customerList}">
                        <tr>

                                <td>${customer.cid}</td>
                                <td>${customer.name}</td>
                                <td>${customer.email}</td>
                                <td>${customer.phone}</td>
                                <td><span class="status-badge status-active">Active</span></td>
                                <td>
                                    <button class="action-btn" title="Edit">✏️</button>
                                    <button class="action-btn" title="View">👁️</button>
                                    <form action="${pageContext.request.contextPath}/user/DeactivateCustomer" method="post">
                                        <input type="hidden" name="id" value="${customer.cid}" />
                                        <button type="submit" class="action-btn" title="Deactivate">❌</button>
                                    </form>

                                </td>

                        </tr>
                    </c:forEach>





<%--                    <tr>--%>
<%--                        <td>CUST-1003</td>--%>
<%--                        <td>Michael Brown</td>--%>
<%--                        <td>m.brown@example.com</td>--%>
<%--                        <td>+1 555-456-7890</td>--%>
<%--                        <td><span class="status-badge status-inactive">Inactive</span></td>--%>
<%--                        <td>--%>
<%--                            <button class="action-btn" title="Edit">✏️</button>--%>
<%--                            <button class="action-btn" title="View">👁️</button>--%>
<%--                            <button class="action-btn" title="Activate">✅</button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>CUST-1004</td>--%>
<%--                        <td>Emily Davis</td>--%>
<%--                        <td>emily.d@example.com</td>--%>
<%--                        <td>+1 555-789-0123</td>--%>
<%--                        <td><span class="status-badge status-active">Active</span></td>--%>
<%--                        <td>--%>
<%--                            <button class="action-btn" title="Edit">✏️</button>--%>
<%--                            <button class="action-btn" title="View">👁️</button>--%>
<%--                            <button class="action-btn" title="Deactivate">❌</button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>CUST-1005</td>--%>
<%--                        <td>Robert Wilson</td>--%>
<%--                        <td>robert.w@example.com</td>--%>
<%--                        <td>+1 555-234-5678</td>--%>
<%--                        <td><span class="status-badge status-active">Active</span></td>--%>
<%--                        <td>--%>
<%--                            <button class="action-btn" title="Edit">✏️</button>--%>
<%--                            <button class="action-btn" title="View">👁️</button>--%>
<%--                            <button class="action-btn" title="Deactivate">❌</button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    </tbody>
                </table>

                <div class="pagination">
                    <button disabled>Previous</button>
                    <button class="active">1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>Next</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
