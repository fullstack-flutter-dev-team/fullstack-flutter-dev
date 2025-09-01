<%@page import="java.sql.Connection"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
// Updated_ok.jsp

// check~!!!
// 위의 액션 태그를 통해 dto의 속성값들을 이전 페이지로부터 수신


// 이전 페이지(→ Article.jsp)로부터 넘어온 데이터 수신
// → pwdSource, num, pageNum
String strPageNum = request.getParameter("pageNum");  //-- 
int pageNum = Integer.parseInt(strPageNum);

// String subject = request.getParameter("subject");  //-- 
// String name = request.getParameter("name");  //-- 
// String email = request.getParameter("email");  //-- 
// String content = request.getParameter("content");  //-- 
// String pwd = request.getParameter("pwd");  //-- 

// BoardDTO dto = new BoardDTO();
// dto.setSubject(subject);
// dto.setName(name);
// dto.setEmail(email);
// dto.setContent(content);
// dto.setPwd(pwd);


//데이터베이스 연결
Connection conn = DBConn.getConnection();
BoardDAO dao = new BoardDAO(conn);

int result = 0;

// dao의 데이터 업데이트 메서드 호출
result = dao.updateData(dto);

// ※ result 값에 따른 분기처리 가능~!!!

//데이터베이스 연결 닫기
DBConn.close();

// if (result > 0) {
// //     response.sendRedirect("List.jsp");
//     response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum);
// } else {
    
// }

response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum + "&num=" + dto.getNum());
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Updated_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

</body>
</html>