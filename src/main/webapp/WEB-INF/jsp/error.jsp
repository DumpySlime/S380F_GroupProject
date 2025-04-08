<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误 - 在线课程管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 500px;
            text-align: center;
        }
        h1 {
            color: #d9534f;
            margin-bottom: 20px;
        }
        p {
            color: #666;
            margin-bottom: 25px;
            line-height: 1.5;
        }
        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #5cb85c;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }
        .back-button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>出错了！</h1>
        <p>抱歉，系统处理您的请求时遇到了问题。</p>
        <p>这可能是由于系统正在维护或您没有访问权限。</p>
        <a href="/login" class="back-button">返回登录页面</a>
    </div>
</body>
</html> 