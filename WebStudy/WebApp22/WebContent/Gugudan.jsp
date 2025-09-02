<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<%!
String COLOR_RED      = "\u001B[31m" ;
String COLOR_GREEN    = "\u001B[32m" ;
String COLOR_YELLOW   = "\u001B[33m" ;
String COLOR_BLUE     = "\u001B[34m" ;
%>

<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
    <h1>JSTL 코어(core)를 활용한 구구단 출력</h1>
    <hr />
</div>


<!-- 
      ○ 원하는 단을 입력받아 구구단을 출력하는 JSP 페이지를 구성한다.
         단, JSTL core if 문과 forEach 구문을 활용한다.
 -->
 
 <div>
     <form method="post">
         <table class="table">
             <tr>
                 <th style="width: 15%;">원하는 단 입력</th>
                 <td>
                    <input type="text" name="dan" class="txt" style="width: 13%;">
                </td>
             </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn" style="width: 28%;">확인</button>
                </td>
            </tr>
         </table>
     </form>
 </div>
 
 
 <div>
    <!-- 결과 처리 -->
    <%--     ${param.dan } --%>
 
    <c:if test="${!empty param.dan}">
    <ul>
        <c:forEach var="su" begin="1" end="9" step="1">
           <li>
           ${param.dan } * ${su } = ${param.dan * su }
           </li>
        </c:forEach>
    </ul>
    </c:if>
 </div>
 
 <c:if test="${param.dan >=1 && param.dan <= 9}">
    <p style="background-color: yellow;width: 20%; text-align: center; font-weight: bold;">${param.dan } 단</p>
    <c:forEach var="i" begin="1" end="9" step="1">
       <span style="background-color: #c2f3a1ff; width:20%;margin-left:40px;">${param.dan } * ${i } = ${i*param.dan }</span><br>
    </c:forEach>
 
 </c:if>
 

</body>
</html>