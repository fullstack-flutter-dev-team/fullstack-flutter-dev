<%@ page contentType="text/html; charset=UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

//쿠키 생성(→ 서버에 생성된 쿠키)
Cookie c = new Cookie("cookie_test", "studyCookie");

// 쿠키 설정(→ 서버에 생성된 쿠키에 대한 설정)
c.setMaxAge(3600);
//-- 쿠키 1시간 유지
// c.setMaxAge(5);
//-- 쿠키 5초간 유지

// 쿠키 추가
response.addCookie(c);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
    <h1>TestSetCookie.jsp</h1>
    <p>쿠키 설정 및 추가</p>
    <hr>
</div>

<div>
    <a href="TestSetCookie.jsp"><button>쿠키 정보 설정</button></a>
    <a href="TestGetCookie.jsp"><button>쿠키 정보 확인</button></a>
    <a href="TestRemoveCookie.jsp"><button>쿠키 정보 제거</button></a>
</div>

<br><br>

</body>
</html>