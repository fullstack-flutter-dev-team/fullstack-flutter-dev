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
<title>Test.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
    <h1>파일 업로드</h1>
    <h2>단일 파일 업로드</h2>
    <hr />
</div>

<div>
    <form action="TestOk.jsp"  method="post" enctype="multipart/form-data">
        작성자 : <input type="text" name="userName"/><br>
        제목 : <input type="text" name="subject" /><br>
        파일 : <input type="file" name="uploadFile" /><br>
        <br>
        
        <button type="submit">파일 올리기</button>
    </form>
</div>

</body>
</html>