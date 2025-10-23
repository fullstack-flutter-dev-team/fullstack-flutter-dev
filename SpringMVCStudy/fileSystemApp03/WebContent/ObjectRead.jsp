<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
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
// ObjectRead.jsp
// key2 의 값은 딸기 입니다.
// key1 의 값은 사과 입니다.

// 1. 웹 어플리케이션의 루트 경로 확인
String appRoot = "/";
appRoot = pageContext.getServletContext().getRealPath(appRoot);
// 확인
System.out.println( COLOR_GREEN + "appRoot : " + appRoot);

// 2. 내보냈던 파일 지정
File newFile = new File(appRoot, "objData/data.ser");

// 3. 파일이 존재하는지의 여부 확인
if (newFile.exists() ) {
    // 4-1. 파일을 읽어오기 위해 FileInputStream 객체 생성
    FileInputStream fis = new FileInputStream(newFile);
    
    // 4-2. File에서 Object를 읽어오기 위해 FileInputStream 객체 생성
    ObjectInputStream ois = new ObjectInputStream(fis);
    
    // 5. 파일에서 Object 를 읽어들이기
    //    →  읽어온 Object 를 원래의 자료형으로 다운 캐스팅(형변환) 필요
    //    → Object 형식으로 읽어들이기 때문에 원래의 자료형으로 형변환 필요 -- check ~!!!!
    Hashtable<String, String> h = (Hashtable<String, String>) ois.readObject();
    
    // 확인
    // System.out.println( COLOR_BLUE + "key1 의 값은 " + h.get("key1") + " 입니다." );
    // System.out.println( COLOR_BLUE + "key2 의 값은 " + h.get("key2") + " 입니다." );
    Enumeration e = h.keys();
    while (e.hasMoreElements() ) {
        String key = (String)e.nextElement();
        String value = h.get(key);
       // out.println( COLOR_BLUE + "key[" + key + "] 의 값은 " + value + " 입니다.<br>" );
       %>

       key[<%=key%>] 의 값은  <%=value %> 입니다.<br>

       <%
    }
    
    // 6-1. ObjectInputStream 리소스 반납
    ois.close();
    
    // 6-2. FileInputStream 리소스 반납
    fis.close();
}
else {
    out.println("해당 파일이 존재하지 않습니다.");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ObjectRead.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

</body>
</html>