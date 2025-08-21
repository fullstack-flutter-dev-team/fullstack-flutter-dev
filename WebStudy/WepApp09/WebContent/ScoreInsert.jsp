<%@ page contentType="text/html; charset=UTF-8"%>
<%

//
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
String mat = request.getParameter("mat");

System.out.printf("name: %s\n", name);
System.out.printf("kor: %s\n", kor);
System.out.printf("eng: %s\n", eng);
System.out.printf("mat: %s\n", mat);


response.sendRedirect("ScoreList.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
    .msg {
        color: red;
        font-size: small;
        display: none;
    }
    
    .btn {
        width: 100%;
    }
</style>
</head>
<body>


<%-- 


        -------------------------------------------------------------

        이름(*)  [textbox ]      -> 이름 입력 확인
        국어점수 [textbox ]      -> 0 ~ 100 사이의 정수가 입력되었는지 확인
        영어점수 [textbox ]      -> 0 ~ 100 사이의 정수가 입력되었는지 확인
        수학점수 [textbox ]      -> 0 ~ 100 사이의 정수가 입력되었는지 확인


        <성적 데이터 추가>  -> button
        
        번호    이름     국어점수  영어점수  수학점수   총점  평균
        1        홍길동    90            90      80     xxx   xx.x

        -------------------------------------------------------------

        - 사용자의 최초 요청 주소는
            http://localhost:3306/WebApp09/ScoreList.jsp 로 한다.
            
        ○ 물리적 파일 구성
            - WebApp09_scott.sql
            - ScoreList.jsp 
            - ScoreInsert.jsp
            - com.util.DBConn.java
 --%>
 
</body>
</html>