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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
    .table {
      border: 1px solid;
    }
</style>
</head>
<body>


<div>
    <h1>회원 명단</h1>
    <hr>
    
    <h2><a href="memberinsertform.action">회원 등록</a></h2>

</div>

<div>
    <table class="table">
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>이메일</th>
        </tr>
        <c:forEach var="member" items="${memberList }">
        <tr>    
            <td>${member.id}</td>
            <td>${member.name }</td>
            <td>${member.tel }</td>
            <td>${member.email }</td>
        </tr>
        </c:forEach>
        <!-- 
        <tr>
            <td>0</td>
            <td>김한국</td>
            <td>010-9998-8887</td>
            <td>korea@test.com</td>
        </tr>
         -->
    </table>
</div>

</body>
</html>