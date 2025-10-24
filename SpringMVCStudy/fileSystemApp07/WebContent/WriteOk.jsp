<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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

// WriteOk.jsp
//-- 파일 업로드 처리

//------------------------------------------------------------------
// ① 기능 구현에 필요한 주요 속성값들 준비
//-- 경로 기준점 설정
String root = "/" ;
root = pageContext.getServletContext().getRealPath(root) ;
System.out.println(COLOR_BLUE + "WriteOk.jsp : root = " + root) ;

//- 파일이 업로드되는 실제 물리적인 경로 속성 설정
String savePath = root + "pds" + File.separator + "saveFile"; //-- check!!
//--                              ---------------
//--                              "\\" (정적구성)와 동일한 구문이나
//--                               어플리케이션이 돌아가는 환경에 따라서 구분자를 바꿔줌(동적구성)
//--------------------------------------------------
//--                              pds\saveFile
//--                              pds/saveFile
//--                              운영체제에 따라 구분자 자동 적용
//--                              윈도우즈( \ ) , 유닉스계열( / )
//--                              실제 물리적인 경로
//--                              C:\... \pds\saveFile
//--                              D:\... /pds/saveFile
//--                              /.../pds/saveFile
//--                              톰캣서버가 설치된 위치에 따라 실제 물리적인 경로는 달라짐
//--                              따라서 절대경로를 코드에 직접 기술하는 것은 바람직하지 않음
//--                              -> 상대경로(웹 애플리케이션 기준 경로)로 기술하는 것이 좋음
//--                              -> pageContext.getServletContext().getRealPath("/") 메서드를 활용
//--                              -> 웹 애플리케이션의 루트 경로를 기준으로 상대경로 기술
//--                              -> 실제 물리적인 경로로 변환 필요시 getRealPath() 메서드 활용
//--                              -> 예) /pds/saveFile
//--                              -> 예) /UploadFiles
//--                              -> 예) /resources/upload
//--                              -> 예) /assets/images/upload

System.out.println(COLOR_BLUE + "WriteOk.jsp : savePath = " + savePath) ;

//-- 인코딩 방식 속성 설정
String encType = "UTF-8" ;

//-- 업로드 제한 용량 설정(예: 10MB)
// int maxPostSize = 10 * 1024 * 1024 ;  // 10MB
//-- 파일 최대 크기 속성 설정
int maxFileSize = 5 * 1024 * 1024 ;  // 5MB

//----------------------------------------------------------------------------------
// ② 경로 상 물리적인 디렉터리 구조가 존재하지 않을 경우 생성할 수 있도록 처리
File dir = new File(savePath) ;

if ( !dir.exists() ) {
    dir.mkdirs() ;
}

//----------------------------------------------------------------------------------
// ③ MultipartRequest 객체 생성(업로드 실제 처리)
MultipartRequest mr = null ;
String urlFile = "" ;

try {
    
    mr = new MultipartRequest(
            request,                      //-- HttpServletRequest 객체(request)
            savePath,                     //-- 업로드 될 실제 디렉터리 경로(서버의 물리적인 경로)
            maxFileSize,                  //-- 업로드 파일 최대 크기(바이트 단위)
            encType,                      //-- 인코딩 방식(예: "UTF-8")
            new DefaultFileRenamePolicy() //-- 파일명 중복 처리 객체( com.oreilly.servlet.multipart.FileRenamePolicy)
    ) ;

    // urlFile = cp + "/pds/saveFile/"; //-- check~!!!
    // System.out.println(COLOR_BLUE + "WriteOk.jsp : urlFile = " + urlFile) ;

    //  ④ 구성된 MultipartRequest로 부터 필요한 값 얻어내기
    out.println("제목 : " + mr.getParameter("subject") + "<br>");
    out.println("서버에 저장된 파일명 : " + mr.getFilesystemName("uploadFile") + "<br>");
    out.println("업로드한 실제 파일명 : " + mr.getOriginalFileName("uploadFile") + "<br>");
    out.println("파일 타입 : " + mr.getContentType("uploadFile") + "<br>");


    File f = mr.getFile("uploadFile");
    if (f != null) {
        out.println("업로드 파일 크리 : " + f.length() + "Bytes <br>");

        //-- check~!!!
        // ⑤ 다운로드 기능을 수행하기 위한 속성을 get 방식으로 처리
        urlFile = "Download.jsp?saveFileName=" + mr.getFilesystemName("uploadFile");
        urlFile += "&originalFileName=" + mr.getOriginalFileName("uploadFile");
        System.out.println(COLOR_BLUE + "WriteOk.jsp : urlFile = " + urlFile) ;
    }
} catch (Exception e) {
    // System.out.println("파일 업로드 실패 : " + e.getMessage()) ;
    // System.out.println("파일 업로드 실패 : " + e.toString()) ;
    e.printStackTrace();
}

//-- 파일명 중복 처리 설정
// com.oreilly.servlet.multipart.FileRenamePolicy policy =
//     new com.oreilly.servlet.multipart.DefaultFileRenamePolicy() ;

// String saveDirectory = application.getRealPath("/UploadFiles") ;
// //-- 업로드 제한 용량 설정(예: 10MB)
// int maxPostSize = 10 * 1024 * 1024 ;  // 10MB
// //-- 인코딩 설정
// String encoding = "UTF-8" ;
// //-- 파일명 중복 처리 설정
// com.oreilly.servlet.multipart.FileRenamePolicy policy =
//     new com.oreilly.servlet.multipart.DefaultFileRenamePolicy() ;
// //-- MultipartRequest 객체 생성(업로드 실제 처리)
// com.oreilly.servlet.MultipartRequest mr =
//     new com.oreilly.servlet.MultipartRequest(
//         request,
//         saveDirectory,
//         maxPostSize,
//         encoding,
//         policy
//     ) ;
// //-- 폼 필드값 가져오기
// String name = mr.getParameter("name") ;
// String title = mr.getParameter("title") ;
// String content = mr.getParameter("content") ;
// //-- 업로드된 파일 가져오기
// java.util.Enumeration files = mr.getFileNames() ;
// String fileOriginalName = "" ;
// String fileSystemName = "" ;
// if (files.hasMoreElements()) {
//     String fileField = (String)files.nextElement() ;
//     fileOriginalName = mr.getOriginalFileName(fileField) ;
//     fileSystemName = mr.getFilesystemName(fileField) ;
// }
// //-- 데이터베이스 연동 작업
// // JDBC 객체 선언
// java.sql.Connection con = null ;
// java.sql.PreparedStatement pstmt = null 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteOk.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>
    <div>
        <h2>
            <br><a href="<%=urlFile %>">파일 다운로드</a>
        </h2>
    </div>
</body>
</html>