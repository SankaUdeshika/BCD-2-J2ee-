<%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/18/2025
  Time: 2:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transfer Money | Banking Admin</title>
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

        /* Transfer Form */
        .transfer-form-container {
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

        .account-info {
            background-color: var(--light-gray);
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 15px;
            border: 1px solid var(--medium-gray);
        }

        .account-info-label {
            font-size: 13px;
            color: var(--dark-gray);
        }

        .account-info-value {
            font-weight: bold;
            font-size: 16px;
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

        .balance-warning {
            color: #d9534f;
            font-size: 13px;
            margin-top: 5px;
            display: none;
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
            <li class="nav-item">
                <a href="accounts.jsp">Accounts</a>
            </li>
            <li class="nav-item active">
                <a href="transfer.jsp">Transfer</a>
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
            <h1 class="page-title">Transfer Funds</h1>
            <div class="user-info">
                <div class="user-avatar">AD</div>
                <span>Administrator</span>
            </div>
        </div>

        <div class="transfer-form-container">
            <h2 class="form-title">Money Transfer</h2>

            <!-- Source Account Information -->
            <div class="form-group">
                <label for="fromAccount">From Account</label>
                <input type="text" id="fromAccount" name="from_accountNumber"
                       placeholder="Enter From account number" required>
            </div>

            <!-- Destination Account Information -->
            <div class="form-group">
                <label for="toAccount">To Account</label>
                <input type="text" id="toAccount" name="to_accountNumber"
                       placeholder="Enter destination account number" required>
            </div>

            <!-- Account Verification (would be filled by AJAX in real implementation) -->
            <div id="destinationAccountInfo" class="account-info" style="display: none;">
                <div class="account-info-label">Destination Account:</div>
                <div class="account-info-value" id="destinationAccountDetails"></div>
            </div>

            <!-- Transfer Amount -->
            <div class="form-group">
                <label for="amount">Amount</label>
                <input type="number" id="amount" name="amount"
                       min="0.01" step="0.01" placeholder="0.00" required>
                <div id="balanceWarning" class="balance-warning">
                    Warning: Transfer amount exceeds available balance
                </div>
            </div>

            <div class="form-actions">
                <button type="button" class="btn btn-secondary" onclick="window.history.back()">Cancel</button>
                <button type="submit" class="btn btn-primary" id="transferBtn">Transfer Money</button>
            </div>
        </div>
    </div>
</div>

<script>
    // Client-side validation
    document.addEventListener('DOMContentLoaded', function() {
        const fromAccount = document.getElementById('fromAccount');
        const toAccount = document.getElementById('toAccount');
        const amountInput = document.getElementById('amount');
        const balanceWarning = document.getElementById('balanceWarning');
        const transferBtn = document.getElementById('transferBtn');

        // Sample account balances (in real app, this would come from server)
        const accountBalances = {
            '1001': 5250.00,
            '1002': 12850.00,
            '1003': 23500.00,
            '1004': 3750.00
        };

        // Validate transfer amount against selected account balance
        amountInput.addEventListener('input', validateTransferAmount);
        fromAccount.addEventListener('change', validateTransferAmount);

        function validateTransferAmount() {
            const selectedAccount = fromAccount.value;
            const amount = parseFloat(amountInput.value);

            if (selectedAccount && amount) {
                const balance = accountBalances[selectedAccount];

                if (amount > balance) {
                    balanceWarning.style.display = 'block';
                    transferBtn.disabled = true;
                } else {
                    balanceWarning.style.display = 'none';
                    transferBtn.disabled = false;
                }
            }
        }

        // Simulate account verification (in real app, this would be an AJAX call)
        toAccount.addEventListener('blur', function() {
            const accountNumber = toAccount.value.trim();
            const destInfo = document.getElementById('destinationAccountInfo');
            const destDetails = document.getElementById('destinationAccountDetails');

            if (accountNumber.length > 0) {
                // This is just simulation - in real app you would verify with server
                if (accountNumber === '2001') {
                    destDetails.textContent = '2001 - Robert Wilson (Checking)';
                    destInfo.style.display = 'block';
                } else if (accountNumber === '2002') {
                    destDetails.textContent = '2002 - Lisa Taylor (Savings)';
                    destInfo.style.display = 'block';
                } else {
                    destInfo.style.display = 'none';
                }
            } else {
                destInfo.style.display = 'none';
            }
        });
    });
</script>
</body>
</html>