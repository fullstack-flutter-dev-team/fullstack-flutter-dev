<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
    span {
        color: red;
        font-weight:bold;
    }
</style>
</head>
<body>
    <div>
        <h1>JSP를 이용한 데이터 송수신 실습</h1>
        <p><span>Hap.jsp</span> → HapOk.jsp</p>
        <hr>
    </div>

    <div>
        <!-- 1. form 구성 -->
        <!-- 2. form 의 action 속성 구성 -->
        <!--    → 『HapOk.jsp』로 지정해도 되고 『/WebApp05/HapOk.jsp』 형태로 지정해도 되지만,-->
        <!--       단, 『WebApp05/HapOk.jsp』로 지정하거나, 『/HapOk.jsp』로 지정하면 안된다. -->
       <form action="/WebApp05/HapOk.jsp" method="post">
            정수1
            <!-- ※ name 속성 구성  →  서버측 수신 식별자 →  su1 -->
            <input type="text" name="su1" class="txt"><br>
            정수2
            <!-- ※ name 속성 구성  →  서버측 수신 식별자 →  su2 -->
            <input type="text" name="su2" class="txt"><br>
            <br>

            <!-- ※ submit 액션 처리 -->
            <input type="submit" value="결과 확인" class="btn control">
        </form>
    </div>
    <!-- ① form 내부에 구성한 데이터들을 『HapOk.jsp』 페이지로 전송하겠다. → form, action   -->
    <!-- ② form 구성 데이터는 name으로 식별                               → su1, su2   -->
    <!-- ③ 이 데이터를 전달하며 『HapOk.jsp』페이지를 요청하겠다.           → form, action, submit -->
    <!-- ④ 데이터를 전송하며 페이지를 요청하는 방식은 post 방식             → method -->
    
    <!-- ==>> 내가 보내는 데이터들을 받고 나를 그 페이지로 안내해달라는 의미 -->
</body>
</html>