<%@ page contentType="text/html; charset=UTF-8"%>
<%@page  import= "java.sql.Connection"%>
<%@page  import= "java.sql.Statement"%>
<%@page  import= "java.sql.ResultSet"%>
<%@page import= "com.util.DBConn" %>
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


String strStatus = "";
StringBuilder sb = new StringBuilder();
StringBuilder sbList = new StringBuilder();
int result = 0;

try {
    // DB connection
    Connection conn = DBConn.getConnection();
    
    if (conn != null) {
        sb.append("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) ");
        sb.append(" VALUES(SCORESEQ.NEXTVAL ");
        sb.append(String.format(", '%s'",name));
        sb.append(String.format(", %d",Integer.parseInt(kor)));
        sb.append(String.format(", %d",Integer.parseInt(eng)));
        sb.append(String.format(", %d",Integer.parseInt(mat)));
        sb.append(")");
        System.out.println(">>> sql: " + sb.toString());
        Statement stmt = conn.createStatement();
        result = stmt.executeUpdate(sb.toString());
    }
    
} catch (Exception e) {
	strStatus = e.toString();
}


// 처리 결과 분기처리
if (result > 0) {
	// 성적 데이터 입력 성공
	response.sendRedirect("ScoreList.jsp");
} else {
	// 성적 데이터 입력 실패
	response.sendRedirect("ScoreError.jsp");
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