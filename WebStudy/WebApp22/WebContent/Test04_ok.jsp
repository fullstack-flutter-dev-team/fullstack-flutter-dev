<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MyData"%>
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
<title>Test04_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core) 반복문 실습</h1>
	<p>자료구조 활용</p>
	<hr />
</div>


<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
 
 <%--       
        <%
        for (MyData dto : (ArrayList<MyData>)(request.getAttribute("list")))
        {
        %>
        
        
        <%
        }
        %>
--%>
    <%-- 컬렉션 객체를 처리하기 위한 반복문 구성 --%>
    <%-- <c:forEach var="변수" items="컬렉션"></c:forEach> --%>
    <c:forEach var="dto" items="${list }">
        <tr>
            <td style="test-align: center;">${dto.name }</td>
            <td style="test-align: center;">${dto.age }</td>
        </tr>
    </c:forEach>
    </table>
</div>

</body>
</html>