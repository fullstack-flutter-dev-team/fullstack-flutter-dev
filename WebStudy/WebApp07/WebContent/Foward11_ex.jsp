<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%!

%>

<%
// 이전 페이지(→ Send11.html)로부터 넘어온 데이터 수신
//  → num1, num2, op
String num1 = request.getParameter("num1");
String num2 = request.getParameter("num2");
String op = request.getParameter("op");

System.out.println(">> num1 : " + num1);
System.out.println(">> num2 : " + num2);
System.out.println(">> op : " + op);

int nNum1, nNum2;
nNum1 = nNum2 = 0;
String strResult = "";

try {
    nNum1 = Integer.parseInt(num1);
    nNum2 = Integer.parseInt(num2);

    switch (op) {
        case "+": strResult = String.format("%d", (nNum1 + nNum2)); break;
        case "-": strResult = String.format("%d", (nNum1 - nNum2)); break;
        case "*": strResult = String.format("%d", (nNum1 * nNum2)); break;
        case "/": strResult = String.format("%.1f", (nNum1 / (double)nNum2)); break;
    }


} catch (Exception e) {
    System.out.println(e.toString());
}

request.setAttribute("result", strResult);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
span {
    color: blue;
    font-weight: bold;
}

th {
    backgroundColor : #e6e6e6;
}

td {
    text-align: center;
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

a {
/*    text-decoration: none; */
    color: blue;
    font-weight: bold;
}

a:hover {
  color: blue;
  background-color: #bfe98eff;
}

a:active {
  color: red;
  background-color: #bfe98eff;
}

#yearMonth {
    text-align: center;
    font-weight: bold;
    color: blue;
}

.gugudan {
    margin-left: 150px;
}

</style>

<script type="text/Javascript">
 
</script>
</head>
<body>

    <div>
        <h1>데이터 송수신 실습 11</h1>
        <p>포워딩(Forward)</p>
        <hr>
    </div>

<!-- ※ 포워드 -->
<!--    포워딩을 수행하는 JSP 액션 태그 활용 -->
 <jsp:forward page="Receive11_ex.jsp"></jsp:forward> 
<!-- jsp 접두어 태그가 붙으면 : 액션 태그  -->
<!-- 컨테이너 내에서 해결하기 때문에 값이 날라가지 않음 --> 

</body>
</html>