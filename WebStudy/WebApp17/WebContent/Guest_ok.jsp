<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

%>

<!-- scope : page(default ) -->
<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
th {
    width: 20%;
}

a {
    color: blue
    text-decoration: none;
}
</style>
</head>
<body>

<div>
    <h1>간단한 기본 방명록 작성 실습</h1>
    <p>결과 화면</p>
    <hr>
</div>

<!--
 
○ 물리적 파일 구성
  - Guest.jsp → 작성자, 제목, 내용
  - com.tet.GuestDTO → Java Bean 구성
  - Guest_ok.jsp → 데이터 수신 → 객체 생성 → 결과화면 구성
  
 -->

<div>
    <table class="table">
        <tr>
            <th>작성자</th>
            <td><jsp:getProperty property="userName" name="ob"/></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><jsp:getProperty property="subject" name="ob"/></td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea name="content" class="txt" cols="35" rows="20" readonly="readonly"><jsp:getProperty property="content" name="ob"/></textarea>
            </td>
        </tr>
    </table>
</div>

<hr>

<div>
    <h2>- 작성자 : <%=ob.getUserName() %></h2>
    <h3>- 제목 : <%=ob.getSubject() %></h3>
    <h4>- 내용 : </h4>
    <p><%=ob.getContent().replaceAll("\n", "<br>") %></p>

</div>

<hr>

<div>
    <a href="Guest.jsp"> &lt; 입력 화면으로 되돌아가기...</a>
</div>

</body>
</html>