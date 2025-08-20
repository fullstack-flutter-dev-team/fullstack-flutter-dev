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
String resultStr = "";

try {
    nNum1 = Integer.parseInt(num1);
    nNum2 = Integer.parseInt(num2);

    switch (op) {
        case "+": 
            strResult = String.format("%d", (nNum1 + nNum2));
            resultStr = String.format("%d %s %d = %d", num1, num2, op, (nNum1 + nNum2));
            break;
        case "-": 
            strResult = String.format("%d", (nNum1 - nNum2));
            resultStr = String.format("%d %s %d = %d", num1, num2, op, (nNum1 - nNum2));
            break;
        case "*": 
            strResult = String.format("%d", (nNum1 * nNum2));
            resultStr = String.format("%d %s %d = %d", num1, num2, op, (nNum1 * nNum2));
            break;
        case "/": 
            strResult = String.format("%.1f", (nNum1 / (double)nNum2));
            resultStr = String.format("%d %s %d = %d", num1, num2, op, (nNum1 / (double)nNum2));
            break;
    }


} catch (Exception e) {
    System.out.println(e.toString());
}

request.setAttribute("result", strResult);
request.setAttribute("resultStr", resultStr);

// 포워드
pageContext.forward("Receive11.jsp");

// jsp 액션태그
// <jsp:forward page="Receive11.jsp"></jsp:forward>

%>
