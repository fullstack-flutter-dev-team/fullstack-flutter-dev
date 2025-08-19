<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%
// 이전 페이지(→ SendAndReceive07.jsp)로 부터 넘어온 데이터 수신
//             ----------------------
//                 자기 자신 페이지
// →  year, month

// 한글 수신을 위한 인코딩 방식 지정
// request.setCharacterEncoding("UTF-8");
//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음
//   그러므로 기본 설정은 UTF-8로 구성하는 것이 좋음
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//   처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글이 깨지지 않음.
//   또한 지금 하고 있는 이 처리는... 데이터를 수신해서 사용하는 처리보다
//   먼저 수행되어야 한글이 깨지지 않은 상태로 사용할 수 있음)
      
String year   = request.getParameter("year");   //-- text
String month  = request.getParameter("month");  //-- text

int nYear = 0;
int nMonth = 0;
int nDay = 0;

try {
    nYear = Integer.parseInt(year);
    nMonth = Integer.parseInt(month);
    nDay = 0;
} catch (Exception e) {
    System.out.println(e.toString());
}

// Calendar 객체 생성
// java.util.GregorianCalendar cal = new java.util.GregorianCalendar();
GregorianCalendar cal = new GregorianCalendar();

// 현재 연, 월, 일 확인
int nowYear  = cal.get(Calendar.YEAR);         //-- 2025
int nowMonth = cal.get(Calendar.MONTH)+1;      //-- 8, GET(+1), SET(-1) 
int nowDay   = cal.get(Calendar.DAY_OF_MONTH); //-- 19

// 표시할 달력의 연, 월, 구성
// -> 페이지 최초 요청을 감안한 코드 처리
int selectYear  = nowYear;
int selectMonth = nowMonth;

// 페이지에 대한 요청이 최초 요청이 아닐 경우
// 즉, 선택한 값(수신한 값)을 활용한 달력의 연, 월을 구성해야 할 경우
if (year != null || month != null) {
    selectYear  = Integer.parseInt(year);
    selectMonth = Integer.parseInt(month);
}

session.setAttribute("selectYear", selectYear);
session.setAttribute("selectMonth", selectMonth);
session.setAttribute("nYear", nYear);
session.setAttribute("nMonth", nMonth);

// 확인한 날짜로 연도 select option 구성
//----------------------------------------------------
// <option value="2015">2015</option>
// <option value="2016">2016</option>
//                 :
// <option value="2025" selected="selected">2025</option>
//                 :
// <option value="2034">2034</option>
// <option value="2035">2035</option>
//----------------------------------------------------

String yOptions = "";
for (int y = (selectYear-10); y<=(selectYear+10); y++) { // 2015 ~ 2035
    // 상황-1 : 페이지 최초 요청일 때 -> year 는 null
    //          현재의 연도는 옵션 값이 같을 때
    //==> selected (o)

    // 상황-2 : 페이지 최초 요청이 아닐 때 -> year 는 null 아님
    //          선택된 연도와 옵션 값이 같을 때
    //==> selected (o)

    // 상황-3 : 나머지
    //==> selected (x)
    if (year==null && y == nowYear) {
        yOptions += "<option value='" + y + "' selected='selected'>" +  y + "</option>";
    } else if (year!=null && y==Integer.parseInt(year)) {
        yOptions += "<option value='" + y + "' selected='selected'>" +  y + "</option>";
    } else {
        yOptions += "<option value='" + y + "'>" +  y + "</option>";
    }
}

