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
<title>PositionList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    $(function() {
        // 수정 버튼 클릭 시 액션 처리
        $(".updateBtn").click(function() {
            console.log(">>>> updateBtn : " + $(this).val());
            
            // 수정 폼 페이지 요청
            //-- 요청하며 regionId 넘겨주기
            $(location).attr("href", "positionUpdateForm.action?positionId=" + $(this).val());
            //-- location.href="...";
        });
        
        // 삭제 버튼 클릭 시 액션 처리
        $(".deleteBtn").click(function() {
            console.log(">>>> deleteBtn : " + $(this).val());
            if (confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
            {
                // 테스트
                //alert("삭제 처리");
                $(location).attr("href", "positionDelete.action?positionId=" + $(this).val());
            }
            
        });
    });// $(function() {

</script>

</head>
<body>

<!--
---------------------------------------------------------------- 
    #. PositionList.jsp
         → [직위] 리스트 출력 뷰 페이지
         → 관리자가 접근하는 [직위] 데이터 출력 페이지
           - 관리 기능 포함
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
    
        <h1>[ 직위 관리 (관리자 전용) ]</h1>
        <hr />
        
        <div>
            <form>
                <input type="button" value="직위 추가" class="btn"
                       onclick="location.href='positionInsertForm.action'">
            </form>
        </div>
        <br>
    
        <!------------------------------------------------------- 
           POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK
        -------------------------------------------------------->
        <table id="customers" class="table">
            <tr>
                <!-- 항목 4 EA -->
                <th>번호</th>
                <th>직위명</th>
                <th>최소 기본급</th>
                <th>삭제가능</th>
                
                <!-- 기능 2 EA -->
                <th>수정</th>
                <th>삭제</th>
            </tr>
            
             <c:forEach var="position" items="${positionList }">
                <tr>
                    <td>${position.positionId }</td>
                    <td>${position.positionName }</td>
                    <td>${position.minBasicPay }</td>
                    <td>${(position.delCheck > 0) ? "X" : "O" }</td>
                    <td>
                        <button type="button" class="btn updateBtn"
                                value="${position.positionId }">수정</button>
                    </td>
                    <td>
                        <button type="button" class="btn deleteBtn" 
                                value="${position.positionId }" 
                                ${(position.delCheck > 0) ? "disabled=\"disabled\"" : ""}>삭제</button>
                    </td>
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