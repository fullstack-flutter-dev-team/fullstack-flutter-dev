<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="com.util.DBConn" %>

<%

String strStatus = "";
Connection conn = null;
try {
    conn = DBConn.getConnection();
    if (conn != null) {
        strStatus = "데이터베이스 연결 성공!!";
    } else {
        strStatus = "데이터베이스 연결 실패!!";
    }
} catch(Exception e) {
    strStatus += e.toString();
    System.out.println(e.toString());
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
    <div>
        <h1>데이터베이스 연결 실습</h1>
        <hr>
    </div>
    <div>
        <h1>상태 확인</h1>
        <span><%=strStatus %></span>
    </div>

    <hr>
</body>
</html>