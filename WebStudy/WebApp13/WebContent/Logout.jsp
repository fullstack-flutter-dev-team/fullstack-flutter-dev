<%@ page contentType="text/html; charset=UTF-8"%>

<%
// Logout.jsp
//-- 세션의 속성을 제거하여 로그아웃 액션 처리

session.removeAttribute("userId");
session.removeAttribute("userName");
//-- 세션의 사용자아이디, 이름 삭제

session.invalidate();
//-- 기존 세션에 저장되어 있는 모~든 속성을 제거하고
//   세션을 초기화

// 클라이언트에 로그인 페이지를 다시 요청할 수 있도록 안내
response.sendRedirect("TestSession01.jsp");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">
<style type="text/css">
.btnMenu {
	border: 1px solid gray;
	font-size: 8pt;
	width: 70px;
	height: 20px;
}
</style>


</head>
<body>

	<div>
		<h1>로그아웃 실패 안내</h1>
		<hr />
	</div>

	<div>
		<a href="TestSession01.jsp" style="color: blue;"> &lt;로그인 페이지로 돌아가기</a>
	</div>
</body>
</html>