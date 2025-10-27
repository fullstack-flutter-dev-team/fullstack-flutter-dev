<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
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
//--------------------------------------------
// 다중 파일 업로드 처리

String root = "/";
root = pageContext.getServletContext().getRealPath(root);

String savePath = root + "pds" + File.separator + "saveFile";

// 확인
System.out.println(savePath);

File dir = new File(savePath);
if (!dir.exists()) {
    dir.mkdirs();
    System.out.println(COLOR_GREEN + "디렉토리 생성됨: " + savePath);
} else {
    System.out.println(COLOR_YELLOW + "디렉토리 이미 존재함: " + savePath);
}

String encType = "UTF-8";
int maxFileSize = 5 * 1024 * 1024; // 5MB

MultipartRequest mr = null;

try {
    mr = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
    System.out.println(COLOR_BLUE + "파일 업로드 성공");
    out.println("작성자 : " + mr.getParameter("userName") + "<br>");
    out.println("제목 : " + mr.getParameter("subject") + "<br>");
    out.println("**********************************************<br>");
    out.println("업로드된 파일 <br>");
    out.println("**********************************************<br>");

    // check~!!!
    // ※ 다중 파일 업로드 구조에서 체크해야 할 사항
    //    - MulitpartRequest 객체의 『getFileNames()』 메서드는 업로드된 파일의 필드 이름들을 Enumeration 객체로 반환
    //                                       ------
    //  요청으로 넘어온 파일들의 이름을 Enumeration 객체로 가져옴
    //    - 각 파일 필드 이름을 사용하여 getFilesystemName() 메서드를 호출

    Enumeration files = mr.getFileNames();
    while (files.hasMoreElements()) { //-- 파일 필드 이름이 더 있는지 체크(각 파일의 개별적 접근 반복)
        String fileFieldName = (String) files.nextElement();
        String fileName = mr.getFilesystemName(fileFieldName);
        if (fileName != null) {
            out.println("파일 필드 이름 : " + fileFieldName + "<br>");
            out.println("사용자가 업로드한 파일 이름 : " + mr.getOriginalFileName(fileFieldName) + "<br>");
            out.println("실제 업로드된 파일 이름(서버에 저장된 파일명) : " + fileName + "<br>");
            out.println("파일 타입 : " + mr.getContentType(fileFieldName) + "<br>");

            File uploadedFile = mr.getFile(fileFieldName);

            if (uploadedFile != null) {
                System.out.println(COLOR_GREEN + "업로드된 파일 경로: " + uploadedFile.getAbsolutePath());
                out.println("파일 크기 : " + uploadedFile.length() + " bytes<br>");
                out.println("파일 경로 : " + uploadedFile.getAbsolutePath() + "<br>");
            }
            out.println("----------------------------------------------<br>");
        }
    }

} catch (IOException e) {
    System.out.println(COLOR_RED + "파일 업로드 실패: " + e.getMessage());
    e.printStackTrace();
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