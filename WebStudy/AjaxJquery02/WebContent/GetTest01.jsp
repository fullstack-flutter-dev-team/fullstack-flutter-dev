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
<title>GetTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
  $(function() {
	 $("#loadBtn").click(function() {
		 // $.get(url, data, callback);
     // - 매개변수로 전달받은 url을 사용하여 서버에 대한 GET 요청을 전송하도록 한다.
     // - $.get(url, {속성1:값1, 속성2:값2, ...}, callback); 과 같이 전달 과정에서 data는 JSON 형태로 처리할 수 있다.
     // - $.get(url, {속성1:값1, 속성2:값2, ...}, function(넘겨받은 값)
     //   {
     //      $(선택자).html(넘겨받은 값에대한 처리);
     //   });

     var nickName = $("#nickName").val();

     // $.get();
     $.get("GetTest01ok.jsp", {nickName: nickName}, function(data){
       // div 갱신
       $("#result").html(data);
     });

	 });
  });
  

</script>
</head>
<body>

<details>
    <summary>jQuery의 get() 활용 실습</summary>
</details>


<div>
	<input type="text" id="nickName" class="txt">
	<br />
	<button type="button" class="btn" id="loadBtn">클릭 확인</button>
</div>

<div id="result">
</div>

</body>
</html>