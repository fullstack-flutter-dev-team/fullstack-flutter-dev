<%@ page contentType="text/html; charset=UTF-8"%>
<!-- Calc_ok3.jsp -->

<%-- Calc_ok2.jsp
<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>
--%>

<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


    <div>
        <h1>JSP 액션 태그 실습</h1>
        <h5>세 번째 방법 처리 결과</h5>
        <hr>
    </div>
    <div>
        <a href="Calc.jsp">&lt; Calc.jsp로 이동</a>
    </div>
    
    <div>
<!--         <h2>결과</h2> -->
<%--        <h2><%=str %></h2> --%>
        <span>su1 : <jsp:getProperty property="su1" name="ob"/></span>
        <span>su2 : <jsp:getProperty property="su2" name="ob"/></span>
        <span>op : <jsp:getProperty property="op" name="ob"/></span>
        <h2><%=ob.result() %></h2>
    </div>
    
</body>
</html>