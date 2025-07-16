<%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/15/2025
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Banking Administration - Login</title>
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
        }

        .login-container {
            background-color: white;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            padding: 30px;
            text-align: center;
        }

        .logo {
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: bold;
            color: black;
        }

        .login-form input {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ddd;
            box-sizing: border-box;
            background-color: white;
            color: black;
        }

        .login-form button {
            background-color: black;
            color: white;
            padding: 12px;
            border: none;
            width: 100%;
            margin: 15px 0;
            cursor: pointer;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .login-form button:hover {
            background-color: #333;
        }

        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #999;
        }

        .error-message {
            color: #d9534f;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="logo">BANK ADMIN PORTAL</div>



    <form class="login-form" action="login" method="post">
        <input type="text" name="j_username" placeholder="Administrator Username" required autofocus>
        <input type="password" name="j_password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>

    <div class="footer">
        Restricted access. For authorized personnel only.
    </div>
</div>
</body>
</html>
