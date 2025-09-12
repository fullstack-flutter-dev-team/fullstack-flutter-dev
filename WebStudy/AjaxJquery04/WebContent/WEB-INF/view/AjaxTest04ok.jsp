<%@ page contentType="text/html; charset=UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%><%!
String COLOR_RED      = "\u001B[31m" ;
String COLOR_GREEN    = "\u001B[32m" ;
String COLOR_YELLOW   = "\u001B[33m" ;
String COLOR_BLUE     = "\u001B[34m" ;
%><%
    // AjaxTest04ok.jsp →  XML 구성
    
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    System.out.println(">>> title : " + title);
    System.out.println(">>> content : " + content);
    
    // check~!!!
    response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8"?>
<root>
    <status>true</status>
    <records id="1">
        <title>${title }</title>
        <content>${content }</content>
    </records>
    <records id="2">
        <title>${title }</title>
        <content>${content }</content>
    </records>
    <list>
        <totalDataCount>2</totalDataCount>
        <%
          for (int i=1; i<=2; i++) {
        %>
            <comment num="<%=i %>">
                <id>&gt;&gt; id=<%=i%></id>
                <title>- title=<%=title%></title>
                <content>- content=<%=content%></content>
            </comment>
        <%} %>
    </list>
</root>