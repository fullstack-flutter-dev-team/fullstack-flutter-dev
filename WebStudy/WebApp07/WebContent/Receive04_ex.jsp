<%@ page contentType="text/html; charset=UTF-8"%>
<%

// 이전 페이지(→ Send03.html)로 부터 넘어온 데이터 수신
// → num1, num2, op

// 한글 수신을 위한 인코딩 방식 지정
request.setCharacterEncoding("UTF-8");
//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음
//   그러므로 기본 설정은 UTF-8로 구성하는 것이 좋음
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//   처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글이 깨지지 않음.
//   또한 지금 하고 있는 이 처리는... 데이터를 수신해서 사용하는 처리보다
//   먼저 수행되어야 한글이 깨지지 않은 상태로 사용할 수 있음)
      
String id      = request.getParameter("id");
String pw      = request.getParameter("pw");
String name     = request.getParameter("name");
String tel      = request.getParameter("tel");
String gender   = request.getParameter("gender");
String loc      = request.getParameter("loc");
String[] subjects      = request.getParameterValues("subjcet");
String strSubjects = "";

System.out.println("is : " + id);
System.out.println("pw : " + pw);
System.out.println("name : " + name);

gender = (gender.equals("F")) ? "여자" : "남자";

for (String strSub : subjects) {
	strSubjects += strSub + " ";
}
 


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
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
        <h1>데이터 송수신 실습 03</h1>
        <hr>
    </div>

    <%-- 
『입력하신 45와(과) 32의 연산 결과는 77 입니다.』
 --%>

    <div>
        id <span><%=id %></span><br>
        pw <span><%=pw %></span><br>
        name <span><%=name %></span><br>
        tel <span><%=tel %></span><br>
        gender <span><%=gender %></span><br>
        loc <span><%=loc %></span><br>
        수강과목 <span><%=strSubjects %></span><br>
        
    </div>


</body>
</html>