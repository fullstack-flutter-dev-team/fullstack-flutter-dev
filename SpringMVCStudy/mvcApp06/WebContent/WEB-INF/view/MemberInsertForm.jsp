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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
    label {
        display: inline-block;
        width: 100px;
    }
</style>
</head>
<body>

<div>
    <h1>회원 데이터 입력 폼</h1>
    <hr>
</div>

<div>
    <form action="memberinsert.action" method="post">
        <label  for="id">아이디</label>
        <input type="text" name="id" id="id"><br>
       
        <label for="pw">패스워드</label>
        <input type="password" name="pw" id="pw"><br>
       
        <label for="name">이름</label>
        <input type="text" name="name" id="name"><br>
     
        <label for="tel">전화</label>
        <input type="tel" name="tel" id="tel"><br>
     
        <label for="email">이메일</label>
        <input type="email" name="email" id="email"><br>
        <br>
        
        <button type="submit" class="btn">입력완료</button>
        <button type="reset" class="btn">다시입력</button>
    </form>
</div>
</body>
</html>