<%@ page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
/*
//이전 페이지(Calc.jsp)로부터 넘어온 데이터 수신
// → su1, su2, op
String strSu1 = request.getParameter("su1");
String strSu2 = request.getParameter("su2");
String op = request.getParameter("op");

int su1, su2;
su1 = su2 = 0;
String str = "";

try {
    if (strSu1 == null || strSu2 == null)
    {
        response.sendRedirect("Calc.jsp");
    }
    else
    {
        su1 = Integer.parseInt(strSu1);
        su2 = Integer.parseInt(strSu2);
        
        // 자바에서 설계한 클래스를 사용하기 위해... → 객체 생성
        Calc obj = new Calc();
        //-- 이클립스 자동완성 기능을 사용하여 구문을 작성할 경우
        //   『@page import="com.test.Calc"』이 구문도 함께 생성되어 처리됨.
        //   혹은, 자동완성 기능을 사용하지 않을 경우도
        //   『@page import="com.test.Calc"』 이와 같은 구문을 직접 작성해서 
        //   해당 클래스를 사용할 수 있도록 처리해주어야 한다.
        //   또는, 
        //   『com.test.Calc ob = new com.test.Clac();』와 같이 
        //   작성하는 것도 가능하다.
        
        obj.setSu1(su1);
        obj.setSu2(su2);
        obj.setOp(op);
        
        str = obj.result();
    }
} catch (Exception e) {
    System.out.println(e.toString());
}
*/

%>

<%
//이전 페이지(Calc.jsp)로부터 넘어온 데이터 수신
//→ su1, su2, op
/*
String strSu1 = request.getParameter("su1");
int su1 = Integer.parseInt(strSu1);
String strSu2 = request.getParameter("su2");
int su2 = Integer.parseInt(strSu2);
String op = request.getParameter("op");
*/

%>

<!-- ※ Calc 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정  -->
<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<!--
     → 위의 구문은 스크립릿 영역에서 
    『com.test.Calc ob = new com.test.Calc();』을 작성하여
     import 구문을 자동으로 처리한 것과 마찬가지 효과를 적용하게 된다.
-->


<!-- 
 ※ request.getParameter() 메서드를 통해 넘겨(전달)받은 데이터를
 『Calc』 클래스를 기반으로 생성된 『ob』 객체에 넘겨주기 위한 속성 지정
-->
<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/> --%>
<!-- 
     이 구문은 스크립릿 영역에서
     『ob.setSu1(strSu1);』과 같은 효과를 적용하게 된다. 
-->

<%-- <jsp:setProperty property="su2" name="ob"/> --%>
<%-- <jsp:setProperty property="op" name="ob"/> --%>


<!-- check~!!! -->
<!-- 
  ※ 속성의 이름과 동일한 파라미터인 경우
    『request.getParameter()』 메소드 없이 바로 받을 수 있으며,
     value 속성을 통해 넘겨주지 않아도 데이터 바인딩이 가능하다.
-->
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>
<!-- 
    ① request.getParameter() 처리 
        → 매개변수를 전달하기 위해 이전페이지로부터 데이터 수신 처리
    ② Integer.parseInt() 처리 
        → 매개변수를 전달하기 위한 형 변환 처리
    ③ ob.su1 → ob.setSu1() 메소드 호출 처리로 전환
       ob.su2 → ob.setSu2() 메소드 호출 처리로 전환
       ob.op  → ob.setOp()  메소드 호출 처리로 전환
        
     ==> 최종적으로 ob → Calc 기반의 ob 객체 각각의 속성에
        이전페이지로부터 넘겨받은 데이터를 적절한 타입(형)으로 변환하여 전달
 -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


    <div>
        <h1>JSP 액션 태그 실습</h1>
        <h5>두 번째 방법 처리 결과</h5>
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