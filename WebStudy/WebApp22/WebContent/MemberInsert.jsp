<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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
// MemberInsert.jsp
//-- MemberDTO를 요소로 취하는 자료구조 생성
//-- 구성된 자료구조 전달(→ MemberList.jsp)

ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
MemberDTO member1 = new MemberDTO();
MemberDTO member2 = new MemberDTO();
MemberDTO member3 = new MemberDTO();
MemberDTO member4 = new MemberDTO();
MemberDTO member5 = new MemberDTO();

String name = "";
String tel = "";
String addr = "";


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
    <h1>JSTL 코어(core) set문 실습</h1>
    <p>회원 명단 확인</p>
    <hr />
</div>

   <c:forEach var="i" begin="1" end="5" step="1">
       <c:if test="${i==1 }">
         <c:set var="mdto" value="<%= member1 %>"/>
         <c:set target="${mdto}" property="name" value="${param.name1}"/>
         <c:set target="${mdto}" property="tel" value="${param.tel1}"/>
         <c:set target="${mdto}" property="addr" value="${param.addr1}"/>
         <% memberList.add(member1); %>   
       </c:if>
       <c:if test="${i==2 }">
       <c:set var="mdto" value="<%= member2 %>"/>
         <c:set target="${mdto}" property="name" value="${param.name2}"/>
         <c:set target="${mdto}" property="tel" value="${param.tel2}"/>
         <c:set target="${mdto}" property="addr" value="${param.addr2}"/>
         <% memberList.add(member2); %>   
       </c:if>
       <c:if test="${i==3 }">
       <c:set var="mdto" value="<%= member3 %>"/>
         <c:set target="${mdto}" property="name" value="${param.name3}"/>
         <c:set target="${mdto}" property="tel" value="${param.tel3}"/>
         <c:set target="${mdto}" property="addr" value="${param.addr3}"/>
         <% memberList.add(member3); %>   
       </c:if>
       <c:if test="${i==4 }">
       <c:set var="mdto" value="<%= member4 %>"/>
         <c:set target="${mdto}" property="name" value="${param.name4}"/>
         <c:set target="${mdto}" property="tel" value="${param.tel4}"/>
         <c:set target="${mdto}" property="addr" value="${param.addr4}"/>
         <% memberList.add(member4); %>   
       </c:if>
       <c:if test="${i==5 }">
         <c:set var="mdto" value="<%= member5 %>"/>
         <c:set target="${mdto}" property="name" value="${param.name5}"/>
         <c:set target="${mdto}" property="tel" value="${param.tel5}"/>
         <c:set target="${mdto}" property="addr" value="${param.addr5}"/>
         <% memberList.add(member5); %>   
       </c:if>
       
    </c:forEach>
    
   
    
    <%
    request.setAttribute("memberList", memberList);
    RequestDispatcher rd = request.getRequestDispatcher("MemberList.jsp");
    rd.forward(request, response);
    
    %>
    



</body>
</html>