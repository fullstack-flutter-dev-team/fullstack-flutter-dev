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
<title>EmployeeMenu.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
</head>
<body>

<!------------------------------ 
#13. EmployeeMenu.jsp
     - 메인 메뉴 뷰(페이지) 구성
     - 직원 관리, 부서 관리, 지역 관리, 직위 관리
     - 로그아웃 기능 포함
     - 로그인 권한에 따른 분기 
------------------------------->

<!-- 테스트 -->
<!-- 
<span>${sessionScope.admin==null ? "normal" : "admin" }</span>
-->

<div id="menu">
    <ul>
        <!--         
        <li>
            <a href="employeelist.action" class="menu">직원 정보</a>
        </li>
        <li>
            <a href="reglist.action" class="menu">지역 정보</a>
        </li>
        <li>
            <a href="deptlist.action" class="menu">부서 정보</a>
        </li>
        <li>
            <a href="poslist.action" class="menu">직위 정보</a>
        </li>
        <li>
            <a href="logout.action" class="menu">로그 아웃</a>
        </li> 
        -->

        <c:choose>
            <c:when test="${sessionScope.admin==null}">
                <li>
                    <a href="emplist.action" class="menu">직원 정보</a>
                </li>
                <li>
                    <a href="reglist.action" class="menu">지역 정보</a>
                </li>
                <li>
                    <a href="deptlist.action" class="menu">부서 정보</a>
                </li>
                <li>
                    <a href="poslist.action" class="menu">직위 정보</a>
                </li>
            </c:when>   
            <c:otherwise>          
                <li>
                    <a href="employeelist.action" class="menu">직원 관리</a>
                </li>
                <li>
                    <a href="regionlist.action" class="menu">지역 관리</a>
                </li>
                <li>
                    <a href="departmentlist.action" class="menu">부서 관리</a>
                </li>
                <li>
                    <a href="positionlist.action" class="menu">직위 관리</a>
                </li>
            </c:otherwise>
        </c:choose>

        <li>
            <a href="logout.action" class="menu">로그 아웃</a>
        </li>
    </ul>
</div>


</body>
</html>