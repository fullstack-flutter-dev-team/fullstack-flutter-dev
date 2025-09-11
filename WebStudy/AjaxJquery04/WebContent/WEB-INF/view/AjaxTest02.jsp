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
<title>AjaxTest02.jsp</title>
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
            var params = "su1=" + $.trim($("#su1").val())
                        + "&su2=" + $.trim($("#su2").val())
                        + "&oper=" + $.trim($("#oper").val());

            let data = {
                su1: $.trim($("#su1").val()),
                su2: $.trim($("#su2").val()),
                oper: $.trim($("#oper").val()),
            };
            console.log(">>>>data :" + JSON.stringify(data));

            $.ajax(
            {
                type: "POST",
                url: "ajaxtest02ok.do",
                data: params,              //--  URL지정 페이지로 넘길 값 check~!!!
                //data: JSON.stringify(data), //--  URL지정 페이지로 넘길 값 check~!!!
                success: function(args) {
                    $("#resultDiv").html(args);

                },
                beforeSend: false,
                //beforeSend: showRequest(), //---(X)
//                 beforeSend: showRequest, //-- check~!!!
                error: function(e) {
                    alert(e.responseText);
                }
            });
        });
    });

        
//     function beforeSendFun()) {
//         //return false;
//         return true;
//     };

    function showRequest() {
        if (!$("#su1").val()) {
            alert("su1 입력해야 합니다.");
            $("#su1").focus();

            return false;
        }
        if (!$("#su2").val()) {
            alert("su2 입력해야 합니다.");
            $("#su2").focus();

            return false;
        }

        return true;
    }
</script>
</head>
<body>

<!-- 
    ajaxtest02.do → com.test.ajax.AjaxTest02Controller.java
                 (→ WEB-INF/view/AjaxTest02.jsp)
                      ↓
                 ajaxtest02ok.do → com.test.ajax.AjaxTest02okController.java
                            (→ WEB-INF/view/AjaxTest02ok.jsp)

-->
<div>
    <h1>jQuery 의 ajax() 활용 실습</h1>
    <hr />
</div>

<div>
    <input type="text" id="su1" class="txt txtNum"/>
    <select id="oper">
        <option value="add">덧셈</option>
        <option value="sub">뺄셈</option>
        <option value="mul">곱셈</option>
        <option value="div">나눗셈</option>
    </select>
    <input type="text" id="su2" class="txt txtNum"/>
    <input type="button" value=" = " id="sendBtn" class="btn"/>
</div>


<!-- AJAX 를 활용한 결과 갱신 -->
<div id="resultDiv">

</div>


<div>
    <label><input type="radio" name="rdo">rdo1</label>
    <label><input type="radio" name="rdo">rdo2</label>
</div>

<div>
    <label><input type="checkbox" name="chk">chk1</label>
    <label><input type="checkbox" name="chk">chk2</label>
</div>

<div>
    <input type="text" />
</div>
</body>
</html>