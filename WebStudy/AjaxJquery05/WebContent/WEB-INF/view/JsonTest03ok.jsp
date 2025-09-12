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
    // JsonTest03ok.jsp
    
    
    String su1 = request.getParameter("su1");
    String su2 = request.getParameter("su2");
    String oper = request.getParameter("oper");
    String op = (String)request.getAttribute("op");
    String result = (String)request.getAttribute("result");
    
    String ret = "";

    // * JSON 데이터
    //   {"이믈1": "값1", "이름2": "값2", ...}

    StringBuilder sb = new StringBuilder();

    // check~!!!
    // * 따옴표 구성에 유의할 것~!!!
    sb.append("{\"su1\":\"" + su1 + "\"");           //  → {"num" : "1"
    sb.append(",\"su2\":\"" + su2 + "\"");       //  →  , "name" : "xx"
    sb.append(",\"oper\":\"" + op + "\"");       //  →  , "name" : "xx"
    sb.append(",\"result\":\"" + result + "\"}");//  →  , "content" : "xxx"}
    
    
    ret = sb.toString();
    System.out.println(COLOR_GREEN+">>> result : " + ret);
    
    out.println(ret);
%>