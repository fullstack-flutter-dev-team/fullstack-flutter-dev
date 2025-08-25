<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.test.MemberScoreDAO"%>
<%@ page import="com.test.MemberScoreDTO"%>

<%
/* MemberScoreUpdateForm.jsp */

// 이전페이지(MemberScoreList.jsp)로부터 넘어온 데이터 수신
// → sid

String sid = request.getParameter("sid");

String name = "";
int nKor = 0;
int nEng = 0;
int nMat = 0;

// 해당 회원의 정보를 조회하기 위해 dao 인스턴스 생성
MemberScoreDAO dao = new MemberScoreDAO();

try
{
    // DB 연결 
    dao.connection();
    
    // 수신한 sid를 활용하여 name 및 국어, 영어, 수학 점수 얻어내기 
    MemberScoreDTO memberScore = dao.search(sid);
    name = memberScore.getName();
    nKor = memberScore.getKor();
    nEng = memberScore.getEng();
    nMat = memberScore.getMat();
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

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreUpdateForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">
<script type="text/javascript">

function memberScoreSubmit()
{
    var memberScoreForm = document.getElementById("memberScoreForm");
    
    var kor = document.getElementById("kor");
    var eng = document.getElementById("eng");
    var mat = document.getElementById("mat");
    
    var korMsg = document.getElementById("korMsg");
    var engMsg = document.getElementById("engMsg");
    var matMsg = document.getElementById("matMsg");
    
    korMsg.style.display="none";
    engMsg.style.display="none";
    matMsg.style.display="none";
    
    // 빈문자열, 숫자값아닐때, 0점 미만일 때, 100점 초과일 때
    if (kor.value == "" || isNaN(kor.value) || Number(kor.value) < 0 
        || Number(kor.value) > 100)
    {
        korMsg.style.display="inline";
        kor.focus();
        return;
    }
    
    if (eng.value== "" || isNaN(eng.value) || Number(eng.value) < 0 
        || Number(eng.value) > 100)
    {
        engMsg.style.display="inline";
        eng.focus();
        return;
    }
    
    if (mat.value== "" || isNaN(mat.value) || Number(mat.value) < 0 
        || Number(mat.value) > 100)
    {
        matMsg.style.display="inline";
        mat.focus();
        return;
    }
    
    memberScoreForm.submit();
}

function memberScoreReset()
{
    var memberScoreForm = document.getElementById("memberScoreForm");
    
    var korMsg = document.getElementById("korMsg");
    var engMsg = document.getElementById("engMsg");
    var matMsg = document.getElementById("matMsg");

    var kor = document.getElementById("kor");
    
    korMsg.style.display = "none";
    engMsg.style.display = "none";
    matMsg.style.display = "none";
    
    memberScoreForm.reset();
    kor.focus();
}

</script>
</head>
<body>


<div>
    <!-- 페이지 정체성 -->
    <h1>회원 <span style="color: blue;">성적</span> 관리 및 수정 페이지</h1>
    <hr>
</div>

<div>
    <!-- 기본 메뉴 구성(기능별 페이지 이동) -->
    <a href="MemberScoreList.jsp"><button type="button">회원 성적 관리</button></a>
</div>
<br>

<div>
    <!-- 회원 성적 데이터 수정 폼 구성 -->
    <form action="MemberScoreUpdate.jsp?" method="post" id="memberScoreForm">
    <%-- <form action="MemberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberScoreForm"> --%>
        <table class="table">
            <tr>
                <th>번호</th>
                <!-- <td>100</td> -->
                <td><%=sid %></td>
                <td></td>
            </tr>
            <tr>
                <th>이름</th>
                <!-- <td>강감찬</td> -->
                <td><%=name %></td>
                <td></td>
            </tr>
            <tr>
                <th>국어점수</th>
                <td>
                    <input type='text' id='kor' name='kor' class='txtScore' value="<%=nKor%>">
                </td>
                <td>
                    <span class='errMsg' id='korMsg'>0 ~ 100 사이의 국어점수를 입력해야 합니다.</span>
                </td>
            </tr>
            <tr>
                <th>영어점수</th>
                <td>
                    <input type='text' id='eng' name='eng' class='txtScore' value="<%=nEng%>">
                </td>
                <td>
                    <span class='errMsg' id='engMsg'>0 ~ 100 사이의 영어점수를 입력해야 합니다.</span>
                </td>
            </tr>
            <tr>
                <th>수학점수</th>
                <td>
                    <input type='text' id='mat' name='mat' class='txtScore' value="<%=nMat%>">
                </td>
                <td>
                    <span class='errMsg' id='matMsg'>0 ~ 100 사이의 수학점수를 입력해야 합니다.</span>
                </td>
            </tr>
        </table>
        <br>
        <input type="hidden" name='sid' value='<%=sid %>'>
        
        <a href="javascript:memberScoreSubmit()"><button type="button">수정하기</button></a>
        <a href="javascript:memberScoreReset()"><button type="button">되돌리기</button></a>
        <a href="MemberScoreList.jsp"><button type="button">목록으로</button></a>

        
    </form>
</div>

</body>
</html>