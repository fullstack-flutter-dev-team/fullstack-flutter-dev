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
<title>MVCBegin.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
    <h1>MVC 관찰 및 실습</h1>
    <hr />
</div>

<%--
○ MVC 관련 실습 1
   - prj : WebApp24
     - web.xml       → Servlet 등록, URL 매핑
     - MVCBegin.java → Controller 역할 클래스 (서블릿 클래스, Servlet)
     - MVCBegin.jsp  → View 역할(JSP 페이지)

   - 사용자 최초 요청 주소
     - http://localhost:3306/WebApp24/mvcbegin
 --%>
     
<div>
    <!--  -->
    <h2>${message }</h2>
</div>


</body>
</html>