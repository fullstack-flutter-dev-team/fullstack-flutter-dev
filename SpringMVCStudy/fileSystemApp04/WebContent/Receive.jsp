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

// Receive.jsp
// 이전 페이지()로부터 넘어온 데이터 수신 처리
//-- name, upload
String name = request.getParameter("name");
String upload = request.getParameter("upload");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
    <h1>파일 시스템 및 파일 업로드</h1>
    <hr>
</div>

<div>
    이름 : <%=name %> <br>
    파일 : <%=upload %> <br>
</div>

<%--
    『Send.jsp』의 form 엘리먼트 enctype 속성을
    『enctype="multipart/form-data"』 와 같이 구성한 경우
    form 의 내용을 바이너리 값의 형태로 전송한다는 의미이며,
    이와 같이 전송할 경우... 수신된 데이터는 아래와 같이 확인된다.
    
    이름 : null
    파일 : null
    
    ==> 즉, 바이너리 값을 getParameter() 를 통해 수신할 수 없다는 의미이다.
--%>

</body>
</html>