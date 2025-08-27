<%@ page contentType="text/html; charset=UTF-8"%>
<%
// 한글 깨짐 방지
request.setCharacterEncoding("utf-8");

String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");

// input태그 hidden타입
String userName = request.getParameter("userName");
String userTel = request.getParameter("userTel");
// String userName = (String)request.getSession().getAttribute("userName");
// String userTel = (String)request.getSession().getAttribute("userTel");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
<p>이름: <%=userName %></p>
<p>전화번호: <%=userTel %></p>
<p>아이디: <%=userId %></p>
<p>패스워드: <%=userPwd %></p>
</div>

</body>
</html>