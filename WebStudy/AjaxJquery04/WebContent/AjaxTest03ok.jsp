<%@ page contentType="text/html; charset=UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%><%!
String COLOR_RED      = "\u001B[31m" ;
String COLOR_GREEN    = "\u001B[32m" ;
String COLOR_YELLOW   = "\u001B[33m" ;
String COLOR_BLUE     = "\u001B[34m" ;
%><%
    // AjaxTest03ok.jsp →  XML 구성
    String name = request.getParameter("name");
    String content = request.getParameter("content");
    
    // check~!!!
    response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8"?>
<list>
    <totalDataCount>5</totalDataCount>
    <%
      for (int i=1; i<=5; i++) {
    %>
        <comment num="<%=i %>">
            <name><%=name + i %></name>
            <content><%=content + i %></content>
        </comment>
    <%} %>
</list>