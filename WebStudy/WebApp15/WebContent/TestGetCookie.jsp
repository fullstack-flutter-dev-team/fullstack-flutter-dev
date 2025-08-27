<%@ page contentType="text/html; charset=UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

//
Cookie[] ckArr = request.getCookies();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestGetCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
    <h1>TestGetCookie.jsp</h1>
    <p>쿠키 정보 얻어내기</p>
    <hr>
</div>

<div>
    <a href="TestSetCookie.jsp"><button>쿠키 정보 설정</button></a>
    <a href="TestGetCookie.jsp"><button>쿠키 정보 확인</button></a>
    <a href="TestRemoveCookie.jsp"><button>쿠키 정보 제거</button></a>
</div>

<br><br>

<div>
    <table class="table">
        <tr>
            <th>쿠키 이름</th>
            <th>쿠키 값</th>
        </tr>
        <%
        for (Cookie c : ckArr) {
        %>
        <tr>
            <td><%=c.getName() %></td>
            <td><%=c.getValue() %></td>
        </tr>
        <%
        }
        %>
    </table>
</div>



</body>
</html>