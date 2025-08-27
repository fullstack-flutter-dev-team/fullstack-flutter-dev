<%@ page contentType="text/html; charset=UTF-8"%>
<%

// 접속자 수 처리
int n = 0;
String count = (String)application.getAttribute("count");

if (count != null) {
	n = Integer.parseInt(count);
}

n++;
application.setAttribute("count", Integer.toString(n));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestApplication.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
    <h1>TestApplication.jsp</h1>
    <p>application 을 활용한 접속 현황 체크</p>
    <hr>
</div>

<div>
<!--     <h2>총 접속자: 10</h2> -->
    <h2>총 접속자: <%=n %></h2>
</div>

<br><br>

</body>
</html>