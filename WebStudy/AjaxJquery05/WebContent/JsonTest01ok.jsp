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
    // JsonTest01ok.jsp
    
    String name = request.getParameter("name");
    String content = request.getParameter("content");
    
    String result = "";

    // * JSON 데이터
    //   {"이믈1": "값1", "이름2": "값2", ...}

    StringBuilder sb = new StringBuilder();

    // check~!!!
    // * 따옴표 구성에 유의할 것~!!!
    sb.append("{\"num\":\"" + 1 + "\"");           //  → {"num" : "1"
    sb.append(",\"name\":\"" + name + "\"");       //  →  , "name" : "xx"
    sb.append(",\"content\":\"" + content + "\"}");//  →  , "content" : "xxx"}
    
    
    result = sb.toString();
    System.out.println(COLOR_GREEN+">>> result : " + result);
    
    out.println(result);
%>