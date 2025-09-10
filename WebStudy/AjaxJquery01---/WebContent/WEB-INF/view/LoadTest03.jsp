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
<title>LoadTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
    <h1>jQuery 의 load() 활용 실습</h1>
    <hr />
</div>

<div>
    <input type="text" id="su1" class="txt txtNum"/>
    <select id="oper">
        <option value="add">덧셈</option>
        <option value="sub">뺄셈</option>
        <option value="mul">곱셈</option>
        <option value="div">나눗셈</option>
    </select>
    <input type="text" id="su2" class="txt txtNum"/>
    <input type="button" value=" = " id="sendButton" class="btn"/>
</div>

<!-- 

loadtest03send.do → LoadTest03send.java → LoadTest03.jsp 
                                loadtest03.do → LoadTest03.java → LoadTest03ok.jsp

 -->

<!-- AJAX 를 활용한 결과 갱신 -->
<div id="result">

</div>


<div>
    <input type="radio" name="rdo">rdo1
    <input type="radio" name="rdo">rdo2
</div>

<div>
    <input type="checkbox" name="chk">chk1
    <input type="checkbox" name="chk">chk2
</div>

<div>
    <input type="text" />
</div>

</body>
</html>