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

String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
    <h1>결과 수신 페이지</h1>
    <h2>HelloReceive01.jsp)</h2>
    <hr />
</div>


<div>
    <ul>
<!--         <li><b>Frist Name :</b>길동</li> -->
        <li><b>Frist Name : </b><%=lastName %></li>
<!--         <li><b>Last  Name :</b>홍</li> -->
        <li><b>Last Name : </b><%=firstName %></li>
    </ul>
</div>

</body>
</html>