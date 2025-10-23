<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
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
// Receive.jsp

    /* 파일업로드 시 request 로 name 받아올 수 없는 것 확인 */
    // String name = request.getParameter("name");
    // String upload = request.getParameter("upload");

    String contentType = request.getContentType();
    //-- request의 컨텐츠 타입 얻어옴

    System.out.println( COLOR_YELLOW + "contentType : " + contentType );
    
    Enumeration e = request.getHeaderNames();
    //-- 헤더 안의 이름들을 꺼내려고 하는 것
    
    out.println("[[브라우저로부터 날아오는 헤더 정보들]]<br>");

    while ( e.hasMoreElements() ) { //-- 헤더 이름으로부터 하나씩 꺼내오기
        String key = (String)e.nextElement(); //-- key 값
        String value = request.getHeader(key); //-- value 값
        System.out.println( COLOR_BLUE + "key : " + key + ", value : " + value );
        out.println("key : " + key + ", value : " + value + "<br>");
    }

    out.println("<br>");
    out.println("<br>");
    out.println("<br>");
    out.println("<br>");
    out.println("<h2>[[ request 로 넘어오는 데이터들 ]] </h2><br>");
    
    // ~Stream : 바이트 단위 처리
    DataInputStream dis = new DataInputStream(request.getInputStream());
    String line = null;
    while( (line = dis.readLine()) != null)
    {
        // out.println(new String(바이트코드, 인코딩방식) + "<br>");
        // out.println(new String(line.getBytes("UTF-8"), "UTF-8") + "<br>");
        out.println(new String(line.getBytes("ISO-8859-1"), "UTF-8") + "<br>");
    }

    dis.close();
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

</body>
</html>