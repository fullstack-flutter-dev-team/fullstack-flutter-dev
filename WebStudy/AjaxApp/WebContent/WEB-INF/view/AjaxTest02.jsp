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
<title></title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
    .short
    {
        width: 100px;
        text-align: right;
    }
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
    function sum() {
        // 데이터 수집
        var n1 = document.getElementById("num1").value;
        var n2 = document.getElementById("num2").value;

        //URL 구성
        var url = "test02.do?n1=" + n1 + "&n2=" + n2;

        // XMLHttpRequest 객체(->AJAX객체) 생성
        ajax = createAjax(); //-- ajax.js

        ajax.open("GET", url, true);
        //-- 『GET』 : 데이터 전송 및 페이지 요청 방식(POST 사용가능, POST 사용시 헤더 추가 필요)
        //   『url』 : AJAX 요청 페이지(데이터 수신 및 응답 페이지)
        //   『true』: boolean → true(비동기), false(동기), 동기는 사용안함.
        //-- 실제 서버와의 연결이 아니고 일종의 환경설정 부분으로 이해하는 것이 좋겠다.
        //   (실제 서버 연결은 나중에..)


        ajax.onreadystatechange = function() {
            console.log(">>> ajax.readyState: " + ajax.readyState);

            // 이벤트가 발생할 때 마다
            // 이 영역 코드가 실행되는 형태로 기능하게 되는데

            // readystatechange 이벤트가 발생한 상황에서...
            // readystatechange 속성을 확인하여...
            // 그 중에서(0 부터 4 까지의 상태 중에서..) 
            // 4가 되는 순간이 요청했던 서버로부터 응답이 완료된 시점이기 때문에
            // 4인 경우... 수행해야 할 업무를 진행할 수 있도록 처리한다.
            if (ajax.readyState == 4)
            {
                // 서버로부터 응답이 완료되었다고 하더라도...
                // 그 과정에서 데이터가 올바른 것인지, 에러 메세지를 응답받은 것인지 알 수 없기 때문에...
                // 서버로부터 응답받은 응답유형(코드)에 대한 코드를 확인한 후
                // 업무를 진행할 수 있도록 처리(구성)한다.
                if (ajax.status == 200)
                {
                    // 업무진행 → 기능(동작) → 정의된 함수 호출(업무 코드를 외부로 추출 )
                    //-- 콜백 함수
                    callBack();
                }
            }
        };
        
        //-- action!!(시작)하는 단계
        //-- 실제 서버에서 AJAX 요청을 한다(즉, 이부분이 진짜 연결 작업이다.)
        ajax.send("");
        //ajax.send(memberId); //-- post
        //-- POST 방식으로 데이터를 전송하며 페이지 요청을 하는 경우...
        //   send() 메소드의 인자값에 데이터를 넣는다. 
        //-- GET 방식으로 데이터 전송하며 페이지를 요청하는 경우
        //   send() 메소드의 인자 값을 (문법적으로) 비워둘 수 있다.
        //-- 단, 실무적으로 : 아무것도 넣지 않으면 브라우저에 따라서 skip 되는 경우도 발생 "" **빈문자열을 채워넣는다**.
    }

    // 콜백함수 정의
    //-- 추출된 업무 코드 기술
    //   → AJAX 요청이 완료된 후 호출되는 최종적인 업무를 처리하는 함수
    function callBack()
    {
        // 여기서는 두 가지 방법 중 하나로 데이터를 가져온다.
        
        // 1. 서버에서 응답한 데이터가 텍스트일 경우(단일 데이터)
        // → responseText
        var data = ajax.responseText;
        
        // 2. 서버에서 응답한 데이터가 XML 일 경우(다량의 데이터)
        // → responseXML
        //var data = ajax.responseXML;
        
        // 받아온 데이터를 업무에 적용한다.
        document.getElementById("result").value = data;
    }

</script>
</head>
<body>

    <div>
        <details open>
            <summary>AJAX 기본 실습</summary>
            <p> - Test02send.java<br>
                - AjaxTest02.jsp<br>
                - ajax.js<br>
                - Test02.java<br>
                - Test02ok.jsp<br>
                - web.xml<br>
                - ※ url : test02send.do / test02.do
            </p>
        </details>
        <hr>
    </div>

    <input type="text" id="num1" class="txt short" /> +
    <input type="text" id="num2" class="txt short" />
    <input type="button" value=" = " class="btn" onclick="sum();" />
    <input type="text" id="result" class="txt short" />
    <br>

    <h2>같은 페이지에 있는 기타 다른 요소들</h2>

    <input type="text" />
    <br>
    <br>
    <label><input type="checkbox" name="check" value="check1" />체크1</label>
    <label><input type="checkbox" name="check" value="check2" />체크2</label>
    <br>
    <br>

    <label><input type="radio" name="radio" value="rdo1" />라디오1</label>
    <label><input type="radio" name="radio" value="rdo2" />라디오2</label>
    <br>
    <br>

    <select id="sel">
        <option value="1">선택1</option>
        <option value="2">선택2</option>
        <option value="3">선택3</option>
    </select>


</body>
</html>