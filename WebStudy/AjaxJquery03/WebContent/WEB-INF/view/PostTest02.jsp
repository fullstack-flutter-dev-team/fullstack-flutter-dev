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
<title>PostTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    $(function() {
        $("#sendButton").click(function() {
            // ※ 『post()』
            // $.post(url, data, callback);
            // - 매개변수로 전달받은 url을 사용하여 서버에 대한 POST 요청을 전송하도록 한다.
            // - $.post(url, {속성1:값1, 속성2:값2, ...}, callback); 과 같이 전달 과정에서 data는 JSON 형태로 처리할 수 있다.
            // - $.post(url, {속성1:값1, 속성2:값2, ...}, function(넘겨받은 값)
            //   {
            //      $(선택자).html(넘겨받은 값에대한 처리);
            //   });
            // ---------------------------------------------------------------------------
            // - 매개변수
            //    - url   : (String) POST 함수로 연결하는 서버측 URL
            //    - data  : (Object) 이름과 값의 쌍으로 프로퍼티를 가진 객체.
            //                       미리 구성해서 넘기는 방식으로 인코딩 된 쿼리 스트링
            //    - callback : (Function) 요청이 완료되면 호출되는 함수.
       
            // $.post();
            $.post("posttest02ok.do"
            , {
                su1: $("#su1").val(),
                su2: $("#su2").val(),
                oper: $("#oper").val()
              }
            , function(data){
                  // div 갱신
                  $("#result").html(data);
                  $("#result").css("background-color", "yellow");
                  $("#result").css("width", "150px");
                  $("#result").css("margin-top", "5px");
                  $("#result").css("text-align", "center");
            });
       
        });
    });

</script>
</head>
<body>

<!-- 
    posttest02.do → com.test.ajax.PostTest02Controller.java
                 (→ WEB-INF/view/PostTest02.jsp)
                      ↓
                 posttest02ok.do → com.test.ajax.PostTest02okController.java
                            (→ WEB-INF/view/PostTest02ok.jsp)

-->
<div>
    <h1>jQuery 의 post() 활용 실습</h1>
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