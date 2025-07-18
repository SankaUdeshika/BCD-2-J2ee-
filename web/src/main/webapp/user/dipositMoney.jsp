<%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/18/2025
  Time: 2:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Create New Account | Banking Admin</title>
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

    /* Sidebar Styles (consistent with previous pages) */
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

    /* Account Creation Form */
    .account-form-container {
      background-color: var(--white);
      padding: 30px;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.05);
      border: 1px solid var(--medium-gray);
      max-width: 600px;
      margin: 0 auto;
    }

    .form-title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 25px;
      color: var(--primary-black);
      text-align: center;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-size: 14px;
      color: var(--dark-gray);
      font-weight: bold;
    }

    .form-group input,
    .form-group select {
      width: 100%;
      padding: 12px;
      border: 1px solid var(--medium-gray);
      border-radius: 4px;
      background-color: var(--white);
      color: var(--secondary-black);
      font-size: 14px;
    }

    .form-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }

    .form-actions {
      margin-top: 30px;
      display: flex;
      justify-content: flex-end;
      gap: 15px;
    }

    .btn {
      padding: 12px 24px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
      transition: all 0.3s;
      font-size: 14px;
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

    .customer-info-card {
      background-color: var(--light-gray);
      padding: 20px;
      border-radius: 5px;
      margin-bottom: 25px;
      border: 1px solid var(--medium-gray);
    }

    .customer-info-title {
      font-weight: bold;
      margin-bottom: 10px;
      color: var(--primary-black);
    }

    .customer-details {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }

    .detail-item {
      margin-bottom: 8px;
    }

    .detail-label {
      font-size: 13px;
      color: var(--dark-gray);
    }

    .detail-value {
      font-weight: bold;
    }

    .auto-gen-field {
      background-color: var(--light-gray);
      color: var(--dark-gray);
      cursor: not-allowed;
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
      <li class="nav-item">
        <a href="customers.jsp">Customers</a>
      </li>
      <li class="nav-item active">
        <a href="accounts.jsp">Accounts</a>
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
      <h1 class="page-title">Create New Account</h1>
      <div class="user-info">
        <div class="user-avatar">AD</div>
        <span>Administrator</span>
      </div>
    </div>

    <div class="account-form-container">
      <h2 class="form-title">Account Information</h2>

      <!-- Customer Information Display -->
      <div class="customer-info-card">
        <div class="customer-info-title">Customer Information</div>
        <div class="customer-details">
          <div class="detail-item">
            <div class="detail-label">Customer ID</div>
            <div class="detail-value">${customer.id}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Full Name</div>
            <div class="detail-value">${customer.firstName} ${customer.lastName}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Email</div>
            <div class="detail-value">${customer.email}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Phone</div>
            <div class="detail-value">${customer.phone}</div>
          </div>
        </div>
      </div>

      <!-- Account Creation Form -->
      <form action="createAccount" method="POST">
        <input type="hidden" name="customerId" value="${customer.id}">

        <div class="form-group">
          <label for="accountNumber">Account Number</label>
          <input type="text" id="accountNumber" name="accountNumber" class="auto-gen-field"
                 value="Auto-generated" readonly>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="accountType">Account Type</label>
            <select id="accountType" name="accountType" required>
              <option value="">Select Account Type</option>
              <option value="SAVINGS">Savings Account</option>
              <option value="CHECKING">Checking Account</option>
              <option value="BUSINESS">Business Account</option>
              <option value="FIXED_DEPOSIT">Fixed Deposit</option>
            </select>
          </div>

          <div class="form-group">
            <label for="currency">Currency</label>
            <select id="currency" name="currency" required>
              <option value="">Select Currency</option>
              <option value="USD">USD ($)</option>
              <option value="EUR">EUR (€)</option>
              <option value="GBP">GBP (£)</option>
              <option value="JPY">JPY (¥)</option>
            </select>
          </div>
        </div>

        <div class="form-group">
          <label for="initialDeposit">Initial Deposit Amount</label>
          <input type="number" id="initialDeposit" name="balance"
                 min="0" step="0.01" required>
        </div>

        <div class="form-group">
          <label for="branch">Branch</label>
          <select id="branch" name="branch" required>
            <option value="">Select Branch</option>
            <option value="MAIN">Main Branch</option>
            <option value="NORTH">North Branch</option>
            <option value="SOUTH">South Branch</option>
            <option value="EAST">East Branch</option>
            <option value="WEST">West Branch</option>
          </select>
        </div>

        <div class="form-actions">
          <button type="button" class="btn btn-secondary" onclick="window.history.back()">Cancel</button>
          <button type="submit" class="btn btn-primary">Create Account</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  // Client-side validation for initial deposit
  document.querySelector('form').addEventListener('submit', function(e) {
    const initialDeposit = parseFloat(document.getElementById('initialDeposit').value);

    if (initialDeposit < 0) {
      alert('Initial deposit cannot be negative');
      e.preventDefault();
    }

    // You can add more validations here as needed
  });
</script>
</body>
</html>