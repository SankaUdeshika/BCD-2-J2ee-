<%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/17/2025
  Time: 6:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>404 - Page Not Found | Banking Admin</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
            text-align: center;
        }

        .error-container {
            background-color: white;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 600px;
            padding: 40px;
        }

        .error-code {
            font-size: 72px;
            font-weight: bold;
            color: black;
            margin-bottom: 10px;
        }

        .error-message {
            font-size: 24px;
            margin-bottom: 20px;
            color: #555;
        }

        .error-description {
            font-size: 16px;
            margin-bottom: 30px;
            color: #777;
            line-height: 1.5;
        }

        .bank-icon {
            font-size: 50px;
            margin-bottom: 20px;
            color: black;
        }

        .action-buttons {
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            margin: 0 10px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
            transition: all 0.3s;
        }

        .btn-primary {
            background-color: black;
            color: white;
            border: 1px solid black;
        }

        .btn-secondary {
            background-color: white;
            color: black;
            border: 1px solid black;
        }

        .btn-primary:hover {
            background-color: #333;
            border-color: #333;
        }

        .btn-secondary:hover {
            background-color: #f5f5f5;
        }

        .technical-details {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            font-size: 12px;
            color: #999;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="error-container">
    <div class="bank-icon">🏦</div>
    <div class="error-code">404</div>
    <div class="error-message">Page Not Found</div>
    <div class="error-description">
        The requested page could not be found on our banking server.<br>
        This may be due to a mistyped URL or an outdated link.
    </div>

    <div class="action-buttons">
        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp" class="btn btn-primary">
            Go to Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/index.jsp/" class="btn btn-secondary">
            Home Page
        </a>
    </div>


    <div class="technical-details">
        <strong>Technical Details:</strong><br>
        ${requestScope["jakarta.servlet.error.status.code"]}
        ${requestScope["jakarta.servlet.error.message"]}
    </div>

</div>
</body>
</html>
