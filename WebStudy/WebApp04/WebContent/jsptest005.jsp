<%@ page contentType="text/html; charset=UTF-8"%>
<%
    // 스크립트릿(Scriptlet) 영역
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest005.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
    <!-- 
Servlet 컨테이너에 전달....?
 -->
    <div>
        <h1>JSP 관찰하기</h1>
        <HR>
    </div>

    <div>
        <!-- 표현식 -->
        <h2>HttpServlet 관련 실습 및 관찰</h2>
        <!-- 1. 폼 컨트롤을 통해 데이터를 전송하기 위해서는 <form> 태그 구성 필요 -->
        <!-- 2. form 태그의 action 속성은 데이터 전송 및 페이지 요청을 해야 하는 대상 페이지를 등록하는 기능을 수행한다. -->
        <!-- <form action=""> --><!-- -->
            <!-- <form action="/WebApp04/jsptest003.jsp">--><!--method 속성 생략 시 GET방식으로 요청 -->
            <!-- <form>action 속성 생략 시 데이터 전송 및 페이지 요청을 하게되는 대상은 자기 자신이 된다.  -->
            <!-- <form action=""> --><!-- method 속성 생략 시 GET방식 -->
            <!-- <form action="/WebApp04/jsptest003.jsp" method=""> --><!-- method 속성 생략 시 GET방식 -->
            <!-- <form action="/WebApp04/jsptest003.jsp" method="post"> --><!-- -->
            <!-- <form action="WebApp04/jsptest003.jsp" method="post">--><!--(X) -->
            <!--<form action="/jsptest003.jsp" method="post"> --><!-- (X) -->
            <!--<form action="jsptest003.jsp" method="post">--><!-- (o) -->
            <form action="/WebApp04/login" method="post"><!-- (o) -->
            <table>
                <tr>
                    <th>아이디</th>
                    <!-- name th -->
                    <td><input type="txt" name="userId" maxlength="10" class="txt" style="width:300px;"></td>
                </tr>
                <tr>
                    <th>패스워드</th>
                    <td><input type="password" name="userPwd" maxlength="10" class="txt" style="width:300px;"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <!-- submit 액션 → form 데이터 전송 및 페이지 요청 -->
                        <input type="submit" value="로그인" class="btn control" style="width:100px;">
                        <input type="reset" value="다시입력" class="btn control" style="width:100px;">
                    </td>
                </tr>
                
            </table>
        </form>
    </div>
    

</body>
</html>