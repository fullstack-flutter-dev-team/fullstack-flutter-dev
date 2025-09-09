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
    #result
    {
        width: 250px;
        color: #F33;
        font-size: small;
        /* display: none; */
        display: inline-block;
    }
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
    
    // 아이디 중복검사 버튼 클릭 이벤트 핸들러
    function chkId() {
        // 데이터 수집
        var id = document.getElementById("id").value;
        
        // 요청할 URL 구성(준비)
        var url = "test03.do?id=" + id;
        
        // AJAX 객체
        ajax = createAjax(); //-- ajax.js
        
        // 환경 설정(→ 『open("메소드방식","URL", 비동기[true]/동기[false])』)
        ajax.open("GET", url, true);
        
        // check~!!!
        ajax.send("");
        
        // ajax.onreadystatechange = 동작;
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    // 업무 처리 수행(→ 외부로 추출하여 함수 정의)
                    callBack();
                }
            }
        };

    }

    // 업무 처리 함수 정의
    //-- 넘겨준 아이디에 대한 중복 검사를 수행하고
    //   그 결과(1 or 0)를 통보받아
    //   사용자에게 메세지 출력 → span → #result
    function callBack() {
        // 외부로 추출된 업무처리 내용 구성(responseText/responseXML)
        var result = document.getElementById("result");
        var data = ajax.responseText;
        var txtColor = "color: ";
        
        // 받아온 데이터를 업무에 적용한다.
        console.log(">>>> result: " + data);
        if (parseInt(data) == 0) {
            result.innerText = "사용 가능한 아이디 입니다.";
            txtColor += "blue;";
        } else {
            result.innerText = "이미 사용중인 아이디 입니다.";
            txtColor += "red;";
        }
        result.style = "display: inline;" + txtColor;
    }

</script>
</head>
<body>

<div>
    <details>
        <summary>회원 가입(아이디 중복검사)</summary>
        <p>
           - Test03send.java<br>
           - AjaxTest03.jsp<br>
           - ajax.js<br>      <!-- 완료 -->
           - main.css<br>     <!-- 완료 -->
           - Test03.java<br>
           - Test03ok.jsp<br>
           - web.xml<br>
           * url : test03send.do / testo3.do<br>
           * 자료구조 활용<br>
        </p>
    </details>
    <hr>

</div>

<div>
    <table class="table">
        <tr>
            <th>아이디</th>
            <td>
                <input type="text" id="id" class="txt control">
                <input type="button" value="중복검사" class="btn control" onclick="chkId();">
                <span id="result"></span>
                <!-- 사용 가능한 이이디입니다. -->
                <!-- 사용 불가능한 이이디입니다. -->
            </td>
        </tr>
        <tr>
            <th>이름</th>
            <td>
                <input type="text" id="name" class="txt control">
            </td>
        </tr>
        <tr>
            <th>주소</th>
            <td>
                <input type="text" id="addr" class="txt control">
            </td>
        </tr>
    </table>
</div>

</body>
</html>