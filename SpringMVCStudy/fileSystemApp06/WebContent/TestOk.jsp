<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
        // 바이너리 파일(이미지, 동영상, 압축파일 등) 업로드 가능
        // 텍스트 파일 업로드도 가능
        // 파일 업로드를 처리하는 JSP 페이지에서는
        // request.getParameter() 사용 불가!!!
        // 반드시 MultipartRequest 객체를 통해서만 데이터 접근 가능!!!
        // 즉, form 태그의 enctype="multipart/form-data" 로 전송된 데이터는
        // request.getParameter() 로 수신 불가!!!
        // 따라서, MultipartRequest 객체를 생성하는 시점에
        // form 태그로 전송된 데이터가 모두 수신되어 처리됨!!!
        // 따라서, MultipartRequest 객체를 생성하는 시점 이후에
        // form 태그로 전송된 데이터에 접근 가능!!!
        // 즉, MultipartRequest 객체를 생성하는 시점에
        // form 태그로 전송된 데이터가 모두 수신되어 처리됨!!!
        // 따라서, MultipartRequest 객체를 생성하는 시점 이후에
        // form 태그로 전송된 데이터에 접근 가능!!!
        // multi = new MultipartRequest(요청객체, 저장경로, 최대업로드크기, 인코딩방식, 파일이름_중복처리정책_객체(파일명정책));
        multi = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
        //-- DefaultFileRenamePolicy() → 동일한 이름의 파일이 존재할 경우

        out.println("작성자 : " + multi.getParameter("userName") + "<br>");
        out.println("제  목 : " + multi.getParameter("subject") + "<br>");
        out.println("서버에 저장된 파일명 : " + multi.getFilesystemName("uploadFile") + "<br>");
        out.println("사용자 업로드 파일명 : " + multi.getOriginalFileName("uploadFile") + "<br>");
        out.println("업로드 파일 타입 : " + multi.getContentType("uploadFile") + "<br>");

        File file = multi.getFile("uploadFile");
        if ( file != null ) {
            out.println("파일 크기 : " + multi.getFile("uploadFile").length() + " bytes<br>");
            out.println("<br>파일 업로드 성공!!!<br>");
            System.out.println( COLOR_GREEN + "파일이 정상적으로 업로드 되었습니다." );
        } else {
            System.out.println( COLOR_RED + "파일 업로드에 실패했습니다." );
        }   
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