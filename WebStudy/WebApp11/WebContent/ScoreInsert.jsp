<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.util.DBConn"%>
<%@ page import="com.test.ScoreDAO"%>
<%@ page import="com.test.ScoreDTO"%>

<%

// 한글깨짐 방지
request.setCharacterEncoding("utf-8");


// 수신한 데이터 처리
String name = request.getParameter("name");
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
String mat = request.getParameter("mat");

// 확인
System.out.printf("이름: %s\n", name);
System.out.printf("kor: %s\n", kor);
System.out.printf("eng: %s\n", eng);
System.out.printf("mat: %s\n", mat);

int result  = 0;

ScoreDTO score = new ScoreDTO();
score.setName(name);
score.setKor(kor);
score.setEng(eng);
score.setMat(mat);

// DB 입력
ScoreDAO dao = new ScoreDAO();

try {
    result = dao.addScore(score);
} catch (Exception e) {
    
} finally {
    try {
        // 데이터베이스 연결 종료
        dao.close();
    } catch (Exception e) {
        System.out.println(e.toString());
    }
}


// DB 처리 결과에 따른 분기 처리
if (result == 1) {
    response.sendRedirect("ScoreList.jsp");
}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--

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
            http://localhost:3306/WebApp11/ScoreList.jsp 로 한다.
            
        ○ 물리적 파일 구성
            - WebApp11_scott.sql
            - com.test.ScoreDTO.java
            - com.test.ScoreDAO.java
            - ScoreList.jsp 
            - ScoreInsert.jsp
            - com.util.DBConn.java
 -->

<p>
    <span>성적 입력 실패~!!!</span>
</p>


</body>
</html>