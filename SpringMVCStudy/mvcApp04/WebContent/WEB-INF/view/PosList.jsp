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
<title>PosList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">
    .table th {
        text-align: center;
    }
</style>
</head>
<body>

<!--
---------------------------------------------------------------- 
    #. PosList.jsp
         → [직위] 리스트 출력 뷰 페이지
         → 일반직원이 접근하는 [직위] 데이터 출력 페이지
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
    
        <h1>[ 직위 목록 (일반직원 전용) ]</h1>
        <hr />
        <br>
    
        <!------------------------------------------------------- 
           POSITIONID, POSITIONNAME, MINBASICPAY
        -------------------------------------------------------->
        <table id="customers" class="table">
            <tr>
                <!-- 항목 3 EA -->
                <th>번호</th>
                <th>직위명</th>
                <th>최소 기본급</th>
            </tr>
            
             <c:forEach var="position" items="${positionList }">
                <tr>
                    <td>${position.positionId }</td>
                    <td>${position.positionName }</td>
                    <td>${position.minBasicPay }</td>
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