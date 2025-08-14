<%@ page contentType="text/html; charset=UTF-8"%>
<%! 
    String calcDan(int dan) {
	   String result = "";
	   
	   for (int i=1;i<=9;i++) {
		   result += dan + " * " + i + " = " + (dan*i) + "<br>";
	   }
	
	   return result;
	
    }
%>

<%
	// 스크립트릿 영역
	
	// ※ 이번에 수신하게 되는 내용을... 한글 데이터가 포함된 형태
	request.setCharacterEncoding("UTF-8"); //-- check~!!!
	
	// 이전 페이지(CheckArea.jsp)로부터 넘어온 데이터 수신
	//  → dan
	
	// 이름 데이터 수신
	String dan = request.getParameter("dan");     //-- 텍스트박스... 단일값 수신
	System.out.println(">>> dan : " + dan);

    int n = 0;

    try {
        n = Integer.parseInt(dan);
    } catch (Exception e) {
        System.out.println(e.toString());
    }
	
//	String resultCalcDan = calcDan(dan);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GugudanOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
    span {
        color: red;
        font-weight:bold;
    }
</style>
</head>
<body>
    <div>
        <h1>JSP를 이용한 데이터 송수신 실습</h1>
        <p>RadioSelect.jsp → <span>GugudanOk.jsp</span></p>
        <hr>
    </div>

    <div>
    
    <!-- 주석문 처리(html주석: 클라이언트에서 확인 가능) -->  
    <%-- 주석문 처리(jsp주석: 클라이언트에서 확인 불가능) --%>
<%--
        // 스크립트릿 영역
        for (int i = 1; i<=9; i++) {
        	out.print(n + " * " + i + " = " + (n*i) + "<br>");
        }
--%>

    <%
        // 스크립트릿 영역
        for (int i = 1; i<=9; i++)
        {
    %>
            <%=n %>  *  <%=i %>   =  <%=(n*i) %> <br>
    <%
        }
    %>
       
<%-- 
        5 * 1 =  5<br>
        5 * 2 = 10<br>
        5 * 3 = 15<br>
        5 * 4 = 20<br>
        5 * 5 = 25<br>
        5 * 6 = 30<br>
        5 * 7 = 35<br>
        5 * 8 = 40<br>
        5 * 9 = 45<br>
 --%>
    </div>
</body>
</html>