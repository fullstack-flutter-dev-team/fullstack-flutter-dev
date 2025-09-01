<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
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

// 한글깨짐 방지 (인코딩 처리)
request.setCharacterEncoding("utf-8");

// redirecting
// 이전 페이지로(→ Test3.jsp)부터 넘어온 데이터 수신
// → (name, age) →encode→ param
// String param = URLDecoder.decode(request.getParameter("param"), "UTF-8");
// System.out.println(COLOR_RED + ">>> param : " + param);

// forwarding
// 이전 페이지로(→ Test3.java)부터 넘어온 데이터 수신
// → result
String result = (String)request.getAttribute("result");

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
    <h1>최종 결과값 확인</h1>
    <p>Test2_ok.jsp</p>
    <hr>
</div>


<!-- 
     Test3.jsp  → 이름, 나이  
        → 서블릿(Test3.java)에 전달 (/test3)  → 이름은  ○○○이며, 나이는 xx세 입니다.
        → Test3_ok.jsp → 최종 결과값 수신 처리 → 결과 확인
 -->

 
<div>
   <h1>결과 확인</h1>
   <h2><%=result %></h2>
<%--    <h2><%=param %></h2> --%>
</div>


</body>
</html>