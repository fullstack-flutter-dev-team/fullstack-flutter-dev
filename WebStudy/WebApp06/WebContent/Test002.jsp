<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
    <div>
        <h1>page 디렉티브 관찰</h1>
        <p></p>
        <hr>
    </div>

    <%@ include file="Test003.jsp" %>
    <div>
        <h2><%=str %></h2>
        <h2><%=name %></h2>
    </div>
</body>
</html>