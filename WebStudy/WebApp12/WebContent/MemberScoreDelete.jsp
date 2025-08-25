<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

/* MemberScoreDelete.jsp */

// 이전 페이지(→ MemberScoreList.jsp)로부터 넘어온 데이터 수신
// → sid

// -※ 수신한 sid를 활용하여 회원 데이터 조회
//      이를 통해 얻어낸 데이터를 가지고 폼의 내용을 구성
String sid = request.getParameter("sid");

MemberScoreDAO dao = new MemberScoreDAO();
int result = 0;

// 사용자에게 다시 요청할 수 있도록 안내하는 주소 문자열
String strAddr = "MemberScoreList.jsp";
int checkCount = 0;

try
{
    // 데이터베이스 연결
    dao.connection();
    
    // 삭제된 레코드 수 확인
    checkCount = dao.remove(sid);
    
    if (checkCount < 1) {
    	strAddr = "";
    }
}
catch(Exception e)
{
    System.out.println(e.toString());
}
finally
{
    try
    {
        // 데이터베이스 연결 종료
        dao.close();
    }
    catch(Exception e)
    {
        System.out.println(e.toString());
    }
}

// check~!!!
// 클라이언트에 MemberList.jsp 페이지를 다시 요청할 수 있도록 안내
response.sendRedirect(strAddr);

// 이후 보여주는 페이지 구성 모두 삭제
%>
