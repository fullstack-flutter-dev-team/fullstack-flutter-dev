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
<title>LoadTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    // $(function(){ ... });
    $(document).ready(function(){
        // 『load()』
        // 『$(선택자).load("로드를 원하는 html문서의 위치와 이름");』
        // - jQuery 의 기능이 수행되는 과정에서 다른 html 문서를 로드
        // - HTML을 읽어들여서 DOM에 삽입하는 기능을 수행 
        $("#sendButton").click(function() {
            var su1  = $("#su1").val();
            var su2  = $("#su2").val();
            var oper = $("#oper").val();

            var url  = "loadtest03.do?su1=" + su1 
                       + "&su2=" + su2
                       + "&oper=" + oper;
            
            //$(타겟).load(url);
            $("#result").load(url);
            //-- 『비동기』 방식으로 페이지 로드
            //-- 비동기, responseText
            
            $("#result").css("Background-color: yellow");
        });

        //-- check~!!!! #31 보다 먼저 실행됨.
        //   이유는.....비동기~!!!
        window.alert("여기서 작성한 메세지가 언제 출력되는지 확인");
        
    });

</script>
</head>
<body>


<div>
    <h1>jQuery 의 load() 활용 실습</h1>
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
    <input type="button" value=" = " id="sendButton" class="btn"/>
</div>

<!-- 

loadtest03send.do → LoadTest03send.java → LoadTest03.jsp 
                                loadtest03.do → LoadTest03.java → LoadTest03ok.jsp

 -->

<!-- AJAX 를 활용한 결과 갱신 -->
<div id="result">

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