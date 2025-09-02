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
<title>Test02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core) if문 실습</h1>
	<hr />
</div>

<div>
    <!-- form의 action 속성 생략 → 데이터 전송 및 요청 페이지는 자기자신 -->
    <form action="" method="post">
        정수 <input type="text" name="su" class="txt"/><br>
        <button type="submit" class="btn">결과 확인</button>
    </form>
</div>

<div>
    <!-- 결과 확인 -->
	<h2>${param.su }</h2>
    
    <%-- ※『c:if test=""』, ~~ /c:if』 : JSTL Core if문 --%>
    <%-- 
        『test="" 』: 조건식을 지정. 파라미터로 수신한 su 에 값이 있으면...
         즉 if()에서 ()괄호안에 들어가는 구문
         empty : 비어있다
         『param.su』: EL을 활용한 폼 전송 데이터 수신하는 부분
    --%>
    <c:if test="${!empty param.su }">
        <h2>비어있지 않다.</h2>
    </c:if>
    
    <!-- 파라미터로 수신한 su가 짝수라면.... -->
    <c:if test="${param.su%2 == 0 }">
        <h2>${param.su } : 짝수...</h2>
    </c:if>
    
    <!-- 파라미터로 수신한 su가 짝수가 아니라면.... -->
    <c:if test="${param.su%2 != 0 }">
        <h2>${param.su } : 홀수...</h2>
    </c:if>
</div>

</body>
</html>