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
<title>LoginForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    $(function() {
        $("#loginForm").click(function(event) {
//             event.preventDefault();
            var id = $("#id").val();
            var pw = $("#pw").val();
            var admin = $("#admin").is(":checked") ? "0" : "1";
            // alert(id + ", " + pw + ", " + admin);
            <%-- if (id == "") {
                $("#error").text("아이디를 입력하세요.").show();
                $("#id").focus();
                return false;
            }
            if (pw == "") {
                $("#error").text("패스워드를 입력하세요.").show();
                $("#pw").focus();
                return false;
            }

            // 정상적인 폼 전송
            // $("#loginForm").submit();
            $.ajax({
                url: "login.action",
                type: "post",
                data: {
                    id: id,
                    pw: pw,
                    admin: admin
                },
                dataType: "json",
                success: function(data) {
                    // alert("data : " + data);
                    if (data.result == "OK") {
                        // alert("로그인 성공");
                        location.href = "main.action";
                    } else {
                        // alert("로그인 실패");
                        $("#error").text("아이디 또는 패스워드가 올바르지 않습니다.").show();
                        $("#id").val("").focus();
                        $("#pw").val("");
                    }
                },
                error: function(request, status, error) {
                    // alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
                    $("#error").text("서버와의 통신에 문제가 발생했습니다.").show();
                }
            });//$.ajax({ --%>

            $("#submitBtn").click(function() {
                if ($("#id").val() == "" || $("#pw").val() == "") {
                    <%-- $("#error").text("아이디 또는 패스워드를 입력하세요.").show(); --%>
                    $("#error").text("항목을 모두 입력해야 합니다.").show();
                    return false;
                }


                $("#loginForm").submit();
            });//$("#submitBtn").click(function() {


        });//$("#loginForm").click(function(event) {
    });//$(function() {
</script>
</head>
<body>

<!-- ----------------------------------------------------
       - #29. LoginForm.jsp
         - 관리자, 일반사원 로그인 폼 뷰 페이지
         - ID(employeeId), PW(주민번호 뒤 7자리) 입력
     -----------------------------------------------------  
-->

<div>
    <div>
        <h1>로그인</h1>
        <hr />
    </div>
</div>

<!-- 콘텐츠 영역 -->
<div id="content">
    <form action="login.action" method="post" id="loginForm">
        <table>
                <tr>
                    <th>
                        <label for="id">ID</label>
                    </th>
                    <td>
                        <input type="text" id="id" name="id" placeholder="아이디" required="required">
                        <input type="checkbox" id="admin" name="admin" value="1">
                        <label for="admin">admin</label>
                    </td>
                </tr>
                <tr>
                    <th>
                        <label for="pw">PW</label>
                    </th>
                    <td>
                        <input type="password" id="pw" name="pw" placeholder="패스워드" required="required">
                    </td>
                </tr>
                
                <tr style="height: 10px;">
                    <!-- 공간을 두기 위해 비어있는 tr -->
                </tr>
                
                <tr>
                    <th colspan="2">
                        <input type="button" value="로그인" id="submitBtn" class="btn"
                        style="width: 48%;">
                        <input type="reset" value="취소" id="resetBtn" class="btn"
                        style="width: 48%;">
                        <br /><br />
                        
                        <span id="error" style="color: red; display: none; font-size: small;"></span>
                        
                    </th>
                </tr>
            </table>
    </form>
</div>


</body>
</html>