String mOptions = "";
for (int m = 1; m<= 12; m++) { // 1 ~ 12
    // 상황-1 : 페이지 최초 요청일 때 -> month 는 null
    //          현재의 연도는 옵션 값이 같을 때
    //==> selected (o)

    // 상황-2 : 페이지 최초 요청이 아닐 때 -> month 는 null 아님
    //          선택된 연도와 옵션 값이 같을 때
    //==> selected (o)

    // 상황-3 : 나머지
    //==> selected (x)

    if (month==null && m == nowMonth) {
        mOptions += "<option value='" + m + "' selected='selected'>" +  m + "</option>";
    } else if (month!=null && m==Integer.parseInt(month)) {
        mOptions += "<option value='" + m + "' selected='selected'>" +  m + "</option>";
    } else {
        mOptions += "<option value='" + m + "'>" +  m + "</option>";
    }
}
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
<%-- 
window.onload = function() {
    console.log(">>>onload: ");
    console.log(">>>nYear: " + <%=session.getAttribute("nYear") %>);
    console.log(">>>nMonth: " + <%=session.getAttribute("nMonth") %>);
    
    var objYear  = document.getElementById("year");
    var objMonth = document.getElementById("month");
    var nYear  = parseInt(<%=session.getAttribute("nYear") %>);
    var nMonth = parseInt(<%=session.getAttribute("nMonth") %>);
    
    // 연도
    for (var i = 0; i < objYear.length ; i++) {
        objYear.removeChild(objYear.lastChild);
    }
    
    for (var i = nYear-10; i <= (nYear+10); i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = String(i);
        if (nYear == i) {
            option.selected = "selected";
        }
        objYear.appendChild(option);
    }

    // 월
    for (var i = 0; i < objMonth.length ; i++) {
        objMonth.removeChild(objMonth.lastChild);
    }
    
    for (var i = 1; i <= 12; i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = String(i);
        if (nMonth == i) {
            option.selected = "selected";
        }
        objMonth.appendChild(option);
    }
} 
--%>

function onChgYear(obj) {
    <%-- 
    var objYear = document.getElementById("year");
    var year = objYear.value;
    var nYear = parseInt(objYear.value);
    console.log(">>>nYear: " + nYear);
    
    for (var i=0; i < objYear.length; i++) {
        if (objYear.options[i].value == nYear) {
            continue;
        }
        objYear.remove(i);
    }


    for (var i = nYear-10; i <= (nYear+10); i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = String(i);
        if (nYear == i) {
            option.selected = "selected";
        }
        objYear.appendChild(option);
    } --%>

    obj.form.submit();
}

function onChgMonth(obj) {
    obj.form.submit();
}

</script>
</head>
<body>

    <div>
        <h1>데이터 송수신 실습 07</h1>
        <hr>
    </div>

    <%-- 
        데이터 송수신 실습 07
        - 연도와 월 입력받아 해당  연월의 달력을 화면에 출력하는 JSP 페이지를 구성한다.
        - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
        - 전송한 내용을 수신하여 출력해주는 형태의 페이지로 구성한다.
        - 연도 구성은 현재 연도를 기준으로 이전 10년, 이후 10년으로 구성한다.
          (기본적으로 만년달력을 구성하는데, 현재의 연, 월은 달력 객체를 활용할 수 있도록 한다.)

        - 월 구성은 1월 부터 12월 까지로 구성한다.

           2015       1
            :         :
         [ 2025 ▼]년 [8 ▼]월
            :         :
           2035      12

         ------------------------------------------------------------------
         ------------------------------------------------------------------
         ------------------------------------------------------------------

        - 사용자의 최초 요청 주소는
            http://localhost:3306/WebApp07/SendAndReceive07.jsp 로 한다.
            
        ○ 물리적 파일 구성
            - SendAndReceive07.jsp 
    
     --%>
     <%--
        1. submit 액션 처리 → 스크립트 제어
        2. 수신한 데이터에 대한 처리
           (이전 페이지로부터 넘어온 데이터 수신)
           → 연도, 월
        3. Calendar 객체 생성
           → 현재의 연, 월, 일 확인
        4. 표시할 달력의 연, 월, 구성
           → 페이지 최초 요청을 감안한 코드 처리
             (연도 select, 월 select)
        5. 페이지에 대한 요청이 최초 요청이 아닐 경우
           → 선택한 값을 활용한 달력의 연, 월 구성
        6. 해당 연, 월의 달력 그리기
      --%>

    <div>
        <%-- form의 action 속성 값 생략 → 요청 페이지/ 전송 데이터의 수신처는 자기 자신 --%>
