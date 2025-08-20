<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.net.URLEncoder"%>
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
            resultStr = String.format("%s %s %s = %d", num1, op, num2, (nNum1 + nNum2));
            break;
        case "-": 
            strResult = String.format("%d", (nNum1 - nNum2));
            resultStr = String.format("%s %s %s = %d", num1, op, num2, (nNum1 - nNum2));
            break;
        case "*": 
            strResult = String.format("%d", (nNum1 * nNum2));
            resultStr = String.format("%s %s %s = %d", num1, op, num2, (nNum1 * nNum2));
            break;
        case "/": 
            strResult = String.format("%.1f", (nNum1 / (double)nNum2));
            resultStr = String.format("%s %s %s = %.1f", num1, op, num2, (nNum1 / (double)nNum2));
            break;
    }


} catch (Exception e) {
    System.out.println(e.toString());
}

StringBuilder sb = new StringBuilder();
sb.append("Receive12.jsp?");
sb.append("num1=" + num1);
sb.append("&num2=" + num2);
sb.append("&op=" + op);
sb.append("&result=" + strResult);
sb.append("&resultStr=" + resultStr);
// sb.append("&op=" + URLEncoder.encode(op, "UTF-8"));
// sb.append("&result=" + URLEncoder.encode(strResult, "UTF-8"));
// sb.append("&resultStr=" + URLEncoder.encode(resultStr, "UTF-8"));

// check~!!!
//-- 새로운 Request 요청
// 클라이언트에게 Receive12.jsp 페이지를 다시 요청할 수 있도록 안내
//String redirectURL = URLEncoder.encode(sb.toString(), "UTF-8");
// Redirect(리다이렉트)
// ※ 『sendRedirect(String location)』
//     : 지정된 URL(Location)로 요청을 다시 전송한다.
response.sendRedirect(sb.toString());

%>
