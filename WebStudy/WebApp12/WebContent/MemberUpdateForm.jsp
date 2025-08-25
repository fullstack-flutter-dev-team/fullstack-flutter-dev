<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

// 이전 페이지(→ MemberList.jsp)로부터 넘어온 데이터 수신
// → sid

// -※ 수신한 sid를 활용하여 회원 데이터 조회
//      이를 통해 얻어낸 데이터를 가지고 폼의 내용을 구성
String sid = request.getParameter("sid");
String name = "";
String tel  = "";

MemberDAO dao = new MemberDAO();

try
{
    // 데이터베이스 연결
    dao.connection();
    
    MemberDTO member = dao.serarchMember(sid);
    name = member.getName();
    tel = member.getTel();
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


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">
<script type="text/javascript">
function memberSubmit() {
    var memberForm = document.getElementById("memberForm");
    
    var uName = document.getElementById("uName");
    var nameMsg = document.getElementById("nameMsg");

    nameMsg.style.display = "none";

    if (uName.value == "") {
        nameMsg.style.display = "inline";
        uName.focus();
        return; //-- memberSubmit() 메서드 종료
    }

    // form을 지정해서 submit 액션 수행
    memberForm.submit();
}

function memberReset()
{
    // 확인
    //alert("함수 호출~!!!");
    
    var memberForm = document.getElementById("memberForm");
    
    var uName = document.getElementById("uName");
    var nameMsg = document.getElementById("nameMsg");
    
    nameMsg.style.display = "none";
    
    // form 을 직접 지정하여 reset 액션 수행
    memberForm.reset();
    
    // 이름 입력란 포커스
    uName.focus();
}

</script>
</head>
<body>

<div>
    <!-- 페이지 정체성 -->
    <h1>회원 <span style="color: red;">명단</span> 관리
        및 <span style="color: blue;">변경</span> 페이지</h1>
    <hr>
</div>
<br>

<div>
    <!-- 회원 데이터 변경 폼 구성 -->
<!--     <form action="MemberUpdate.jsp" method="post" id="memberForm"> -->
    <form action="MemberUpdate.jsp" method="post" id="memberForm">
        <table class="table">
<%--             
            <tr>
                <th>
                    <input type="text" id="sid" name="sid" value="<%=sid%>" disabled="disabled">
                </th>
            </tr> 
--%>
            <tr>
                <th>이름(*)</th>
                <td>
                    <input type="text" id="uName" name="uName" value='<%=name%>'>
                </td>
                <td>
                    <span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
                </td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>
                    <input type="text" id="uTel" name="uTel" value='<%=tel%>'>
                </td>
                <td></td>
            </tr>
        </table>
        <br>
        <a href="javascript:memberSubmit()"><button type="button">수정하기</button></a>
        <a href="javascript:memberReset()"><button type="button">취소하기</button></a>
        <a href="MemberList.jsp"><button type="button">목록으로</button></a>
        <input type="hidden" name="sid" value="<%=sid%>">
    </form>
</div>
</body>
</html>