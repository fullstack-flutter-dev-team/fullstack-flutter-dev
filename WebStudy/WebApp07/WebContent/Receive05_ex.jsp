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
      
String dan = request.getParameter("userDan");   //-- text

int nDan = 0;

try {

    nDan = Integer.parseInt(dan);
} catch (Exception e) {
    System.out.println(e.toString());
}

System.out.println(">>dan: " + dan);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
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
        <h1>데이터 송수신 실습 05</h1>
        <h2><%=dan %> 단</h2>
        <hr>
    </div>

    <div>
        <% for (int i = 1; i<=9; i++) { %>
           <%=nDan %>  *  <%=i %> = <%=(nDan*i) %><br>
        <% } %>
        
    </div>


</body>
</html>