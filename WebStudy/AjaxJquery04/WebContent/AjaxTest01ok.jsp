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
// AjaxTest01ok.jsp
//String name = request.getParameter("name");
//String content = request.getParameter("content");

%>
<%--
이름: <b><%=name%></b>
<br><br>
내용<br>
<%=content%> 
--%>
이름: <b>${param.name }</b>
<br><br>
내용<br>
${param.content}