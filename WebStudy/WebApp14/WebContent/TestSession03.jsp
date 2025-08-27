<%@ page contentType="text/html; charset=UTF-8"%>
<%

//이전 페이지로(TestSession02.jsp) 부터 넘어온 데이터 수신
// → userId, userPwd
//   +  userName, userTel 

// 한글 깨짐 방지
request.setCharacterEncoding("utf-8");

String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");

// input태그 hidden타입
// String userName = request.getParameter("userName");
// String userTel = request.getParameter("userTel");
// String userName = (String)request.getSession().getAttribute("userName");
// String userTel = (String)request.getSession().getAttribute("userTel");
String userName = (String)session.getAttribute("userName");
String userTel  = (String)session.getAttribute("userTel");

// 세션 삭제
session.removeAttribute("userName");
session.removeAttribute("userTel");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
    <h1>TestSession03.jsp</h1>
    <p>이름, 전화번호, 아이디, 패스워드 확인</p>
    <hr>
</div>

<!-- 
    TestSession01.jsp 에서 TestSession02.jsp 로
    이름과 전화번호를 입력받아 전송
    
    TestSession02.jsp 에서 TestSession03.jsp 로
    아이디와 패스워드를 입력받고
    앞에서 전달받은 이름과 전화번호를 함께 전송
    
    TestSession03.jsp 에서 
    전달받은 이름, 전화번호 , 아이디, 패스워드 출력
    
    01 ─────────> 02 ─────────> 03
    이름, 전화번호         아이디, 패스워드       이름, 전화번호, 아이디, 패스워드
    입력                   입력                   출력
                           - getParameter         - getAttribute

※ 즉, 01 에서 02 로 넘겨받을 땐 getParameter
   02 에서 03 으로 넘겨받을 땐 getParameter 과 getAttribute 로 세션 활용
   01 에서 03 으로 직접 넘겨줄 수 없기 때문에 세션(session)에 저장
   
※ session 외에 input태그 type의 hidden 속성을 이용한 정보 전달 가능
-->

<div>
    <h2>이름: <%=userName %></h2>
    <h2>전화번호: <%=userTel %></h2>
    <h2>아이디: <%=userId %></h2>
    <h2>패스워드: <%=userPwd %></h2>
</div>

</body>
</html>