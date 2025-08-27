<%@ page contentType="text/html; charset=UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

// 쿠키 제거
// -> 비어있는 내용으로 기존의 쿠키를 덮어쓰기 하는 개념

// 쿠키 생성(-> 서버에 생성된 쿠키)
Cookie killCookie = new Cookie("cookie_test", "");



// 쿠키 설정(-> 서버에 생성된 쿠키에 대한 설정)
killCookie.setMaxAge(0);
//-- 생성된 쿠키가 바로 소멸될 수 있도록 처리

// 클라이언트의 쿠키 상자에 쿠키 추가(응답)
response.addCookie(killCookie);
//-- 처음 쿠키를 구성할 떄에도 『addCookie()』 로 처리하였기 때문에
//   삭제하는 과정에서도 『addCookie()』 로 처리해야 안정적으로 삭제할 수 있다.
//   즉, 내용이 포함된 쿠키를 심었다가...
//   이번에는 내용이 비어있는 쿠키를 덮어쓰기 하는 개념

// ※ 여기서 쿠키 삭제는 클라이언트 입장에서의 삭제이다.
//    한 명의 클라이언트가 쿠키를 삭제했다고 해서
//    다른 클라이언트들의 쿠키도 삭제되면 안되기 때문에
//    이 쿠키의 정보는 (브라우저가...) 로컬 PC 에서 컨트롤하게 된다.

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestRemoveCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
    <h1>TestRemoveCookie.jsp</h1>
    <p>쿠키 정보 제거하기</p>
    <hr>
</div>

<div>
    <a href="TestSetCookie.jsp"><button>쿠키 정보 설정</button></a>
    <a href="TestGetCookie.jsp"><button>쿠키 정보 확인</button></a>
    <a href="TestRemoveCookie.jsp"><button>쿠키 정보 제거</button></a>
</div>

<br><br>

<div>
    <h2>성공적으로 쿠키를 제거했습니다.</h2>

</div>
</body>
</html>