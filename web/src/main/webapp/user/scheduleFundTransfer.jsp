<%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/18/2025
  Time: 11:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scheduled Transfers | Banking System</title>
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
            max-width: 1000px;
            margin: 30px auto;
            padding: 30px;
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .header {
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
            gap: 30px;
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
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: border 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: var(--accent-color);
            outline: none;
        }

        .account-info {
            background-color: var(--light-color);
            padding: 15px;
            border-radius: 4px;
            margin-top: 10px;
        }

        .account-info p {
            margin: 5px 0;
            font-size: 14px;
        }

        .account-info .label {
            font-weight: 600;
            color: var(--secondary-color);
        }

        .recurrence-options {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin-top: 15px;
        }

        .recurrence-option {
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 12px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }

        .recurrence-option:hover {
            border-color: var(--accent-color);
        }

        .recurrence-option.selected {
            border-color: var(--accent-color);
            background-color: rgba(52, 152, 219, 0.1);
        }

        .custom-recurrence {
            grid-column: span 4;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            margin-top: 10px;
            display: none;
        }

        .custom-recurrence.active {
            display: block;
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

        .scheduled-transfers {
            margin-top: 40px;
        }

        .scheduled-transfers h2 {
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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
        }

        tr:hover {
            background-color: rgba(52, 152, 219, 0.05);
        }

        .status-active {
            color: var(--success-color);
            font-weight: 600;
        }

        .status-paused {
            color: var(--warning-color);
            font-weight: 600;
        }

        .action-btn {
            background: none;
            border: none;
            color: var(--accent-color);
            cursor: pointer;
            margin-right: 10px;
        }

        .action-btn.delete {
            color: var(--error-color);
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

            .recurrence-options {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Scheduled Fund Transfers</h1>
        <p>Set up recurring transfers between your accounts</p>
    </div>

    <form id="scheduleForm" action="scheduleTransaction" method="POST">
        <div class="form-container">
            <!-- Transfer Details -->
            <div class="form-section">
                <h2>Transfer Details</h2>
                <div class="form-group">
                    <label for="fromAccount">From Account</label>
                    <input type="text" id="fromAccount" name="fromAccount" placeholder="Enter from account number" required>
                    <div class="account-info">
                        <p><span class="label">Available Balance:</span> $5,284.75</p>
                        <p><span class="label">Account Type:</span> Checking</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="toAccount">To Account</label>
                    <input type="text" id="toAccount" name="toAccount" placeholder="Enter account number" required>
                    <div id="destinationInfo" class="account-info" style="display:none;">
                        <p><span class="label">Account Holder:</span> <span id="destAccountHolder"></span></p>
                        <p><span class="label">Account Type:</span> <span id="destAccountType"></span></p>
                    </div>
                </div>
            </div>

            <!-- Amount and Description -->
            <div class="form-section">
                <h2>Amount & Description</h2>
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="number" id="amount" name="amount" min="0.01" step="0.01" placeholder="0.00" required>
                </div>

            </div>

            <!-- Schedule Options -->
            <div class="form-section full-width">
                <h2>Schedule Options</h2>
                <div class="form-group">
                    <label>Recurrence</label>
                    <div class="recurrence-options">

                        <div class="recurrence-option selected" onclick="selectRecurrence(this, 'ONETIME')">
                            One Time
                            <input type="radio" name="recurrence" value="ONETIME" checked style="display:none;">
                        </div>

                        <div class="recurrence-option" onclick="selectRecurrence(this, 'WEEKLY')">
                            Weekly
                            <input type="radio" name="recurrence" value="WEEKLY"  style="display:none;">
                        </div>

                        <div class="recurrence-option" onclick="selectRecurrence(this, 'MONTHLY')">
                            Monthly
                            <input type="radio" name="recurrence" value="MONTHLY" style="display:none;">
                        </div>

                        <div class="recurrence-option" onclick="selectRecurrence(this, 'YEARLY')">
                            Custom
                            <input type="radio" name="recurrence" value="YEARLY" style="display:none;">
                        </div>
                    </div>

                    <div id="customRecurrence" class="custom-recurrence">
                        <div class="form-group">
                            <label for="customFrequency">Frequency</label>
                            <select id="customFrequency" name="customFrequency">
                                <option value="DAYS">Days</option>
                                <option value="WEEKS">Weeks</option>
                                <option value="MONTHS">Months</option>
                                <option value="YEARS">Years</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="customInterval">Every</label>
                            <input type="number" id="customInterval" name="customInterval" min="1" value="1">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="startDate">Start Date</label>
                    <input type="date" id="startDate" name="startDate" required>
                </div>


            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <button type="button" class="btn btn-secondary" onclick="resetForm()">Cancel</button>
                <button type="submit" class="btn btn-primary">Schedule Transfer</button>
            </div>
        </div>
    </form>

    <!-- Existing Scheduled Transfers -->
    <div class="scheduled-transfers">
        <h2>Your Scheduled Transfers</h2>
        <table>
            <thead>
            <tr>
                <th>Description</th>
                <th>From Account</th>
                <th>To Account</th>
                <th>Amount</th>
                <th>Frequency</th>
                <th>Next Transfer</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Rent Payment</td>
                <td>1001 - Checking</td>
                <td>2001 - Landlord</td>
                <td>$1,200.00</td>
                <td>Monthly</td>
                <td>May 1, 2023</td>
                <td class="status-active">Active</td>
                <td>
                    <button class="action-btn">Edit</button>
                    <button class="action-btn delete">Delete</button>
                </td>
            </tr>
            <tr>
                <td>Savings Deposit</td>
                <td>1001 - Checking</td>
                <td>1002 - Savings</td>
                <td>$500.00</td>
                <td>Bi-Weekly</td>
                <td>April 15, 2023</td>
                <td class="status-active">Active</td>
                <td>
                    <button class="action-btn">Edit</button>
                    <button class="action-btn delete">Delete</button>
                </td>
            </tr>
            <tr>
                <td>Car Payment</td>
                <td>1002 - Savings</td>
                <td>3001 - Auto Loan</td>
                <td>$350.00</td>
                <td>Monthly</td>
                <td>April 30, 2023</td>
                <td class="status-paused">Paused</td>
                <td>
                    <button class="action-btn">Resume</button>
                    <button class="action-btn delete">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<script>
    // Select recurrence option
    function selectRecurrence(element, type) {
        // Remove 'selected' class from all
        document.querySelectorAll('.recurrence-option').forEach(opt => {
            opt.classList.remove('selected');
            opt.querySelector('input[type="radio"]').checked = false;
        });

        // Add 'selected' class to clicked one
        element.classList.add('selected');
        element.querySelector('input[type="radio"]').checked = true;
    }

    // Handle end option changes
    document.getElementById('endOption').addEventListener('change', function() {
        const endAfter = document.getElementById('endAfter');
        const endOnDate = document.getElementById('endOnDate');

        endAfter.style.display = 'none';
        endOnDate.style.display = 'none';

        if (this.value === 'AFTER') {
            endAfter.style.display = 'block';
        } else if (this.value === 'ON') {
            endOnDate.style.display = 'block';
        }
    });

    // Verify destination account
    document.getElementById('toAccount').addEventListener('blur', function() {
        const destInfo = document.getElementById('destinationInfo');
        const accountNumber = this.value.trim();

        if (accountNumber.length > 0) {
            // In a real app, this would be an AJAX call to verify the account
            if (accountNumber === '2001') {
                document.getElementById('destAccountHolder').textContent = 'Jane Smith';
                document.getElementById('destAccountType').textContent = 'Checking';
                destInfo.style.display = 'block';
            } else if (accountNumber === '1002') {
                document.getElementById('destAccountHolder').textContent = 'Yourself';
                document.getElementById('destAccountType').textContent = 'Savings';
                destInfo.style.display = 'block';
            } else {
                destInfo.style.display = 'none';
                // In a real app, you might show an error for invalid accounts
            }
        } else {
            destInfo.style.display = 'none';
        }
    });

    // Set default start date to tomorrow
    window.addEventListener('load', function() {
        const tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 1);
        const formattedDate = tomorrow.toISOString().split('T')[0];
        document.getElementById('startDate').value = formattedDate;
        document.getElementById('startDate').min = formattedDate;
    });

    // Form validation
    document.getElementById('scheduleForm').addEventListener('submit', function(e) {
        const amount = parseFloat(document.getElementById('amount').value);
        const fromAccount = document.getElementById('fromAccount').value;

        if (amount <= 0) {
            alert('Amount must be greater than zero');
            e.preventDefault();
            return;
        }

        if (!fromAccount) {
            alert('Please select a source account');
            e.preventDefault();
            return;
        }

        // Additional validation could be added here
    });

    function resetForm() {
        document.getElementById('scheduleForm').reset();
        document.querySelector('.recurrence-option.selected').classList.remove('selected');
        document.querySelector('input[value="WEEKLY"]').checked = true;
        document.querySelector('.recurrence-option:first-child').classList.add('selected');
        document.getElementById('customRecurrence').classList.remove('active');
        document.getElementById('endAfter').style.display = 'none';
        document.getElementById('endOnDate').style.display = 'none';
    }
</script>
</body>
</html>
