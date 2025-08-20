<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%
// 이전 페이지(→ Send10.html)로 부터 넘어온 데이터 수신
// →  userName

// 한글 수신을 위한 인코딩 방식 지정
request.setCharacterEncoding("UTF-8");
//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음
//   그러므로 기본 설정은 UTF-8로 구성하는 것이 좋음
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//   처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글이 깨지지 않음.
//   또한 지금 하고 있는 이 처리는... 데이터를 수신해서 사용하는 처리보다
//   먼저 수행되어야 한글이 깨지지 않은 상태로 사용할 수 있음)
      
String userName   = request.getParameter("userName");   //-- text


// ※ 현재 페이지()에서 추가 작업
request.setAttribute("userName", userName);
//-- request객체의 key(message)에
//     "반갑습니다." 를 value 로 넣는 작업 수행
request.setAttribute("message", "또 만납시다.");

 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
span {
    color: blue;
    font-weight: bold;
}

td {
    text-align: right;
}

.sat {
    color: blue;
}

.sun {
    color: red;
}

td.now {
    background-color: aqua;
    font-weight: bold;
}

td.nowSat {
    background-color: aqua;
    font-weight: bold;
    color: blue;
}

td.nowSun {
    background-color: aqua;
    font-weight: bold;
    color: red;
}
</style>

<script type="text/Javascript">



</script>
</head>
<body>

    <div>
        <h1>데이터 송수신 실습 10</h1>
        <hr>
    </div>
        <div>
        <p> 이름 : <%=userName %> </p>
    </div>
<!-- ※ 포워드 -->
<!--    포워딩을 수행하는 JSP 액션 태그 활용 -->
<!--    ③ -->
<jsp:forward page="Receive10.jsp"></jsp:forward>
<!-- jsp 접두어 태그가 붙으면 : 액션 태그  -->
<!-- 컨테이너 내에서 해결하기 때문에 값이 날라가지 않음 --> 

</body>
</html>