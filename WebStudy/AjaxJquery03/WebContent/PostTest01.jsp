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
<title>PostTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
    #resultDiv {
        width: 240px;
        height: 180px;
        border: 2px solod #5599dd;
        padding: 4px;
    }

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
  $(function() {
     $("#sendBtn").click(function() {
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
         $.post("PostTest01ok.jsp"
         , {
             title: $("#title").val(),
             content: $("#content").val()
             }
         , function(data){
           // div 갱신
           $("#resultDiv").html(data);
         });
    
     });
  });
</script>
  
</head>
<body>


<details>
    <summary>jQuery의 post() 활용 실습</summary>
    
    <div>
        제목
        <input type="text" id="title" class="txt"><br>
        
        내용
        <input type="text" id="content" class="txt"><br><br>
        <input type="button" id="sendBtn" value="보내기" class="btn">
    </div>
    
    <!-- AJAX 처리 결과 수신 -->
    <div id="resultDiv">
        test
    </div>
</details>



</body>
</html>