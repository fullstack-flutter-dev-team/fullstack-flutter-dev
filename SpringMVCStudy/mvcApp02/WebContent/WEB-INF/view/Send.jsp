<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<%!
String COLOR_RED      = "\u001B[31m" ;
String COLOR_GREEN    = "\u001B[32m" ;
String COLOR_YELLOW   = "\u001B[33m" ;
String COLOR_BLUE     = "\u001B[34m" ;
%>

<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
    <h1>Spring MVC 데이터 송수신 실습</h1>
    <hr>
</div>

<div>
    <!-- 모델 1방식 <form action="Receive.jsp" method="post"> -->
    <!-- 모델 서블릿 <form action="receive" method="post"> -->
    <form action="receive.do" method="post">
        이름 <input type="text" name="userName"/>
        <button type="submit">submit</button>
    </form>
</div>


</body>
</html>