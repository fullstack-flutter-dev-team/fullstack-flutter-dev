<%@ page contentType="text/html; charset=UTF-8"%>
<%

// 이전 페이지(→ SendAndReceive06.html)로 부터 넘어온 데이터 수신
// →  userInput

// 한글 수신을 위한 인코딩 방식 지정
request.setCharacterEncoding("UTF-8");
//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음
//   그러므로 기본 설정은 UTF-8로 구성하는 것이 좋음
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//   처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글이 깨지지 않음.
//   또한 지금 하고 있는 이 처리는... 데이터를 수신해서 사용하는 처리보다
//   먼저 수행되어야 한글이 깨지지 않은 상태로 사용할 수 있음)
      
String userInput = "";
userInput  = request.getParameter("userInput");   //-- text
System.out.println("userInput : " + userInput);
String result = "";
result = (userInput != null) ? userInput: "";

// try {

//     nDan = Integer.parseInt(dan);

//     // for ()



// } catch (Exception e) {
//     System.out.println(e.toString());
// }


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
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
        <h1>데이터 송수신 실습 06</h1>
        <h2>userInput : <%=result %></h2>
        <hr>
    </div>

    <div>
<!--         <form action="" method="get"> --><!-- action 에 빈문자열 -> 입력값은 사라지고 해당 페이지에 남아있는 것 처럼 보임 → 빈문자열의 의미 : 나 자신! -->
<!--         <form method="get"> --><!--  action 속성 생략시 "" 빈문자열과 동일	-->
        <form method="post">
            입력 <input type="text" id="userInput" name="userInput" class="txt"><br>

            <button type="submit" class="btn">테스트</button>
            <button type="reset" class="btn">취소</button>
        </form>

        <!-- check -->
        <!-- 
        ※ form 의 action 속성을 『action=""』와 같이 구성하거나
           action 속성을 생략하여 『<form method="post">』와 같이 구성하게 되면
           페이지 요청 및 데이터 전송에 대한 수신처 페이지는
           자기자신이 된다.
        -->
        <%-- 
            - 사용자의 최초 요청 주소는
            http://localhost:3306/WebApp07/Send05.html 로 한다.
            
            ○ 물리적 파일 구성
            - Send05.html 
        --%>
    </div>


</body>
</html>