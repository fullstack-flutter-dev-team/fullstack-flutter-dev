<%@page import="com.util.DBCPConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
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
Connection conn = DBCPConn.getConnection();

String result = "";

if(conn!=null)
    result = "데이터베이스 연결 성공";
else
    result = "데이터베이스 연결 실패";

DBCPConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCPActionTest.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
    <h1>DBCP를 활용한 데이터베이스 접속 실습</h1>
    <hr />
</div>

<div>
    <h2>결과 확인</h2>
<!--     <h3>연결 상태</h3> -->
    <h3><%=result %></h3>
</div>

</body>
</html>