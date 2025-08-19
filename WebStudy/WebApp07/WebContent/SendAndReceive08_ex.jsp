<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%!
int selectYear;
int selectMonth;
%>
<%
// 이전 페이지(→ SendAndReceive08.jsp)로 부터 넘어온 데이터 수신
//             ----------------------
//                 자기 자신 페이지
// →  year, month, calc

// 한글 수신을 위한 인코딩 방식 지정
// request.setCharacterEncoding("UTF-8");
//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음
//   그러므로 기본 설정은 UTF-8로 구성하는 것이 좋음
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//   처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글이 깨지지 않음.
//   또한 지금 하고 있는 이 처리는... 데이터를 수신해서 사용하는 처리보다
//   먼저 수행되어야 한글이 깨지지 않은 상태로 사용할 수 있음)
      
String year  = request.getParameter("year");  //-- text
String month  = request.getParameter("month");  //-- text
String calc  = request.getParameter("calc");  //-- text

if (calc == null) {
    selectYear = 0;
    selectMonth = 0;
}

System.out.println(">-->> calc : " + calc);
System.out.println(">-->> selectYear : " + selectYear);
System.out.println(">-->> selectMonth : " + selectMonth);

// Calendar 객체 생성
// java.util.GregorianCalendar cal = new java.util.GregorianCalendar();
GregorianCalendar cal = new GregorianCalendar();

// 현재 연, 월, 일 확인
int nowYear  = cal.get(Calendar.YEAR);         //-- 2025
int nowMonth = cal.get(Calendar.MONTH)+1;      //-- 8, GET(+1), SET(-1) 
int nowDay   = cal.get(Calendar.DAY_OF_MONTH); //-- 19

selectYear  = (selectYear == 0) ? nowYear: selectYear; 
selectMonth = (selectMonth == 0) ? nowMonth: selectMonth; 

if ( calc != null) {
    if (calc.equals("+")) {
        if (selectMonth == 12) {
            selectYear++;
            selectMonth = 1;
        } else {
            selectMonth++;
        }
    } else if (calc.equals("-")) {
        if (selectMonth == 1) {
            selectYear--;
            selectMonth = 12;
        } else {
            selectMonth--;
        }
    }
}

System.out.println(">>> calc : " + calc);
System.out.println(">>> selectYear : " + selectYear);
System.out.println(">>> selectMonth : " + selectMonth);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
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

a {
   text-decoration: none;
}

a:hover {
  color: blue;
}

a:active {
  color: red;
}

#yearMonth {
    text-align: center;
    font-weight: bold;
    color: blue;
}

</style>

<script type="text/Javascript">

window.onload = function() {
    var selYear = <%=selectYear  %>
    var nowYear = <%=nowYear  %>
    var selMonth = <%=selectMonth  %>
    var nowMonth = <%=nowMonth  %>
    
    if ( selYear==nowYear && selMonth==nowMonth) {
        document.getElementById("yearMonth").style.backgroundColor = "yellow";
    } else {
        document.getElementById("yearMonth").style.backgroundColor = "white";
    }
    
}

function prev(obj) {
    console.log(">>> prev");
    document.getElementById("calc").value = "-";
    var form = document.getElementById("form");
    form.submit();
}

function next(obj) {
    console.log(">>> next");
    document.getElementById("calc").value = "+";
    var form = document.getElementById("form");
    form.submit();
}

