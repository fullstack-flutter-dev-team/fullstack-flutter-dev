<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>

<%
//  Delete_ok.jsp

// 이전 페이지(→ Updated.jsp)로부터 넘어온 데이터 수신
// → num, pageNum, ....
String strNum = request.getParameter("num");  //-- 
String strPageNum = request.getParameter("pageNum");  //-- 

//데이터베이스 연결
Connection conn = DBConn.getConnection();
BoardDAO dao = new BoardDAO(conn);
int result = 0;

try {
    //dao의 데이터 입력 메서드 호출
    result = dao.deleteData(Integer.parseInt(strNum));
} catch (Exception e) {
    System.out.println(e.toString());
} finally {
    //데이터베이스 연결 닫기
    DBConn.close();
}


//※ result 값에 따른 분기처리 가능~!!!
System.out.println(">>>> cp : " + cp);
response.sendRedirect(cp + "/List.jsp?pageNum=" + strPageNum);
// cp → WebApp20
%>

