<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.test.MemberScoreDAO"%>
<%@ page import="com.test.MemberScoreDTO"%>

<%
/* MemberScoreInsert.jsp */

// 이전 페이지(MemberScoreInsertForm.jsp)로부터 넘어온 데이터 수신
// → kor, eng, mat (+ sid)

String sid = request.getParameter("sid");
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
String mat = request.getParameter("mat");

// MemberScoreDAO 인스턴스 생성
MemberScoreDAO dao = new MemberScoreDAO();
String strAddr = "MemberScoreList.jsp";

try
{
    // DB 연결 
    dao.connection();
    
    // 수신한 sid를 활용하여 name 얻어내기 
    MemberScoreDTO memberScore = new MemberScoreDTO();
    memberScore.setSid(sid);
    memberScore.setKor(Integer.parseInt(kor));
    memberScore.setEng(Integer.parseInt(eng));
    memberScore.setMat(Integer.parseInt(mat));
    
    // 데이터 입력(insert 쿼리문 수행)
    int result =dao.add(memberScore);
    
    // 위의 메소드 호출 결과 반환하는 값에 따른 분기 수행 가능
    if(result < 1)  // 제대로 insert 되지 못하면 에러페이지로 가도록
        strAddr = "NoticeScoreInsert.jsp";
}
catch (Exception e)
{
    System.out.println(e.toString());
}
finally
{
    try
    {
        // DB 연결 종료
        dao.close();
    }
    catch (Exception e)
    {
        System.out.println(e.toString());
    }
}

// 클라이언트에 새로운 페이지를 다시 요청할 수 있도록 안내 
// MemberScoreSelect.jsp 로 클라이언트 안내
response.sendRedirect(strAddr);

/* 보여주는 코드 제거 */

%>
