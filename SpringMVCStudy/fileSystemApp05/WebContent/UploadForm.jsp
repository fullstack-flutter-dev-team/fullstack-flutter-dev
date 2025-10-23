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
<title></title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
    <h1>파일 입력 폼</h1>
    <hr>
</div>

<div>
    <form action="Receive.jsp" method="post" enctype="multipart/form-data">
        file :
        <input type="file" name="file" size="50"/>
        <br><br>
    
        text :
        <input type="text" name="file" size="30"/>
        <br><br>
        
        <input type="submit" value="upload" />
    </form>
</div>

</body>
</html>