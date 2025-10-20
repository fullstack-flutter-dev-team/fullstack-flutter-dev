<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>EmpList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>

<!--
---------------------------------------------------------------- 
   - #33. EmpList.jsp
     - 직원 리스트 출력 페이지
     - 일반 직원이 접근하는 직원 데이터 출력 페이지
     - emplist.action
----------------------------------------------------------------
-->

<div>

    <!--  메뉴 영역 -->
    <div>
        <c:import url="EmployeeMenu.jsp"></c:import>
    </div>

<style type="text/css">
    .table th {
        text-align: center;
    }
</style>

    <!-- 콘텐츠 영역 -->
    <div id="content">
    
        <h1>[ 직원 목록 (일반직원 전용) ]</h1>
        <hr />
        
        <%-- 직원 추가 div 제거 --%>
        <%--         
        <div>
            <form>
                <input type="button" value="직원 추가" class="btn"
                       onclick="location.href='employeeinsertform.action'">
            </form>
        </div> 
        --%>
        <br><br>
    
        <!------------------------------------------------------- 
           EMPLOYEEID NAME SSN BIRTHDAY LUNAR LUNARNAME TELEPHONE
           DEPARTMENTID DEPARTMENTNAME POSITIONID POSITIONNAME
           REGIONID REGIONNAME BASICPAY EXTRAPAY PAY GRADE
        -------------------------------------------------------->
        <table id="customers" class="table">
            <tr>
                <!-- 항목 6 EA -->
                <th>번호</th>
                <th>이름</th>
                <th>지역</th>
                <th>부서</th>
                <th>직위</th>
                <th>등급</th>
                
                <%-- 관리 기능 삭제 - 열람만 가능 --%>
                <!-- 기능 2 EA -->
               <%--  
                <th>수정</th>
                <th>삭제</th> 
                --%>
            </tr>
            
            <!--
            <tr>
                <td>1</td>
                <td>김한국</td>
                <td>서울</td>
                <td>개발부</td>
                <td>사원</td>
                <td>관리자</td>
            </tr>
            
            <tr>
                <td>2</td>
                <td>이하나</td>
                <td>서울</td>
                <td>개발부</td>
                <td>사원</td>
                <td>일반사원</td>
            </tr>
             -->
             
             <c:forEach var="employee" items="${employeeList }">
                <tr>
                    <td>${employee.employeeId }</td>
                    <td>${employee.name }</td>
                    <td>${employee.regionName }</td>
                    <td>${employee.departmentName }</td>
                    <td>${employee.positionName }</td>
                    
                    <%-- <td>${employee.grade }</td> --%>
                    <td>${employee.grade == 0 ? "관리자" : "일반회원" }</td>
                </tr>
             </c:forEach>
                
        </table>        
    </div>
    
    <!-- 회사 소개 및 어플리케이션 소개 영역 -->
    <div id="footer">
    </div>

</div>


</body>
</html>