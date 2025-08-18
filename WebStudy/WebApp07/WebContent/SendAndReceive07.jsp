<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%

// 이전 페이지(→ SendAndReceive06.html)로 부터 넘어온 데이터 수신
// →  year, month

// 한글 수신을 위한 인코딩 방식 지정
request.setCharacterEncoding("UTF-8");
//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음
//   그러므로 기본 설정은 UTF-8로 구성하는 것이 좋음
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//   처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글이 깨지지 않음.
//   또한 지금 하고 있는 이 처리는... 데이터를 수신해서 사용하는 처리보다
//   먼저 수행되어야 한글이 깨지지 않은 상태로 사용할 수 있음)
      
String year  = request.getParameter("year");   //-- text
String month  = request.getParameter("month");   //-- text


int nYear = 0;
int nMonth = 0;
try {
	nYear = Integer.parseInt(year);
	nMonth = Integer.parseInt(month);
} catch (Exception e) {
	System.out.println(e.toString());
}

if (nMonth==0 || nYear==0) {
    
    GregorianCalendar cal = new GregorianCalendar();
    nYear= cal.get(Calendar.YEAR);
    nMonth = cal.get(Calendar.MONTH)+1;
}

session.setAttribute("nYear", nYear);
session.setAttribute("nMonth", nMonth);

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
</style>
<script type="text/Javascript">
window.onload = function() {
    console.log(">>>onload: ");
    console.log(">>>nYear: " + <%=session.getAttribute("nYear")%>);
    console.log(">>>nMonth: " + <%=session.getAttribute("nMonth")%>);
    
 
    var objYear = document.getElementById("year");
    var objMonth = document.getElementById("month");
    var nYear = parseInt(<%=session.getAttribute("nYear")%>);
    var nMonth = parseInt(<%=session.getAttribute("nMonth")%>);
    
    for (var i=0; i<objYear.length ; i++) {
        objYear.removeChild(objYear.lastChild);
    }
    
    for (var i = nYear-10; i<=(nYear+10); i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = String(i);
        if (nYear == i) {
            option.selected = "selected";
        }
        objYear.appendChild(option);
    }
    
    
   objMonth.options[nMonth-1].selected = true;
    
  

}

function onChgYear(obj) {
    var objYear = document.getElementById("year");
    var year = objYear.value;
    var nYear = parseInt(objYear.value);
    console.log(">>>nYear: " + nYear);
    
    for (var i=0; i<objYear.length ; i++) {
        if (objYear.options[i].value == nYear) {
            continue;
        }
        objYear.remove(i);
    }


    for (var i = nYear-10; i<=(nYear+10); i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = String(i);
        if (nYear == i) {
            option.selected = "selected";
        }
        objYear.appendChild(option);
    }

    objYear.form.submit();
    
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

    <div>
<!--         <form action="" method="get"> --><!-- action 에 빈문자열 -> 입력값은 사라지고 해당 페이지에 남아있는 것 처럼 보임 → 빈문자열의 의미 : 나 자신! -->
<!--         <form method="get"> --><!--  action 속성 생략시 "" 빈문자열과 동일    -->
        <form action="" method="get">
            <select id="year" name="year" class="control" onchange="onChgYear(this);">
                 <!-- 
                 <option value="2025">2025</option>
                 <option value="2026">2026</option> 
                  -->
                 
            </select>년
            <select id="month" name="month" class="control" onchange="onChgMonth(this);">
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
            </select>월
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
    </div><br>
    
<%--     
    <div>
        <p><%=nYear %>년 <%=nMonth %>월</p>
    </div> 
--%>

<%

int leapCount = 0;
int totalDays = 0;

int[] m = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};



for (int i=1; i<nYear; i++) {
	totalDays += 365;
    if ((i%4==0 && i%100!=0) || i%400==0) {
        totalDays++;
    }
}


for (int i=1; i<nMonth; i++) {

    if (i==2 && ((nYear%4==0 && nYear%100!=0) || nYear%400==0)) {
    	m[i-1] = 29;
    }
    totalDays += m[i-1];
}

String strCal = "<table border=1>" 
        + "<tr style='background-color:#ECFCCA;'>"
        + "<th>일</th>" 
        + "<th>월</th>"
        + "<th>화</th>"
        + "<th>수</th>"
        + "<th>목</th>"
        + "<th>금</th>"
        + "<th>토</th>"
        + "</tr>"
        + "<tr>";

int nFirstDay = (totalDays%7+1)%7;
int nCount = 0;
for (int i=0; i<nFirstDay; i++) {
    strCal += "<td> </td>";
    nCount++;
}

for (int i=1; i<=m[nMonth-1]; i++) {
	nCount++;
    if (nCount%7==1){
    	 strCal += "<tr>";
    } 
    
    strCal += String.format("<td style='text-align:right;'>%d</td>",i);
    
    if (nCount%7==0) {
    	 strCal += "</tr>";
    }
}

if (nCount%7!=0) {
	for (int i=0; i<7; i++) {
	    nCount++;
	    strCal += "<td> </td>";
		if (nCount%7==0) {
			 strCal += "</tr>";
			 break;
		}
	}
}


strCal += "</table>";
               
               
out.println(strCal);
%>
</body>
</html>