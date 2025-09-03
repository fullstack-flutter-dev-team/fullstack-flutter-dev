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
<title>MVCTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
    <h1>MVC 관찰 및 실습 2</h1>
    <hr />
</div>

<%--
    ○ Controller로 부터 수신한 1 부터 100 까지의 결과물을 가지고 클라이언트 만나기
 --%>
 
 <details>
     <summary>결과 확인</summary>
        <p><span>리스트 출력</span><br>
        <c:forEach items="${list }" var="list" varStatus="status">
            ${status.count } : <c:out value="${list }" escapeXml="false"></c:out><br>
        </c:forEach><br>
        </p>
</details>

 <div>
     <h1>결과 확인</h1>
     <p><span>리스트 출력</span><br>
    <c:forEach items="${list }" var="list" varStatus="status">
        ${status.count } : <c:out value="${list }" escapeXml="false"></c:out><br>
    </c:forEach><br>
<!--     <p><span>Map 출력</span><br> -->
<%--     <c:forEach items="${map }" var="map" varStatus="status"> --%>
<%--         <c:forEach items="map.keys()" var="item" ></c:forEach> --%>
<%--     </c:forEach> --%>
<!--     </p> -->
    </p>
 </div>

</body>
</html>