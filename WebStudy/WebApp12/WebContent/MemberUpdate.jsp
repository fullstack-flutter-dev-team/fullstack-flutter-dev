<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

/* MemberUpdate.jsp */

// 한글깨짐 방지
request.setCharacterEncoding("UTF-8");

// 이전 페이지(→ MemberUpdateFrom.jsp)로부터 넘어온 데이터 수신
// → sid

// -※ 수신한 sid를 활용하여 회원 데이터 조회
//      이를 통해 얻어낸 데이터를 가지고 폼의 내용을 구성
String sid = request.getParameter("sid");
String name = request.getParameter("uName");
String tel  = request.getParameter("uTel");

System.out.println(">>sid: " + sid);
System.out.println(">>sid: " + sid);
System.out.println(">>sid: " + sid);

MemberDAO dao = new MemberDAO();
int result = 0;

try
{
    // 데이터베이스 연결
    dao.connection();
    
    MemberDTO member = new MemberDTO();
    member.setSid(sid);
    member.setName(name);
    member.setTel(tel);
    
    // 이후 반환
    result = dao.modify(member);
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

// 클라이언트에 MemberList.jsp 페이지를 다시 요청할 수 있도록 안내
response.sendRedirect("MemberList.jsp");

// 이후 보여주는 페이지 구성 모두 삭제
%>