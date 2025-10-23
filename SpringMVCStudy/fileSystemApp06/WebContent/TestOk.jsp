<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
    // TestOk.jsp
    // String root = request.getRealPath("/"); //-- deprecated 되었지만 여전히 사용 가능(예전 방식)
    String root = request.getServletContext().getRealPath("/");
    System.out.println( COLOR_GREEN + "웹 어플리케이션 루트 경로 : " + root );
    // 웹 어플리케이션 루트 경로 : C:\_Workspace\fullstack-flutter-dev_github\SpringMVCStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileSystemApp06\

    String savePath = root + "pds" + "\\" + "saveFile";
    System.out.println( COLOR_GREEN + "업로드 파일이 저장될 경로 : " + savePath );
    // 업로드 파일이 저장될 경로 : C:\_Workspace\fullstack-flutter-dev_github\SpringMVCStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileSystemApp06\pds\saveFile


    File dir = new File(savePath);
    if ( !dir.exists() ) {
        dir.mkdirs();
        System.out.println( COLOR_YELLOW + "저장할 디렉터리를 생성했습니다." );
    } else {
        System.out.println( COLOR_YELLOW + "저장할 디렉터리가 이미 존재합니다." );
    }

    String encType = "UTF-8";        //-- 인코딩 방식 → UTF-8
    int maxFileSize = 5*1024*1024;   //-- 최대 업로드 크기 → 5MB
    
    try {
            MultipartRequest multi = null;
        //-- cos.jar 파일에서 꺼내 씀
        // multi = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
        //-- DefaultFileRenamePolicy() → 동일한 이름의 파일이 존재할 경우
    } catch (Exception e) {
        System.out.println( COLOR_RED + "파일 업로드 중 오류 발생 : " + e.toString() );
    }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestOk.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

</body>
</html>