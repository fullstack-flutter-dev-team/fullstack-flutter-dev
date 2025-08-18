<%@ page contentType="text/html; charset=UTF-8"%>
<%

// 이전 페이지(→ Send03.html)로 부터 넘어온 데이터 수신
// →  userId, userPw, userName, userTel, gender, loc, subject

// 한글 수신을 위한 인코딩 방식 지정
request.setCharacterEncoding("UTF-8");
//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음
//   그러므로 기본 설정은 UTF-8로 구성하는 것이 좋음
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//   처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글이 깨지지 않음.
//   또한 지금 하고 있는 이 처리는... 데이터를 수신해서 사용하는 처리보다
//   먼저 수행되어야 한글이 깨지지 않은 상태로 사용할 수 있음)
      
String id       = request.getParameter("userId");   //-- text
String pw       = request.getParameter("userPw");   //-- password
String name     = request.getParameter("userName");  //--text
String tel      = request.getParameter("userTel");   //--text/tel
String strGender   = request.getParameter("gender"); //-- radio
String loc      = request.getParameter("userCity");  //-- select
String[] subjects  = request.getParameterValues("userSubjcet"); //-- check~!!!
String strSubjects = "";

strGender = (strGender.equals("F")) ? "female(여자)" : "male(남자)";

try {
    if (subjects != null) {
        for (String strSubject : subjects) {
            strSubjects += String.format("[%s] ", strSubject);
        }
    }
} catch (Exception e) {
    System.out.println(e.toString());
}

//※ 추후에는... 수신된 데이터를 쿼리문을 통해
//    DB에 입력하는 처리과정드잉 포함될것임을 염두하며 작업을 진행할 수 있도록 한다.


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
span {
    color: blue;
    font-weight: bold;
}
</style>
</head>
<body>

    <div>
        <h1>데이터 송수신 실습 04</h1>
        <hr>
    </div>

    <div>
        <h2>가입 승인 내역</h2>

        <p>아이디 : <span><%=id %></span></p>
        <p>패스워드 : <span><%=pw %></span></p>
        <p>이름 : <span><%=name %></span></p>
        <p>전화번호 : <span><%=tel %></span></p>
        <p>성별 : <span><%=strGender %></span></p>
        <p>지역 : <span><%=loc %></span></p>
        <p>수강과목 <span><%=strSubjects %></span></p>
        
    </div>


</body>
</html>