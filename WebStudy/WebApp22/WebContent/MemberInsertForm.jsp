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
//MemberInsertForm.jsp



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
    <h1>JSTL 코어(core) set문 실습</h1>
    <p>회원 데이터 입력</p>
    <hr />
</div>


<!-- 
      ○ 물리적 파일 구성
         - MemberInsertFrom.jsp
         - MemberInsert.jsp
         - MemberList.jsp
         
         - com.test.MemberDTO 객체 생성 및 활용(→  사용자 정의 데이터 타입)

-->

<div>
	<form action="MemberInsert.jsp" method="post">
        <!-- (이름, 전화번호, 주소) * 5명 분 입력 → JSTL활용 -->
        <!-- → submit 액션 처리 →   -->
        <table class="table">
        <tr>
         <th>이름</th>
        <c:forEach var="i" begin="1" end="5" step="1">
        <td><input type="text" name="name${i }" class="txt"></td>
        </c:forEach>
        </tr>
        
        <tr>
        <th>전화번호</th>
        <c:forEach var="i" begin="1" end="5" step="1">
        <td><input type="tel" name="tel${i }" class="txt"></td>
        </c:forEach>
        </tr>
        
        <tr>
        <th>주소</th>
        <c:forEach var="i" begin="1" end="5" step="1">
        <td><input type="text" name="addr${i }" class="txt"></td>
        </c:forEach>
        </tr>
    
        <tr>
        <td colspan="6"> <button type="submit" class="btn" style="width: 80%;">입력</button></td>
        </tr>
        </table>
  
    </form>
</div>


</body>
</html>