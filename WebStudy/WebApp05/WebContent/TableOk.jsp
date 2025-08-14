<%@ page contentType="text/html; charset=UTF-8"%>
<%!
    String styleBg1 = "style=\'background-color:#eeeedd;\'";
    String styleBg2 = "style=\'background-color:#444433;\'";
%>

<%
    // 스크립트릿 영역

    // 이전 페이지(Table.jsp)로부터 넘어온 데이터 수신
    // -> su1, su2
    String rowStr = request.getParameter("su1");
    String colStr = request.getParameter("su2");

    // 변환 데이터를 담아둘 변수 선언 및 초기화
    int row = 0;
    int col = 0;

    // 테이블 셀 안에서 1씩 증가시켜나갈 변수 선언 및 초기화
    int n = 0;
    
    try {
        row = Integer.parseInt(rowStr);
        col = Integer.parseInt(colStr);
    } catch (Exception e) {
        System.out.println(">>> " + e.toString());
    }

    System.out.println(">>> row : " + row);
    System.out.println(">>> col : " + col);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TableOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
    span {
        color: red;
        font-weight:bold;
    }
    
    td {
        width: 40px;
    }
</style>
</head>
<body>
    <div>
        <h1>JSP를 이용한 데이터 송수신 실습</h1>
        <p>Table.jsp → <span>TableOk.jsp</span></p>
        <hr>
    </div>

 
    <div>
        <table border="1">
            <%
             for (int i=1; i<=row; i++) {
            %>
            <tr <%=styleBg1 %>>
                <%
                for (int j=1; j<=col; j++) {
                %>
                    <%-- <td>[<%=i %> x <%=j %>]</td> --%>
                    <td style="text-align: right;"><%=++n %></td>
                <% } %>
            </tr>
            <% } %>
        </table>
    </div>
 

</body>
</html>