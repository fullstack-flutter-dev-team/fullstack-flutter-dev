<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="com.util.DBConn" %>

<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorTest002.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
    .btn {
        width: 100%;
        height: 40px;
    }

    .errMsg {
        font-size: small;
        color: red;
        display: none;
    }

    #numTitle {
        width: 50px;
    }

    #nameTitle {
        width: 100px;

    }

    #telTitle {
        width: 160px;

    }

    .list {
        text-align: center;
    }
    
    a {
        text-decoration: none;
    }

</style>
<script type="text/javascript">
 
</script>
</head>
<body>
    <div>
        <h1>에러 페이지</h1>
        <hr>
    </div>

    <div>
        <h2>입력 과정에 문제 발생~!!</h2>
        <a href="Test002.jsp">돌아가기</a>
    </div>
    
    <br>
    <hr>
</body>
</html>