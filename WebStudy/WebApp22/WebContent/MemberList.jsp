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
// MemberList.jsp


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
    <h1>JSTL 코어(core) set문 실습</h1>
    <p>회원 명단 확인</p>
    <hr />
</div>

<div>
    <!-- 이름, 전화번호, 주소 항목으로 리스트 구성 →  JSTL 활용 -->
    <table class="table">
        <tr>
            <th>이름</th>
            <th>전화번호</th>
            <th>주소</th>
        </tr>
 
        <%-- 컬렉션 객체를 처리하기 위한 반복문 구성 --%>
        <%-- <c:forEach var="변수" items="컬렉션"></c:forEach> --%>
        <c:forEach var="member" items="${memberList }">
            <tr>
                <td style="test-align: center;">${member.name }</td>
                <td style="test-align: center;">${member.tel }</td>
                <td style="test-align: center;">${member.addr }</td>
            </tr>
        </c:forEach>
    </table>
    
</div>


</body>
</html>