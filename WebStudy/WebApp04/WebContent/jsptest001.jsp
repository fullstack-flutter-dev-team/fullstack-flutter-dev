<%@ page contentType="text/html; charset=UTF-8"%>
<%
    // 스크립트릿(Scriptlet) 영역
String name;
name = "김한국";

int result;
result = 10 + 20;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest001.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
    <!-- 
Servlet 컨테이너에 전달....?
 -->
    <div>
        <h1>JSP 관찰하기</h1>
        <HR>
    </div>

    <div>
        <!-- 표현식 -->
        <h2><%=name%></h2>
        <h2><%=result%></h2>
    </div>
    

</body>
</html>