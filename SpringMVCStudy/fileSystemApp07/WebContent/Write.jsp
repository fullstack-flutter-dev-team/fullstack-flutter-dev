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
<title>Write.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
    <h1>파일 업로드</h1>
    <p>단일 파일 업로드 및 다운로드</p>
    <hr />
</div>


<div>
    <form action="WriteOk.jsp" method="post" enctype="multipart/form-data">
        <table class="table">
            <tr>
                <th>작성자:</th>
                <td><input type="text" name="userName" class="txt"></td>
            </tr>
            <tr>
                <th>제 목:</th>
                <td><input type="text" name="subject" class="txt"></td>
            </tr>
            <tr>
                <th>파 일:</th>
                <td><input type="file" name="uploadFile"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><button type="submit" class="btn" style="width: 200px;height:60px;font-size: 17pt;">파일 올리기</button></td>
            </tr>
        </table>
    </form>
</div>



</body>
</html>