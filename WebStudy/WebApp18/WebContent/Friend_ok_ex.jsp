<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

// String userName = request.getParameter("userName");

%>

<jsp:useBean id="friend" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="friend"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
    <table class="table">
        <tr>
            <th>이름</th>
            <td>
<%--                 <jsp:getProperty property="name" name="friend"/> <br> --%>
<%--                 <%=userName %><br> --%>
                <jsp:getProperty property="userName" name="friend"/>
                </td>
        </tr>
        <tr>
            <th>성별</th>
            <td><jsp:getProperty property="gender" name="friend"/></td>
        </tr>
        <tr>
            <th>나이</th>
            <td><jsp:getProperty property="age" name="friend"/></td>
        </tr>
        <tr>
            <th>이상형</th>
            <td><%=friend.getStarList() %></td>
        </tr>
    </table>

</div>
<div>
    <a href="Friend.jsp">&lt; 첫 화면으로 이동하기..</a>
</div>
</body>
</html>