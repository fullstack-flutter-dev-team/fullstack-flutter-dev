<%@page import="com.test.MyData"%>
<%@page import="java.util.List"%>
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
// Test04.jsp
//-- 사용자 정의 데이터타입을 구성요소로 취하는 자료구조 생성

List<MyData> list = new ArrayList<>();

MyData ob = new MyData("이하나", 20);
list.add(ob);

ob = new MyData("김한국", 21);
list.add(ob);

ob = new MyData("홍길동", 22);
list.add(ob);

ob = new MyData("홍범도", 23);
list.add(ob);

request.setAttribute("list", list);

%>



<jsp:forward page="Test04_ok.jsp"></jsp:forward>