<%--
  Created by IntelliJ IDEA.
  User: sanka
  Date: 7/20/2025
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isErrorPage="true" %>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            background-color: rgb(51, 51, 51);
            width: 100vw;
            height: 100vh;
            color: white;
            font-family: 'Arial Black';
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .error-num {
            font-size: 8em;
        }

        .eye {
            background: #fff;
            border-radius: 50%;
            display: inline-block;
            height: 100px;
            position: relative;
            width: 100px;
        }

        .eye::after {
            background: #000;
            border-radius: 50%;
            bottom: 56.1px;
            content: '';
            height: 33px;
            position: absolute;
            right: 33px;
            width: 33px;
        }

        p {
            margin-bottom: 4em;
        }

        a {
            color: white;
            text-decoration: none;
            text-transform: uppercase;
        }

        a:hover {
            color: lightgray;
        }

    </style>
</head>
<body>
<div>
    <span class='error-num'>5</span>
    <div class='eye'></div>
    <div class='eye'></div>

    <p class='sub-text'>${requestScope["jakarta.servlet.error.status.code"]}
        ${requestScope["jakarta.servlet.error.message"]}.</p>
    <span onclick="window.history.back()">Go back</span>
</div>


<script>
    $('body').mousemove(function(event) {
        var e = $('.eye');
        var x = (e.offset().left) + (e.width() / 2);
        var y = (e.offset().top) + (e.height() / 2);
        var rad = Math.atan2(event.pageX - x, event.pageY - y);
        var rot = (rad * (180 / Math.PI) * -1) + 180;
        e.css({
            '-webkit-transform': 'rotate(' + rot + 'deg)',
            'transform': 'rotate(' + rot + 'deg)'
        });
    });

</script>

</body>
</html>
