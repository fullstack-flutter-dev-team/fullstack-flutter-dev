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
// LoadingTestOk.jsp

String name = request.getParameter("name");
String content = request.getParameter("content");

// 의도적으로 업무 처리 시간 지연
try {
    Thread.sleep(5000);
} catch (Exception e) {
   System.out.println(e.toString());
}

%>
이름:<%=name%><br>
내용:<%=content%>