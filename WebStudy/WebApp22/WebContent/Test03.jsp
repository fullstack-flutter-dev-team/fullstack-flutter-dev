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
<title>Test03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core) 반복문 실습</h1>
	<hr />
</div>

<div>
	<table class="table">
        <%-- JSTL 코어(core) 반복문 --%>
        <%-- 
        『c:forEach var="변수" begin="시작값" end="끝값" step="증가값" ~ /c:forEach』
        --%>
        
        <c:forEach var="a" begin="1" end="9" step="1"> <%-- a: 1 ~ 9 --%>
            <tr>
                <c:forEach var="b" begin="1" end="6" step="1"> <%-- b: 1 ~ 6 --%>
                    <td style="width: 5px;">
                        <%-- 테스트 --%>
                        ${a*b }
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>