</script>
</head>
<body>

    <div>
        <h1>데이터 송수신 실습 08</h1>
        <hr>
    </div>

    <%-- 
        데이터 송수신 실습 07
        - 사용자가 선택한 연도와 월에 대한 달력을 구성하는 JSP페이지를 구성한다.
        - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
        - 전송한 내용을 자신 페이지로 수신하여 출력해주는 형태의 단독 페이지로 구성한다.

   
           ◀ 2025년 8월 ▶
         ------------------------------------------------------------------
         ------------------------------------------------------------------
         ------------------------------------------------------------------

        - 『◀』 나  『▶』클릭 시
           해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.


        - 사용자의 최초 요청 주소는
            http://localhost:3306/WebApp07/SendAndReceive08.jsp 로 한다.
            
        ○ 물리적 파일 구성
            - SendAndReceive08.jsp 
    
     --%>

    <br>
    <div>
        <form id="form" action="" method="get" >
            <span style="margin-left: 95px;"></span>
            <a href="SendAndReceive08.jsp?year=2025&month=7">◀</a>
            <a href="javascript: prev(this);" name="prev">◀</a>
            <input type="text" id="yearMonth" name="yearMonth" class="txt" disabled="disabled" value="<%=selectYear%>년 <%=selectMonth%>월">
            <a href="javascript: next(this);" name="next">▶</a>
            <a href="SendAndReceive08.jsp?year=2025&month=9">▶</a>
            <input type="hidden" id="calc" name="calc" value="+">
        </form>
    </div><br>
<%

int leapCount = 0;
int nalsu = 0;
int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

// 요일 항목 타이틀 배열 구성
String[] weekNames = {
    "일요일",
    "월요일",
    "화요일",
    "수요일",
    "목요일",
    "금요일",
    "토요일"
};

// 선택된 연도 이전 연도까지의 날 수 계산
nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;

// 위의 연산 결과에 입력받은 월의 이전 월까지의 날 수 추가
for (int i=0; i<selectMonth-1; i++) {
    nalsu += months[i];
}

nalsu++;

int week = nalsu % 7;
int lastDay = months[selectMonth-1];

// 달력 그리기
StringBuilder sb = new StringBuilder();
sb.append("<table border='1'>");


// 요일 이름 발생
sb.append("<tr>");
for (int i=0; i<weekNames.length; i++) {
    if (i==0) {        //-- 일요일
        sb.append("<th class='sun'>" + weekNames[i] + "</th>");
    } else if (i==6) { //-- 토요일
        sb.append("<th class='sat'>" + weekNames[i] + "</th>");
    } else {           //-- 평일
        sb.append("<th>" + weekNames[i] + "</th>");
    }
}
sb.append("</tr>");

// 공백(빈 칸 td) 발생
sb.append("<tr>");
for (int i=1;i<=week;i++) {
    sb.append("<td></td>");
}

// 날짜(숫자 td) 발생
for (int i=1; i<=lastDay; i++) {
    // 날짜가 하루씩 처리될 때 마다(구성이 이루어질 때 마다)
    // 요일도 함께 1씩 증가할 수 있도록 처리   //-- check~!!!
    week++;

    // 확인
    if (selectMonth == nowMonth && selectYear==nowYear && nowDay==i) { //-- 오늘이 토/일요일 일 경우 처리
        if ((week-1)%6==0 ) {
            sb.append("<td class='nowSat'>" + i + "</td>"); //-- 토요일(now)
        } else if ((week-1)%7==0) {
            sb.append("<td class='nowSun'>" + i + "</td>"); //-- 일요일(now)
        } else {
            sb.append("<td class='now'>" + i + "</td>");    //-- 평일(now)
        }
    } else {
        sb.append("<td>" + i + "</td>");                    //-- 평일
    }

    if (week%7 == 0) {
        sb.append("</tr><tr>");
    }
}

// 공백(빈 칸 td) 발생
for (int i=0; i<=week; i++, week++) { //-- 『week++』 → 공백이 발생되는 동안에도 요일 증가 처리
    if (week%7==0) {
        break;
    }

    sb.append("<td></td>");
}

sb.append("</tr>");
sb.append("</table>");
//-----------------
%>

<div>
    <%-- 달력을 그리게 될 영역 --%>
<!--     <h3 style="font-weight:bold; color:blue;">[ 달력~!! ]</h3> -->
    <%=sb.toString() %>
</div>

</body>
</html>