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

// 게시물 현재 상태의 최대값 얻어오는 메서드 호출
int maxNum = dao.getMaxNum();
int result = 0;

// 게시물 번호 최대값에 1을 더해서 set하는 과정 → dto에 추가~!!!
dto.setNum(++maxNum);

//IP Address 확인
// → request.getRemoteAddr(); → 클라이언트(브라우저)의 IP Address 확인 → dto 에 추가~!!!
dto.setIpAddr(request.getRemoteAddr());

// dao의 데이터 입력 메서드 호출
result = dao.insertData(dto);

//데이터베이스 연결 닫기
DBConn.close();

if (result > 0) {
//     response.sendRedirect("List.jsp");
    response.sendRedirect(cp + "/List.jsp");
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

</body>
</html>