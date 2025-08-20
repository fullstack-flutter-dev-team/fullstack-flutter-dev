<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%!


%>
<%

/* 
<div class="gugudan" id="gugudan">
    <ul>
        <li><a href="Receive09.jsp">1단</a></li>
        <li><a href="Receive09.jsp">2단</a></li>
        <li><a href="Receive09.jsp">3단</a></li>
        <li><a href="Receive09.jsp">4단</a></li>
        <li><a href="Receive09.jsp">5단</a></li>
        <li><a href="Receive09.jsp">6단</a></li>
        <li><a href="Receive09.jsp">7단</a></li>
        <li><a href="Receive09.jsp">8단</a></li>
        <li><a href="Receive09.jsp">9단</a></li>
    </ul>
</div> 
*/

StringBuilder sbDan = new StringBuilder();
sbDan.append("<div class='gugudan' id='gugudan'>");
sbDan.append("    <ul>");
// sbDan.append("        <li><a href='Receive09.jsp?dan=1'>1단</a></li>");
// sbDan.append("        <li><a href='Receive09.jsp?dan=2'>2단</a></li>");
// sbDan.append("        <li><a href='Receive09.jsp?dan=3'>3단</a></li>");
// sbDan.append("        <li><a href='Receive09.jsp?dan=4'>4단</a></li>");
// sbDan.append("        <li><a href='Receive09.jsp?dan=5'>5단</a></li>");
// sbDan.append("        <li><a href='Receive09.jsp?dan=6'>6단</a></li>");
// sbDan.append("        <li><a href='Receive09.jsp?dan=7'>7단</a></li>");
// sbDan.append("        <li><a href='Receive09.jsp?dan=8'>8단</a></li>");
// sbDan.append("        <li><a href='Receive09.jsp?dan=9'>9단</a></li>");
for (int i=1; i<=9; i++) { // i : 1 ~ 9
    sbDan.append(String.format("<li><a href='Receive09.jsp?dan=%d'>%d단</a></li>",i, i));
}

sbDan.append("    </ul>");
sbDan.append("</div> ");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>
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
    text-decoration: none;
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
        <h3>구구단</h3>
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
<%-- 
    <div class="gugudan" id="gugudan">
        <ul>
            <li><a href="Receive09.jsp">1단</a></li>
            <li><a href="Receive09.jsp">2단</a></li>
            <li><a href="Receive09.jsp">3단</a></li>
            <li><a href="Receive09.jsp">4단</a></li>
            <li><a href="Receive09.jsp">5단</a></li>
            <li><a href="Receive09.jsp">6단</a></li>
            <li><a href="Receive09.jsp">7단</a></li>
            <li><a href="Receive09.jsp">8단</a></li>
            <li><a href="Receive09.jsp">9단</a></li>
        </ul>
    </div>
--%>
<%-- 구구단 선택 리스트 출력 --%>
<%=sbDan.toString() %>

</body>
</html>