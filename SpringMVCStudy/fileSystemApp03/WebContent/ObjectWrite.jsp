<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Hashtable"%>
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
// ObjectWrite.jsp

// 웹 어플리케이션 루트 확인
String appRoot = "/";
appRoot = pageContext.getServletContext().getRealPath(appRoot);

// 확인
System.out.println( COLOR_GREEN + "appRoot : " + appRoot);

// 파일 객체 생성
File newFile = new File(appRoot, "objData/data.ser"); //-- 『*.ser』 → (serialize 의 약자) 객체 직렬화

// 파일이 존재할 경로의 디렉터리가 존재하지 않을 경우
if ( !newFile.getParentFile().exists() )
{
    // 파일이 위치할 곳까지의 디렉터리를 생성
    newFile.getParentFile().mkdirs();
}

// 파일에 넣기 위한 Hashtable 객체 생성
Hashtable<String, String> h = new Hashtable<String, String>();

// Hashtable 객체에 데이터 넣기
h.put("key1", "사과");
h.put("key2", "수박");

// 파일을 내보내기 위한 스트림 구성
FileOutputStream fos = new FileOutputStream(newFile);

// Object 를 파일에 쓰기 위해 ObjectoutputStream 객체 생성 후
// FileOutputStream 객체를 연결
ObjectOutputStream oos = new ObjectOutputStream(fos);

// ObjectOutputStream 을 이용해서 파일에 Object 를 기록
oos.writeObject(h);

// ObjectOutputStream 리소스 반납
oos.close();

// FileOutputStream 리소스 반납
fos.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ObjectWrite.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

</body>
</html>