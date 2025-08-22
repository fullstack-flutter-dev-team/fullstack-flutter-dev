<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.test.MemberDAO"%>
<%@ page import="com.test.MemberDTO"%>

<%

StringBuilder sb = new StringBuilder();
MemberDAO dao = new MemberDAO();

try {
    // dao 의 데이터
    dao.connection();
    
    sb.append("<table class='table'>");
    sb.append("    <tr>");
    sb.append("        <th style='width: 50px;'>번호</th>");
    sb.append("        <th style='width: 100px;'>이름</th>");
    sb.append("        <th style='width: 150px;'>전화번호</th>");
    sb.append("        <th style='width: 200px;'>회원관리</th>");
    sb.append("    </tr>");

    for (MemberDTO member: dao.list()) {
        sb.append("    <tr>");
        sb.append("        <td style='width: 50px;'>" + member.getSid()  + "</td>");
        sb.append("        <td style='width: 100px;'>"+ member.getName() + "</td>");
        sb.append("        <td style='width: 150px;'>"+ member.getTel()  + "</td>");
        sb.append("        <td style='width: 200px;'>");
        
        /*  주소 문자열 구성 과정에서 따옴표 처리에 주의 할 것 check~!!! */                        
        sb.append("             <a href='MemberUpdateForm.jsp?sid="+ member.getSid() + "'>");
        sb.append("                 <button type='button' class='btnSmallAct'>수정</button>");
        sb.append("             </a>");
        sb.append("             <a href=''>");
        sb.append("                 <button type='button' class='btnSmallAct'>삭제</button>");
        sb.append("             </a>");
        sb.append("        </td>");
        sb.append("    </tr>");
        sb.append("    <tr>");
    }
    
    sb.append("</table>");
    
} catch (Exception e) {
    System.out.println(e.toString());
} finally {
    try {
        // 데이터베이스 연결 해제
        dao.close();
    } catch (Exception e) {
        System.out.println(e.toString());
    }
    
}



%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">
</head>
<body>


<div>
    <h1>회원 <span style="color: red;">명단</span> 관리 및 출력 페이지</h1>
    <hr>
</div>

<div>
    <a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
    <a href="MemberInsertForm.jsp"><button type="button">신규 회원 등록</button></a>
</div>
<br>

<div>
    <!-- 리스트 출력 -->
<!--     <table class="table"> -->
<!--         <tr> -->
<!--             <th style="width: 50px;">번호</th> -->
<!--             <th style="width: 100px;">이름</th> -->
<!--             <th style="width: 150px;">전화번호</th> -->
<!--             <th style="width: 200px;">회원관리</th> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>1</td> -->
<!--             <td>희동이</td> -->
<!--             <td>010-1111-1111</td> -->
<!--             <td> -->
<!--                 <a href=""><button type="button" class='btnSmallAct'>수정</button> </a> -->
<!--                 <a href=""><button type="button" class='btnSmallAct'>삭제</button> </a> -->
<!--             </td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>2</td> -->
<!--             <td>도우너</td> -->
<!--             <td>010-2222-2222</td> -->
<!--             <td> -->
<!--                 <a href=""><button type="button" class='btnSmallAct'>수정</button> </a> -->
<!--                 <a href=""><button type="button" class='btnSmallAct'>삭제</button> </a> -->
<!--             </td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>3</td> -->
<!--             <td>마이콜</td> -->
<!--             <td>010-3333-3333</td> -->
<!--             <td> -->
<!--                 <a href=""><button type="button" class='btnSmallAct'>수정</button> </a> -->
<!--                 <a href=""><button type="button" class='btnSmallAct'>삭제</button> </a> -->
<!--             </td> -->
<!--         </tr> -->
<!--     </table> -->
        <%=sb.toString() %>
</div>

</body>
</html>