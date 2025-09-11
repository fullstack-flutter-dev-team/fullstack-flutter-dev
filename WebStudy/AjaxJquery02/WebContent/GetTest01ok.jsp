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

// GetTest01ok.jsp
// String nickName = request.getParameter("nickName");

%>
<%-- <%=nickName%> 님 안녕하세요.<br> 반갑습니다. --%>
${nickName }님 안녕하세요.<br> 반갑습니다.