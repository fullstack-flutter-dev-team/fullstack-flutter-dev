<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.test.MemberScoreDAO"%>
<%@ page import="com.test.MemberScoreDTO"%>

<%

// StringBuffer sb=  new StringBuffer();
StringBuilder sb = new StringBuilder();
MemberScoreDAO dao = new MemberScoreDAO();

try {
    // dao 의 데이터
    dao.connection();
    
    sb.append("<table class='table'>");
    sb.append("    <tr>");
    sb.append("        <th style='width: 70px;''>번호</th>");
    sb.append("        <th style='width: 120px;'>이름</th>");
    sb.append("        <th style='width: 150px;'>국어</th>");
    sb.append("        <th style='width: 150px;'>영어</th>");
    sb.append("        <th style='width: 150px;'>수학</th>");
    sb.append("        <th style='width: 200px;'>총점</th>");
    sb.append("        <th style='width: 200px;'>평균</th>");
    sb.append("        <th style='width: 100px;'>석차</th>");
    sb.append("        <th style='width: 300px;'>성적처리</th>");
    sb.append("    </tr>");
    sb.append("");
    sb.append("");

    for (MemberScoreDTO memberScore: dao.list()) {
        sb.append("<tr>");
        sb.append("    <td>"+ memberScore.getSid() +"</td>");
        sb.append("    <td>"+ memberScore.getName() +"</td>");
        sb.append("    <td>"+ memberScore.getKor() +"</td>");
        sb.append("    <td>"+ memberScore.getEng() +"</td>");
        sb.append("    <td>"+ memberScore.getMat() +"</td>");
        sb.append("    <td>"+ memberScore.getTot() +"</td>");
        sb.append("    <td>"+ String.format("%.2f",memberScore.getAvg()) +"</td>");
        sb.append("    <td>"+ memberScore.getRank() +"</td>");
        sb.append("    <td>");
        // if (memberScore.getTot() < 0) {
        if (memberScore.getKor() == -1 && memberScore.getEng() == -1 || memberScore.getMat() == -1) 
        {
            // 성적 데이터 입력 → 입력 불가, 수정/삭제만 가능
            sb.append("        <a href='MemberScoreInsertForm.jsp?sid="+ memberScore.getSid() + "'>");
            sb.append("            <button type='button' class='btnSmallAct'>입력</button> </a>");
            sb.append("        <a href=''><button type='button' class='btnSmallNon' disabled='disabled'>수정</button> </a>");
            sb.append("        <a href=''><button type='button' class='btnSmallNon' disabled='disabled'>삭제</button> </a>");
        } else {
            sb.append("        <a href=''><button type='button' class='btnSmallNon' disabled='disabled'>입력</button> </a>");
            sb.append("        <a href='MemberScoreUpdateForm.jsp?sid="+ memberScore.getSid() + "'>");
            sb.append("            <button type='button' class='btnSmallAct'>수정</button> </a>");
            sb.append("        <a href='javascript:memberScoreDelete("+ memberScore.getSid() + ",\"" + memberScore.getName() + "\")'>");
            sb.append("            <button type='button' class='btnSmallAct'>삭제</button> </a>");
        }
        sb.append("    </td>");
        sb.append("</tr>");
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
<title>MemberScoreList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">
<script type="text/javascript">

function memberScoreDelete(sid, name) {
    console.log(">>> sid: " + sid);
    console.log(">>> name: " + name);
    
    // 주소 문자열 구성 과정에서 따옴표 처리에 주의할 것~~!!! check~!!!
    
    var response = confirm("번호 : " + sid + ", 이름: " + name 
                           + " \n 이 회원의 성적 데이터를 정말 삭제하시겠습니까?");
    // confirm() 함수를 통해 호출되는 대화창은
    // 확인(true) 또는 취소(false)를 반환하게 된다.
    
    if (response) {
        window.location.href = "MemberScoreDelete.jsp?sid=" + sid;
    } else {
        return;
    }
}

</script>
</head>
<body>


<div>
    <!-- 페이지 정체성 -->
    <h1>회원 <span style="color: blue;">성적</span> 관리 및 출력 페이지</h1>
    <hr>
</div>

<div>
    <!-- 기본 메뉴 구성(기능별 페이지 이동) -->
    <a href="MemberList.jsp"><button type="button">회원 명단 관리</button></a>
</div>
<br>

<div>
    <!-- 리스트 출력 -->
<!--  
   <table class="table">
        <tr>
            <th style="width: 70px;">번호</th>
            <th style="width: 120px;">이름</th>
            <th style="width: 150px;">국어</th>
            <th style="width: 150px;">영어</th>
            <th style="width: 150px;">수학</th>
            <th style="width: 200px;">총점</th>
            <th style="width: 200px;">평균</th>
            <th style="width: 100px;">석차</th>
            <th style="width: 300px;">성적처리</th>
        </tr>
        <tr>
            <td>1</td>
            <td>희동이</td>
            <td>50</td>
            <td>50</td>
            <td>50</td>
            <td>150</td>
            <td>50</td>
            <td>3</td>
            <td>
                <a href=""><button type="button" class='btnSmallAct'>입력</button> </a>
                <a href=""><button type="button" class='btnSmallAct'>수정</button> </a>
                <a href=""><button type="button" class='btnSmallAct'>삭제</button> </a>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td>도우너</td>
            <td>60</td>
            <td>60</td>
            <td>60</td>
            <td>180</td>
            <td>60</td>
            <td>2</td>
            <td>
                <a href=""><button type="button" class='btnSmallNone'>입력</button> </a>
                <a href=""><button type="button" class='btnSmallAct'>수정</button> </a>
                <a href=""><button type="button" class='btnSmallAct'>삭제</button> </a>
            </td>
        </tr>
        <tr>
            <td>3</td>
            <td>마이콜</td>
            <td>70</td>
            <td>70</td>
            <td>70</td>
            <td>210</td>
            <td>70</td>
            <td>1</td>
            <td>
                <a href=""><button type="button" class='btnSmallAct'>입력</button> </a>
                <a href=""><button type="button" class='btnSmallAct'>수정</button> </a>
                <a href=""><button type="button" class='btnSmallAct'>삭제</button> </a>
            </td>
        </tr>
    </table> 
-->
    <%=sb.toString() %>
</div>

</body>
</html>