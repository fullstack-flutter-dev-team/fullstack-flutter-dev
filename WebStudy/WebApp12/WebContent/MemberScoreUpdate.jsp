<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.test.MemberScoreDAO"%>
<%@ page import="com.test.MemberScoreDTO"%>

<%
/* MemberScoreUpdate.jsp */

// 이전 페이지(MemberScoreUpdateForm.jsp)로부터 넘어온 데이터 수신
// → kor, eng, mat (+ sid)

String sid = request.getParameter("sid");
String strKor = request.getParameter("kor");
String strEng = request.getParameter("eng");
String strMat = request.getParameter("mat");

int kor = 0;
int eng = 0;
int mat = 0;

// MemberScoreDAO 인스턴스 생성
MemberScoreDAO dao = new MemberScoreDAO();
String strAddr = "MemberScoreList.jsp";

try
{
    kor = Integer.parseInt(strKor);
    eng = Integer.parseInt(strEng);
    mat = Integer.parseInt(strMat);
    
    // DB 연결 
    dao.connection();
    
    // 수신한 sid를 활용하여 name 얻어내기 
    MemberScoreDTO memberScore = new MemberScoreDTO();
    memberScore.setSid(sid);
    memberScore.setKor(kor);
    memberScore.setEng(eng);
    memberScore.setMat(mat);
    
    // 데이터 입력(update 쿼리문 수행)
    int result = dao.modify(memberScore);
    
    // 위의 메소드 호출 결과 반환하는 값에 따른 분기 수행 가능
    if(result < 1)  // 제대로 update 되지 못하면 에러페이지로 가도록
        strAddr = "NoticeScoreUpdate.jsp";
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
