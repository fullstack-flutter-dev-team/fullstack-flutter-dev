<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
    <h1>서블릿에서 데이터 흐름</h1>
    <hr>
</div>


<!-- 
     Test3.jsp  → 이름, 나이  
        → 서블릿(Test3.java)에 전달 (/test3)    → 이름은 ○○○이며, 나이는 xx세 입니다.
        → Test3_ok.jsp → 최종 결과값 수신 처리 → 결과 확인
 -->

 
<div>
    <form action="<%=cp %>/test3" method="post">
        이름
        <input type="text" name="name" class="txt">
        <br>
        나이
        <input type="text" name="age" class="txt">
        <br>
        <button type="submit" class="btn" style="width: 300px;margin-left:10px;">확인</button>
    </form>
</div>


</body>
</html>