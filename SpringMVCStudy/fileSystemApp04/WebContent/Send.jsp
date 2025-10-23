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
// Send.jsp

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
    <h1>파일 시스템 및 파일 업로드</h1>
    <hr />
</div>

<div>

    <form action="Receive.jsp" method="post">
        이름 : <input type="text" name="name" class="txt"/><br>
        
        <!-- 파일 업로드 대화창 구성 -->
        파일 : <input type="file" name="upload"/><br>
        
        <button type="submit" class="btn">SUMMIT</button>
    </form>

    <hr>

    <%-- 
        『action="Receive.jsp"』 : 데이터를 전송하며 요청하는 페이지

        『method="post"』        : POST 방식으로 데이터 전송, 
                              파일을 물리적으로 업로드하기 위한 요청 및 전송방식
                              
        『enctype="multipart/form-data"』 : 파일 업로드를 위한 인코딩 방식 지정
                                   파일을 물리적으로 업로드 하기 위한 기본 속성
    --%>
    <form action="Receive.jsp" method="post" enctype="multipart/form-data">
        이름 : <input type="text" name="name" class="txt"/><br>
        
        <!-- 파일 업로드 대화창 구성 -->
        파일 : <input type="file" name="upload"/><br>
        
        <button type="submit" class="btn">SUMMIT</button>
    </form>
</div>

</body>
</html>