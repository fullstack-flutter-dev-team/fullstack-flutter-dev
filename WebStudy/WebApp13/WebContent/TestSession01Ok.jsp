<%@ page contentType="text/html; charset=UTF-8"%>

<%
    // TestSession01Ok.jsp
    
    // 이전페이지(TestSession01.jsp)로부터 데이터 수신
    // → userId, userPwd
    String userId = request.getParameter("userId");
    String userPwd = request.getParameter("userPwd");
    
    // DTO 구성 → 로그인 관련 테이블의 데이터와 비교(→ DAO 활용) 
    // → 최종적으로 로그인 액션 처리
    // 14 ~ 16 문은 위의 실습편의상 생략하여 아래와같이 데이터를 얻었다는 가정하게 진행
    String memberId = "superman";
    String memberPwd = "123456";
    String memberName = "홍길동";
    
    if (userId.equals(memberId) && userPwd.equals(memberPwd)) //-- 아이디와 패스워드 모두 일치
    {
    	// check~!!!
        // 로그인 액션 처리 -- 세션 값 채우기
        session.setAttribute("userId", userId);          //-- userId   - superman
        session.setAttribute("userName", memberName);    //-- userName - 홍길동
        
        // 클라이언트가 페이지를 다시 요청할 수 있도록 안내
        response.sendRedirect("TestSession01.jsp");
    }

    /* 로그인 실패시 해당 페이지에 머물게 하기 위해서 else 별도 구성 X */
        
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01Ok.jsp</title>
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
		<h1>로그인 실패 안내</h1>
		<hr />
	</div>

	<div>
		<a href="TestSession01.jsp" style="color: blue;"> &lt;로그인 페이지로 돌아가기</a>
	</div>
</body>
</html>