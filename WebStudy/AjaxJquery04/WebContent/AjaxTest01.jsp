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
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    // jQuery문법
    $(function() {
        $("#sendBtn").click(function() {
            console.log(">>> sendBtn click")

            // check~!!!
            // * jQuery의 ajax() 함수 사용
            // $ → jQuery 객체
            // $.ajax();
            //
            /*
            ---------------------------------------------------------
            $.ajax({
                type: type,             //-- 데이터 전송 및 페이지 요청 방식(→ "GET" / "POST")
                url: url,               //-- 요청 페이지 URL(→ "페이지경로포함_이름_문자열")
                data: data,             //-- 요청 페이지에서 수신하게 되는 데이터(→ 파라미터 구성)
                success: success,       //-- 페이지 요청 및 데이터 전달이 성공했을 때의 처리(→ 기능, 동작, 행위 → 함수)
                beforeSend: beforeSend, //-- 요청 전 확인해야 할 항목 처리 및 반환값 확인(→ 기능, 동작, 행위 → 함수)
                                              true - 홀드 / false - 스킵
                error: error            //-- 처리과정에서 문제가 발생했을 때의 처리(→ 기능, 동작, 행위 → 함수)
            });
            ---------------------------------------------------------
            */

            // data 구성
            //var params = "name=" + $("#name").val()
            //            + "&content=" $("#content").val();
            var params = "name=" + $.trim($("#name").val())
                        + "&content=" + $.trim($("#content").val());

            $.ajax(
            {
                type: "POST",
                url: "AjaxTest01ok.jsp",
                data: params,              //--  URL지정 페이지로 넘길 값 check~!!!
                success: function(args) {
                    $("#resultDiv").html(args);

                    // 초기화
                    $("#name").val("");
                    $("#content").val("");
                    // 포커스
                    $("#name").focus();
                },
                //beforeSend: true,
                //beforeSend: showRequest(), //---(X)
                beforeSend: showRequest, //-- check~!!!
                error: function(e) {
                    alert(e.responseText);
                }
            });//$.ajax(
        });//$("#sendBtn").click(function() {
    });//$(function() {

        
//     function beforeSendFun()) {
//         //return false;
//         return true;
//     };

    function showRequest() {
        if (!$("#name").val()) {
            alert("이름을 입력해야 합니다.");
            $("name").focus();

            return false;
        }
        if (!$("#content").val()) {
            alert("내용을 입력해야 합니다.");
            $("content").focus();

            return false;
        }

        return true;
    }
</script>
</head>
<body>


<details>
    <summary>jQuery의 ajax() 활용 실습</summary>
    
    <div>
        이름
        <input type="text" id="name" class="txt"><br>
        
        내용
        <textarea rows="3" cols="50" id="content" class="txt"></textarea>
        <br><br>
        
        <input type="button" id="sendBtn" class="btn" value="등록하기">
    </div>
    
    <!-- AJAX 처리 결과 수신 -->
    <div id="resultDiv">
        test
    </div>
</details>



</body>
</html>