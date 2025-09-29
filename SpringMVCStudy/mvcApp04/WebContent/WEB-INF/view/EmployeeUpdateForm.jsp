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
<title>EmployeeUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- <script type="text/javascript" src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script> -->
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">
    
    $(function() {
        // AJAX 요청 및 응답 처리
        ajaxRequest()
        
        $("#birthday").datepicker({
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            changeYear: true,
        });
        
        // 직위(select)의 선택된 내용이 변경되었을 경우 수행해야 할 코드 처리
        $("#positionId").change(function() {
            // 확인
           console.log(">>> positionId changed...");
            
            // AJAX 요청 및 응답 처리
            ajaxRequest()
        });
        
        // 직원 추가 버튼이 클릭되었을 때 수행해야 할 코드 처리
        $("#submitBtn").click(function() {
            
            // 데이터 검사
            //-- 누락된 입력값이 있는지 없는지 대한 여부 확인
            //    이름, 주민번호앞자리, 주민번호뒷자리, 생년월일, 전화번호, 기본급
            //    항목 누락 시 → 필수 입력 항목이 누락되었음을 안내
            if ($("#name").val() == "" || $("#ssn1").val() == "" || $("#ssn2").val() == ""
                || $("#birthday").val() == "" || $("#telephone").val() == "" 
                || $("#basicPay").val() == "" )
            {
                $("#err").html("필수 입력 항목이 누락되었습니다.");
                $("#err").css("display", "inline");
                return;                             //-- submit 액션 처리 중단
            }
            
            // 최소 기본급에 대한 유효성 검사
            //-- if (직급별 최소 기본급 > 사용자가 입력한 기본급)
            //    → 입력한 기본급이 최소기본급보다 적음을 안내 후 
            //     submit 액션 처리 중단.
            if (parseInt($("#minBasicPay").text()) > parseInt($("#basicPay").val()) )
            {
                $("#err").html("입력한 기본급이 최소 기본급보다 적습니다.");
                $("#err").css("display", "inline");
                return;                             //-- submit 액션 처리 중단
            }
            
            // 폼 submit액션 처리 수행
            $("#employeeForm").submit();
        });
        
    });//$(function() {
        
    // AJAX 요청 및 응답 처리 시 호출되는 함수 정의
    function ajaxRequest() {
        console.log(">>> ajaxRequest ");
        
        // 『$.post()』 / 『$.get()』
        //-- jQuery 에서 AJAX 를 사용해야 할 경우 지원해주는 함수
        //   (서버 측에서 요청한 데이터를 받아오는 기능의 함수)
        
        // 『$.post()』 / 『$.get()』
        //-- jQuery 에서 Ajax 를 써야 할 경우 지원해 주는 함수
        //   (서버 측에서 요청한 데이터를 받아오는 기능의 함수)
        
        // ※ 위 함수 (『$.post()』)의 사용 방법(방식)
        //--  『$.post(요청주소, 전송데이터, 응답액션처리);』
        //     ·요청주소(url)
        //       → 데이터를 요청할 주소(파일)에 대한 정보
        //     ·전송데이터(data)
        //       → 서버 측에 요청하는 과정에서 내가 전달할 파라미터
        //     ·응답액션처리(function)
        //       → 응답을 받아 처리하는 함수(기능 처리)
        
        // ※ 참고로... 전송 데이터(data) 는 파라미터의 데이터타입을 그대로 취하게 되므로
        //    html 이든... 문자열이든... 상관이 없다.
        $.post("ajax.action", {positionId: $("#positionId").val()}, function(data)
        {
//             console.log(">>>data:" + data.minBasicPay);
            console.log(">>>data:" + data);
            $("#minBasicPay").html(data);
        });
        
    }// function ajaxRequest() {

</script>
</head>
<body>

<!-- 
===============================================
       - #24. 
          - EmployeeUpdateForm.jsp
          - 직원 데이터 수정 폼 뷰 페이지
          - 관리자만 접근 허용
===============================================
-->


