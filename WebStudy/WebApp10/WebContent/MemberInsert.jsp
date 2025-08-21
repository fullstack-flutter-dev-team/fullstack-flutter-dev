<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.test.MemberDAO" %>
<%@ page import="com.test.MemberDTO" %>
<%@ page import="com.util.DBConn" %>
<%

// MemberInsert.jsp

// 1. 데이터 입력 액션 처리 페이지
// 2. 한글 깨짐 방지 처리
// 3. 데이터 수신
// 4. 수신한 데이터로 MemberDTO 구성
// 5. MemberDAO 의 add() 메서드 호출하며 구성된 MemberDTO 전달(→ insert 쿼리문 수행)
// 6. 사용자에게 안내 메시지 전달(→ MemberList.jsp 페이지 다시 요청)

request.setCharacterEncoding("utf-8");
//-- 한글 데이터가 깨지지 않도록 인코딩 설정


// 위 코드를 수행한 후 데이터 수신 처리
// 이전 페이지로(→ MemberList.jsp)부터 넘어온 데이터 수신
// → userName, userTel
String userName = request.getParameter("userName");
String userTel = request.getParameter("userTel");

//MemberDAO dao = new MemberDAO();
MemberDAO dao = null;
String memberCount = "";
int result = 0;

try {
    // MemberDAO 객체 생성 및 데이터베이스 연결
    dao = new MemberDAO();
    
    // MemberDTO 구성
    MemberDTO member = new MemberDTO();
    member.setName(userName);
    member.setTel(userTel);
    
    // MemberDAO의 add() 메서드 호출 → insert 쿼리문 수행
    // dao.add(member)
    result = dao.add(member);
    
    // ※ 필요하다면 add() 메서드의 반환 값을 넘겨받아
    //    insert 액션의 정상 처리 여부 확인 후 추가 코드 구성 가능~!!!
    
} catch (Exception e) {
    System.out.println(e.toString());
} finally {
    try {
        // 데이터베이스 연결 종료
        dao.close();
    } catch (Exception e) {
        System.out.println(e.toString());
    }
}

// 사용자에게 MemberList.jsp 페이지를 다시 요청할 수 있도록 안내

if (result == 1) {
    response.sendRedirect("MemberList.jsp");
}


// 아래 클라이언트를 만나 보여주는 페이지 구성은 모두 삭제 가능~!!!
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
 a {
    text-decoration: none;
    font-weight: bold;
    color: blue;
 }
</style>
</head>
<body>

    <div>
        <h1>에러 페이지</h1>
        <hr>
    </div>
    
    <div>
        <h2>회원 데이터 입력오류 발생~!!!</h2>
        <a href="MemberList.jsp">&lt;돌아가기</a>
    </div>

</body>
</html>
