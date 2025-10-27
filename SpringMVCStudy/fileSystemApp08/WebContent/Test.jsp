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
    <h1>파일 업로드 - 다중 파일 업로드</h1>
    <hr />
</div>

<div>
    <form action="TestOk.jsp" method="post" enctype="multipart/form-data">
        작성자 : <input type="text" name="userName"/><br>
        제목 : <input type="text" name="subject"/><br>
        파일명 : <input type="file" name="uploadFile1"/><br>
        파일명 : <input type="file" name="uploadFile2"/><br>
        <br>
        <input type="submit" value="파일 업로드" class="btn" />
    </form>
    
</body>
</html>