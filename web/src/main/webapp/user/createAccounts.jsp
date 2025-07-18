<%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/18/2025
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Open New Account</title>
  <style>
    :root {
      --primary-color: #2c3e50;
      --secondary-color: #34495e;
      --accent-color: #3498db;
      --light-color: #ecf0f1;
      --white: #ffffff;
      --success-color: #27ae60;
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
      max-width: 800px;
      margin: 50px auto;
      padding: 30px;
      background-color: var(--white);
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .header {
      text-align: center;
      margin-bottom: 30px;
    }

    .header h1 {
      color: var(--primary-color);
      margin-bottom: 10px;
    }

    .header p {
      color: var(--secondary-color);
    }

    .form-container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }

    .form-section {
      margin-bottom: 25px;
    }

    .form-section.full-width {
      grid-column: span 2;
    }

    .form-section h2 {
      font-size: 18px;
      color: var(--primary-color);
      margin-bottom: 15px;
      padding-bottom: 8px;
      border-bottom: 1px solid var(--light-color);
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: var(--secondary-color);
    }

    .form-group input,
    .form-group select {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 16px;
      transition: border 0.3s;
    }

    .form-group input:focus,
    .form-group select:focus {
      border-color: var(--accent-color);
      outline: none;
    }

    .read-only {
      background-color: var(--light-color);
      color: var(--secondary-color);
      cursor: not-allowed;
    }

    .form-actions {
      grid-column: span 2;
      display: flex;
      justify-content: flex-end;
      gap: 15px;
      margin-top: 20px;
    }

    .btn {
      padding: 12px 24px;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s;
    }

    .btn-primary {
      background-color: var(--accent-color);
      color: white;
    }

    .btn-primary:hover {
      background-color: #2980b9;
    }

    .btn-secondary {
      background-color: var(--light-color);
      color: var(--secondary-color);
    }

    .btn-secondary:hover {
      background-color: #dfe6e9;
    }

    .account-type-cards {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 15px;
      margin-top: 15px;
    }

    .account-type-card {
      border: 1px solid #ddd;
      border-radius: 6px;
      padding: 15px;
      cursor: pointer;
      transition: all 0.3s;
    }

    .account-type-card:hover {
      border-color: var(--accent-color);
    }

    .account-type-card.selected {
      border-color: var(--accent-color);
      background-color: rgba(52, 152, 219, 0.1);
    }

    .account-type-card h3 {
      margin-top: 0;
      color: var(--primary-color);
    }

    .account-type-card p {
      color: var(--secondary-color);
      font-size: 14px;
    }

    .info-message {
      padding: 15px;
      background-color: var(--light-color);
      border-radius: 4px;
      margin-bottom: 20px;
      grid-column: span 2;
    }

    @media (max-width: 768px) {
      .form-container {
        grid-template-columns: 1fr;
      }

      .form-section.full-width {
        grid-column: span 1;
      }

      .form-actions {
        grid-column: span 1;
        flex-direction: column;
      }

      .account-type-cards {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h1>Open a New Bank Account</h1>
    <p>Fill out the form below to create your new account</p>
  </div>

  <form id="accountForm" action="createAccount" method="POST">
    <div class="info-message">
      <strong>Note:</strong> Your account number will be automatically generated after submission.
    </div>

    <div class="form-container">
      <!-- Customer Information Section -->
      <div class="form-section full-width">
        <h2>Your Information</h2>
        <div class="form-group">
          <label for="customerId">Customer ID</label>
          <input type="text" id="customerId" name="customerId"  >
        </div>
        <div class="form-group">
          <label for="customerName">Full Name</label>
          <input type="text" id="customerName" name="customerName" >
        </div>
      </div>

      <!-- Account Type Selection -->
<%--      <div class="form-section full-width">--%>
<%--        <h2>Account Type</h2>--%>
<%--        <div class="account-type-cards">--%>
<%--          <div class="account-type-card selected" onclick="selectAccountType(this, 'SAVINGS')">--%>
<%--            <h3>Savings Account</h3>--%>
<%--            <p>Ideal for everyday banking with interest on your balance</p>--%>
<%--            <input type="radio" name="accountType" value="SAVINGS" checked style="display: none;">--%>
<%--          </div>--%>
<%--          <div class="account-type-card" onclick="selectAccountType(this, 'CHECKING')">--%>
<%--            <h3>Checking Account</h3>--%>
<%--            <p>For frequent transactions with no monthly fees</p>--%>
<%--            <input type="radio" name="accountType" value="CHECKING" style="display: none;">--%>
<%--          </div>--%>
<%--          <div class="account-type-card" onclick="selectAccountType(this, 'FIXED_DEPOSIT')">--%>
<%--            <h3>Fixed Deposit</h3>--%>
<%--            <p>Higher interest rates for fixed term deposits</p>--%>
<%--            <input type="radio" name="accountType" value="FIXED_DEPOSIT" style="display: none;">--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>

      <!-- Initial Deposit -->
      <div class="form-section">
        <h2>Initial Deposit</h2>
        <div class="form-group">
          <label for="initialDeposit">Amount</label>
          <input type="number" id="initialDeposit" name="balance" min="0" step="0.01" placeholder="0.00" required>
        </div>
        <div class="form-group">
          <label for="depositMethod">Deposit Method</label>
          <select id="depositMethod" name="depositMethod">
            <option value="CASH">Cash</option>
            <option value="TRANSFER">Bank Transfer</option>
            <option value="CHECK">Check</option>
          </select>
        </div>
      </div>

      <!-- Form Actions -->
      <div class="form-actions">
        <button type="button" class="btn btn-secondary" onclick="window.history.back()">Cancel</button>
        <button type="submit" class="btn btn-primary">Open Account</button>
      </div>
    </div>
  </form>
</div>

<script>
  // Select account type card
  function selectAccountType(element, type) {
    document.querySelectorAll('.account-type-card').forEach(card => {
      card.classList.remove('selected');
    });
    element.classList.add('selected');

    // Update the hidden radio button
    document.querySelector(`input[value="${type}"]`).checked = true;
  }

  // Form validation
  document.getElementById('accountForm').addEventListener('submit', function(e) {
    const initialDeposit = parseFloat(document.getElementById('initialDeposit').value);
    const termsAgreed = document.getElementById('termsAgreement').checked;

    if (initialDeposit < 0) {
      alert('Initial deposit cannot be negative');
      e.preventDefault();
      return;
    }

    if (!termsAgreed) {
      alert('You must agree to the terms and conditions');
      e.preventDefault();
      return;
    }
  });

  function showTerms() {
    alert('Terms and conditions would be displayed here in a real implementation.');
    return false;
  }
</script>
</body>
</html>