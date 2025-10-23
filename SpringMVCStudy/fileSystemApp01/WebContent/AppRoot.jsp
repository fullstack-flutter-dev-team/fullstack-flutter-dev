<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.File"%>
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
    // 웹 어플리케이션 경로
    String appRoot = "/";
    appRoot = pageContext.getServletContext().getRealPath(appRoot);
    
    // 파일 객체 생성
    File newFile = new File(appRoot, "data/test.txt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AppRoot.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
    <h1>관찰하기</h1>
    <hr>
</div>

<div>
    <h2>웹 어플리케이션 루트 : </h2>
    <h3><%=appRoot %></h3>
    <!--
    C:\SpringMVCStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp01\  
      ----------------                                                               ------------------
        workspace                                                                        프로젝트
    -->
    
    <br>
    <h2>생성할 파일 위치 :</h2>
    <h3> <%=newFile %></h3>
    <!--  
    C:\SpringMVCStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp01\data\test.txt
    -->
</div>
</body>
</html>