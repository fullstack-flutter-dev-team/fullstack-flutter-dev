<%@page import="com.test.mvc.util.FileManager"%>
<%@page import="java.io.File"%>
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

// Download.jsp
String root = "/" ;
root = pageContext.getServletContext().getRealPath(root) ;
System.out.println(COLOR_BLUE + "Download.jsp : root = " + root) ;
//- 파일이 업로드되는 실제 물리적인 경로 속성 설정
String savePath = root +"pds" + File.separator +"saveFile"; //-- check!!
System.out.println(COLOR_BLUE + "Download.jsp : savePath = " + savePath) ;
//-- 다운로드 할 파일명 받기
String saveFileName = request.getParameter("saveFileName") ;
String originalFileName = request.getParameter("originalFileName") ;
System.out.println(COLOR_BLUE + "Download.jsp : saveFileName = " + saveFileName) ;
System.out.println(COLOR_BLUE + "Download.jsp : originalFileName = " + originalFileName) ;
out.clear();

//-- 파일 다운로드 기능 호출
boolean result = FileManager.doFileDownload(saveFileName, originalFileName, savePath,response) ;


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

</body>
</html>