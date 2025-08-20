<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%!


%>
<%
String strDan = request.getParameter("dan");

System.out.println(">> dan : " + strDan);

int dan = 1;
StringBuilder sbGugudan = new StringBuilder();

try {
    dan = Integer.parseInt(strDan);
} catch (Exception e) {
    System.out.println(e.toString());
}

sbGugudan.append("<div style='");
sbGugudan.append("margin-left:100px;");
sbGugudan.append("padding: 20px;");
sbGugudan.append("width:140px;");
sbGugudan.append("font-weight:bold;");
sbGugudan.append("background-color: #faf9e6ff");
sbGugudan.append("'>");
for (int i=1; i<=9; i++) {
    sbGugudan.append(String.format("%d * %d = %d<br>", dan, i, (dan*i)));
}
sbGugudan.append("</div>");


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

window.onload = function() {
  
    
}


</script>
</head>
<body>

    <div>
        <h1>데이터 송수신 실습 09</h1>
        <h3>구구단[<%=strDan %> 단]</h3>
        <hr>
    </div>

    <%-- 
        데이터 송수신 실습 09
        - a 태그에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
        - 이를 활용하여 구구단 리스트를 동적으로 구성하여
          선택에 따른 결과 페이지를 요청하여 출력해주는 형태의 페이지로 구현한다.
        - submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.

        구구단 선택

        1단 ┐
        2단 ┃ 목록 구성
        :   ┃
        9단 ┛

        - 리스트의 특정 항목(단)을 선택했을 때(클릭했을 때)
          해당 단의 구구단을 출력해주는 형태의 페이지를 요청할 수 있도록 처리한다.

        - 사용자의 최초 요청 주소는
            http://localhost:3306/WebApp07/Send09.jsp 로 한다.
            
        ○ 물리적 파일 구성
            - Send09.jsp 
            - Receive09.jsp 
    
     --%>
     <%=sbGugudan.toString() %>
     <hr>
     <a href="Send09.jsp"> < 이전 페이지로 이동</a>



</body>
</html>