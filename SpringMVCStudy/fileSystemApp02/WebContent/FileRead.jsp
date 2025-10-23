<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
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
    // FileRead.jsp
    
    // 1. 웹 어플리케이션의 루트 경로 확인
    String appRoot = "/";
    appRoot = pageContext.getServletContext().getRealPath(appRoot);
    
    // 2. 파일을 읽기 위해 File 객체를 생성
    File newFile = new File(appRoot, "data/test.txt");
    
    // 3. 파일이 존재하는지의 여부 확인
    //    → 지정된 경로에 파일이 존재하는지의 여부를 확인하여
    //       존재하는 경우에만 처리하여 FileNotFoundException 방지
    if (newFile.exists()) {
        // 4.1 - 파일을 읽기 위한 FileReader 객체 생성
        FileReader fr = new FileReader(newFile);
        
        // 4-2. FileReader 객체를 좀 더 편하게 사용하기 위해
        //      BufferedReader 로 감싸기
        BufferedReader br = new BufferedReader(fr);
        
        // 5. 실질적으로 파일의 내용을 읽어냄
        String readData;
        while( (readData=br.readLine()) != null )  {  // 라인별로 읽어들이는 기능 반복
        //      ======== -------------
        //  여기에 담고 | 여기서 읽어온걸   -- 이게 null 이 아니면!
            out.println(readData + "<br>");
        }
        
        // 6-1. BufferedReader 리소스 반납
        br.close();
        
        // 6-2. FileReader 리소스 반납
        fr.close();        
    }
    else  {  // 지정된 경로에 파일이 존재하지 않을 경우 처리
        out.println("정상적으로 파일을 읽어들일 수 없습니다.");
    }
%>