<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%
// 이전 페이지(→ Send11.html → Forward11.jsp)로 부터 넘어온 데이터 수신
// →  num1, num2, op, result(attribute), resultStr(attribute)
//                    ---------------------------------------
//                                 setAttribute()

// 한글 수신을 위한 인코딩 방식 지정
// request.setCharacterEncoding("UTF-8");
//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음
//   그러므로 기본 설정은 UTF-8로 구성하는 것이 좋음
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//   처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글이 깨지지 않음.
//   또한 지금 하고 있는 이 처리는... 데이터를 수신해서 사용하는 처리보다
//   먼저 수행되어야 한글이 깨지지 않은 상태로 사용할 수 있음)
      
// Foward
//  → 클라이언트에 Receive11.jsp

// check~!!
// - setAttribute()로 넘긴 값을 수신하는 과정은 getAttribute()로 처리한다.
// - getAttribute() 메서드는 Object를 반환한다.
// String userName = (String)request.getAttribute("userName");
String num2 = request.getParameter("num1");
String num1 = request.getParameter("num2");
String op   = request.getParameter("op");
String result = (String)request.getAttribute("result");
String resultStr = (String)request.getAttribute("resultStr");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
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
        <h1>데이터 송수신 실습 11</h1>
        <p>최종 결과 수신(Receive11.jsp)</p>
        <hr>
    </div>
    
    <div>
        <p> <%=num1%> <%=op%> <%=num2%> = <%=result %> </p>
        <p> <%=resultStr%> </p>
    </div>
    <hr>
    <a href="Send11.html"> < 메인 페이지로 이동</a>

</body>
</html>