<div>
    <!-- 메뉴 영역 -->
    <div>
        <c:import url="EmployeeMenu.jsp"></c:import>
    </div>
    
    <!-- 콘텐츠 영역 -->
    <div id="content">
    
        <h1>[ 직원 추가 (관리자 전용) ]</h1>
        <hr>
        
        <form action="employeeupdate.action" method="post" id="employeeForm">
            <table>
                <!-- 기본 입력 폼과 비교했을 때 추가되는 항목 -->
                <!-- → 사원번호 -->
                <tr>
                    <th>사원번호</th>
                    <td>
                        <input type="text" id="employeeId" name="employeeId" placeholder="사원번호" readonly="readonly" value="${employee.employeeId }">
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                        <input type="text" id="name" name="name" placeholder="사원명" value="${employee.name }">
                    </td>
                </tr>
                <tr>
                    <th>주민번호</th>
                    <td>
                        <input type="text" id="ssn1" name="ssn1" style="width: 110px;" maxlength="6"
                            placeholder="앞 6자리" value="${employee.ssn1 }">
                            -
                        <input type="password" id="ssn2" name="ssn2" style="width: 160px;" maxlength="7"
                            placeholder="뒤 7자리" value="${employee.ssn2 }">
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>
                        <input type="text" id="birthday" name="birthday" placeholder="생년월일" value="${employee.birthday }">
                    </td>
                </tr>
                <tr>
                    <th>양/음력</th>
                    <td>
                    <c:if test = "${employee.lunar == 0}">
                        <input type="radio" value="0" name="lunar" id="lunar0" checked="checked">
                        <label for="lunar0">양력</label>
                        <input type="radio" value="1" name="lunar" id="lunar1">
                        <label for="lunar1">음력</label>
                    </c:if>
                    <c:if test = "${employee.lunar == 1}">
                        <input type="radio" value="0" name="lunar" id="lunar0">
                        <label for="lunar0">양력</label>
                        <input type="radio" value="1" name="lunar" id="lunar1" checked="checked">
                        <label for="lunar1">음력</label>
                    </c:if>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="tel" id="telephone" name="telephone" placeholder="전화번호" value="${employee.telephone}">
                    </td>
                </tr>
                <tr>
                    <th>지역</th>
                    <td>
                        <select id="regionId" name="regionId">
                            <c:forEach var="region" items="${regionList }">
                                <c:if test = "${employee.regionId == region.regionId}">
                                    <option value="${region.regionId }" selected="selected">${region.regionName }</option>
                                </c:if>
                                <c:if test = "${employee.regionId != region.regionId}">
                                    <option value="${region.regionId }">${region.regionName }</option>
                                </c:if>
                            </c:forEach>
                            <!-- 
                            <option value="1">관악구</option>
                            <option value="2">마포구</option>
                            <option value="3">은평구</option>
                            <option value="4">도봉구</option>
                             -->
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <th>부서</th>
                    <td>
                        <select id="departmentId" name="departmentId">
                            <c:forEach var="department" items="${departmentList }">
                                <c:if test = "${employee.departmentId == department.departmentId}">
                                    <option value="${department.departmentId }" selected="selected">${department.departmentName }</option>
                                </c:if>
                                <c:if test = "${employee.departmentId != department.departmentId}">
                                    <option value="${department.departmentId }">${department.departmentName }</option>
                                </c:if>
                            </c:forEach>
                            <!-- 
                            <option value="1">축구부</option>
                            <option value="2">야구부</option>
                            <option value="4">농구부</option>
                            <option value="3">수영부</option>
                             -->
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>직위</th>
                    <td>
                        <select id="positionId" name="positionId">
                            <c:forEach var="position" items="${positionList }">
                              <%-- <c:if test = "${employee.positionId == position.positionId}">
                                 <option value="${position.positionId }" selected="selected">${position.positionName }</option>
                                </c:if>
                                <c:if test = "${employee.positionId != position.positionId}">
                                 <option value="${position.positionId }">${position.positionName }</option>
                                </c:if> 
                             --%>
                                <option value="${position.positionId }" ${employee.positionId == position.positionId ? "selected=\"selected\"" : "" } }>${position.positionName }</option>
                            </c:forEach>
                            <!-- 
                            <option value="1">팀장</option>
                            <option value="2">기술고문</option>
                            <option value="3">팀원</option>
                            <option value="5">엑스맨</option>
                             -->
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <th>기본급</th>
                    <td>
                        <input type="text" id="basicPay" name="basicPay" value="${employee.basicPay }">
                        (최소 기본급 <span id="minBasicPay" style="color: red; font-weight: bold;">0</span>원)
                    </td>
                </tr>
                <tr>
                    <th>수당</th>
                    <td>
                        <input type="text" id="extraPay" name="extraPay" value="${employee.extraPay }">
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <br><br>
                        
                        <button type="button" class="btn" id="submitBtn"
                        style="width: 40%; height: 50%;">직원 변경</button>
                        
                        <button type="button" class="btn" id="listBtn"
                            style="width: 40%; height: 50%;"
                            onclick="location.href='employeelist.action'">직원 리스트</button>
                        <br><br>
                        
                        <span id="err" style="color: red; font-weight: bold; display: none;">
                        <!-- 필수 입력 항목이 누락되었습니다. -->
                        <!-- 입력한 기본급이 최소 기본급보다 적습니다. -->
                        </span>
                        
                    </td>
                </tr>
            </table>
        </form>     
    </div>  
    
    <!-- 회사 소개 및 어플리케이션 소개 영역 -->
    <div id="footer">
    </div>
    
</div>




</body>
</html>