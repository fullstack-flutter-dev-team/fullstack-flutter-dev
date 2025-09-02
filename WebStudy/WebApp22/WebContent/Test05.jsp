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
<title>Test05.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
	<h1>JSTL 코어(core) set문 실습</h1>
	<p>지수승 구하기</p>
	<hr />
</div>

<div>
	<form action="post">
		정수-1<input type="text" name="su1" class="txt"/><br>
		정수-2<input type="text" name="su2" class="txt"/><br>
		<button type="submit" class="btn" style="width: 20%;">결과 확인</button>
	</form>
</div>

<div>
    <p>『c:set』은 JSP 의 setAttribute() 와 같은 역할을 수행한다.</p>
    <p> (page | request | session | application)
        범위의 변수(속성)을 설정한다.</p>
    <p>『c:remove』는 JSP 의 removeAttribute() 와 같은 역할을 수행한다.</p>
    <p> (page | request | session | application)
        범위의 변수(속성)을 제거한다.</p>
    <p>scope 속성이 생략될 경우 기본 값(default)은 page 이다.</p>
</div><br>


<div>
    <!-- 결과 확인 -->
    <c:if test="${!empty param.su1 }">
        <c:set var="result" value="1"></c:set>
            <%-- 『<c:set var="변수" value="값"> ~ </c:set>』 --%>
            <%--
                → 변수를 선언하고 그 변수의 값을 할당할 수 있도록 처리해주는 구문
                → 해당 스코프에 지정된 변수가 존재하지 않을 경우
                   변수를 새로 선언하여 초기화 하는 효과가 적용되며
                   해당 스코프에 이미 지정된 변수가 존재할 경우
                   (즉, 같은 이름을 가진 변수가 보이는 상황이면....)
                   그 변수의 값을 갱신하는 효과가 적용된다.
            --%>
        <c:forEach var="a" begin="1" end="${param.su2 }" step="1">
            <c:set var="result" value="${result*param.su1 }"></c:set>
            <p>${param.su1 }^${a } = ${result }</p>         
        </c:forEach>
    </c:if>
</div>

</body>
</html>