<!--         <form action="" method="get"> --><!-- action 에 빈문자열 -> 입력값은 사라지고 해당 페이지에 남아있는 것 처럼 보임 → 빈문자열의 의미 : 나 자신! -->
<!--         <form method="get"> --><!--  action 속성 생략시 "" 빈문자열과 동일    -->
        <%-- <form method="get"> --%>
        <form action="" method="get">
            <select id="year" name="year" class="control" onchange="onChgYear(this);">
                 <!-- 
                 <option value="2025">2025</option>
                 <option value="2026">2026</option> 
                  -->
                  <%= yOptions %>
                 
            </select>년
            <select id="month" name="month" class="control" onchange="onChgMonth(this);">
                <%--         
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option> 
                --%>
                <%= mOptions %>
            </select>월
        </form>

        <!-- check -->
        <!-- 
        ※ form 의 action 속성을 『action=""』와 같이 구성하거나
           action 속성을 생략하여 『<form method="post">』와 같이 구성하게 되면
           페이지 요청 및 데이터 전송에 대한 수신처 페이지는
           자기자신이 된다.
        -->
    </div><br>
<%

int leapCount = 0;
int totalDays = 0;
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

int week = nalsu%7;
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
            sb.append("<td class='nowSat'>" + i + "</td>"); //-- 토요일
        } else if ((week-1)%7==0) {
            sb.append("<td class='nowSun'>" + i + "</td>"); //-- 일요일
        } else {
            sb.append("<td class='now'>" + i + "</td>"); //-- 평일
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



for (int i = 1; i < selectYear; i++) {
    totalDays += 365;
    if ((i % 4 == 0 && i % 100 != 0) || i % 400 == 0) {
        totalDays++;
    }
}

for (int i = 1; i < selectMonth; i++) {
    if (i == 2 && (((selectYear % 4) == 0 && (selectYear % 100) != 0) || (selectYear % 400) == 0)) {
        months[i-1] = 29;
    }
    totalDays += months[i-1];
}

String strCal = "<table border=1>" 
        + "<tr>"
        + "<th class='sun'>일요일</th>" 
        + "<th>월요일</th>"
        + "<th>화요일</th>"
        + "<th>수요일</th>"
        + "<th>목요일</th>"
        + "<th>금요일</th>"
        + "<th class='sat'>토요일</th>"
        + "</tr>"
        + "<tr>";

int nFirstDay = ((totalDays % 7) + 1) % 7;
int nCount = 0;
for (int i=0; i<nFirstDay; i++) {
    strCal += "<td> </td>";
    nCount++;
}

for (int i = 1; i <= months[selectMonth-1]; i++) {
    nCount++;
    if ((nCount-1)%7==0){
         strCal += "</tr><tr>";
    } 
    
    if (selectYear==nowYear && selectMonth==nowMonth && nowDay==i) {
        if ((nCount-1)%6==0) {
            strCal += String.format("<td class='nowSat'>%d</td>",i);
        } else if ((nCount-1)%7==0) {
            strCal += String.format("<td class='nowSun'>%d</td>",i);
        } else {
            strCal += String.format("<td class='now'>%d</td>",i);
        }
    } else {
        strCal += String.format("<td>%d</td>",i);
    }
    

}

if ((nCount % 7) != 0) {
    for (int i = 0; i < 7; i++) {
        nCount++;
        strCal += "<td> </td>";
        if ((nCount % 7) == 0) {
             strCal += "</tr>";
             break;
        }
    }
}

strCal += "</table>";
               
out.println(strCal);
%>

<br>
<div>
    <%-- 달력을 그리게 될 영역 --%>
    <h3 style="font-weight:bold; color:blue;">[ 달력~!! ]</h3>
    <%=sb.toString() %>
</div>

</body>
</html>