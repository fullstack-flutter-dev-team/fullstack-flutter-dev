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
<title>MVCTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
    <h1>MVC 관찰 및 실습 3</h1>
    <hr />
</div>


<div>
<!--     <ul> -->
<!--         <li>1</li> -->
<!--         <li>2</li> -->
<!--         <li>3</li> -->
<!--         <li>4</li> -->
<!--         <li>5</li> -->
<!--         <li>6</li> -->
<!--     </ul> -->
</div>

<!-- 
       Model 이 처리한 업무 내용을
       Controller로 부터 수신한 결과에 대한 처리
 -->
 
 <details open="open">
     <summary>결과 확인</summary>
        <h4><span style="background-color: green;">1 부터 100 까지의 수 출력</span></h4>
        <ul>
        <c:forEach items="${modelActionResult }" var="list" varStatus="status">
            <li> index: ${status.index } -  count: ${status.count } : number: ${list }</li>
        </c:forEach>
        </ul>
</details>
</body>
</html>