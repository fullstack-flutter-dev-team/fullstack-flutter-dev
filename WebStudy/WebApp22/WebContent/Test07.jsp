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
<title>Test07.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
    <h1>JSTL 코어(Core) import 문 실습</h1>
    <hr />
</div>


<div>
    <p>『c:import』는 URL 처리에 관여하며,</p>
    <p>URL 을 활용하여 다른 자원의 결과를 삽입할 때 사용한다.</p>
</div>

<div>
    <!-- 변수 지정(url) -->
	<c:set var="url" value="Gugudan.jsp"></c:set>
    
    <!-- c:import활용 -->
<%--     <c:import url="${url }" var="impt"></c:import> --%>

    <!-- import 를 수행하며 해당 페이지가 필요로하는 파라미터 넘기기 -->
    <c:import url="${url }" var="impt">
        <%-- 파라미터 값 넘겨주기 --%>
        <c:param name="dan" value="4"></c:param>
    </c:import>
    
    <%-- 기본값(default) --%>
    <%-- 결과 화면 출력 --%>
    <c:out value="${impt }"></c:out>
    
    <!-- → 결과 화면 출력 과정에서 HTML 코드를 그대로 출력하는 구문 -->
    <!-- 이 때, 『escapeXML』 속성의 기본값(default)은 true 로 설정되어 있다. -->
    <c:out value="${impt }" escapeXml="false"></c:out>
    <c:out value="${impt }" escapeXml="true"></c:out>

</div>

</body>
</html>