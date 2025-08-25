<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

/* MemberDelete.jsp */

// 이전 페이지(→ MemberList.jsp)로부터 넘어온 데이터 수신
// → sid

// -※ 수신한 sid를 활용하여 회원 데이터 조회
//      이를 통해 얻어낸 데이터를 가지고 폼의 내용을 구성
String sid = request.getParameter("sid");

MemberDAO dao = new MemberDAO();
int result = 0;

// 사용자에게 다시 요청할 수 있도록 안내하는 주소 문자열
String strAddr = "";

try
{
    // 데이터베이스 연결
    dao.connection();
    
//     result = dao.remove(sid);

    // 참조하는 레코드 수 확인
    int checkCount = dao.refCount(sid);
    //-- TBL_MEMBER(→부모) 테이블의 제거하고자 하는 데이터의
    //   SID 를 참조하는 TBL_MEMBERSCORE(→ 자식) 테이블 내의 데이터 갯수 확인
    
    
    if (checkCount == 0) { //-- 제거 가능
        dao.remove(sid);
        strAddr = "MemberList.jsp";
    } else {  //-- 제거 불가
        strAddr = "Notice.jsp";
        //-- TBL_MEMBERSCORE 테이블의 데이터가 TBL_MBMBER 테이블의 데이터를
        //   참조하고 있는 경우로 삭제가 불가능한 상황
        //   → 제거하지 못하는 사유를 안내하는 페이지로 이동
        //     + 리스트 페이지로 돌아가기 버튼
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
