<%@ page contentType="text/html; charset=UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

String userName = request.getParameter("userName");
String userTel = request.getParameter("userTel");

request.getSession().setAttribute("userName", userName);
request.getSession().setAttribute("userTel", userTel);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">
<script type="text/javascript">

function checkAndLogin() {
    var loginForm = document.loginForm;
    var msgId = document.getElementById("msgId");
    var msgPwd = document.getElementById("msgPwd");
    
    msgId.style.display = "none";
    msgPwd.style.display = "none";
    
    var retFlag = true;
    
    if (loginForm.userId.value == "") {
        msgId.style.display = "inline";
        loginForm.userId.focus();
        retFlag = false;
    } else {
        msgId.style.display = "none";
    }
    
    if (loginForm.userPwd.value == "") {
        msgPwd.style.display = "inline";
        loginForm.userPwd.focus();
        retFlag = false;
    } else {
        msgPwd.style.display = "none";
    }
    
    if (retFlag) {
           loginForm.submit();
    } else {
        return false;
    }
    
}
</script>
</head>
<body>

<!-- 
    TestSession01.jsp 에서 TestSession02.jsp 로
    이름과 전화번호를 입력받아 전송
    
    TestSession02.jsp 에서 TestSession03.jsp 로
    아이디와 패스워드를 입력받고
    앞에서 전달받은 이름과 전화번호를 함께 전송
    
    TestSession03.jsp 에서 
    전달받은 이름, 전화번호 , 아이디, 패스워드 출력
    
    01 ─────────> 02 ─────────> 03
    이름, 전화번호         아이디, 패스워드       이름, 전화번호, 아이디, 패스워드
    입력                   입력                   출력
                           - getParameter         - getAttribute

※ 즉, 01 에서 02 로 넘겨받을 땐 getParameter
   02 에서 03 으로 넘겨받을 땐 getParameter 과 getAttribute 로 세션 활용
   01 에서 03 으로 직접 넘겨줄 수 없기 때문에 세션(session)에 저장
   
※ session 외에 input태그 type의 hidden 속성을 이용한 정보 전달 가능

 -->

 <div>
    <form action="TestSession03ex.jsp" method="post" name="loginForm">
        <table>
            <tr>
                <th>아이디</th>
                <td>
                   <input type="text" name="userId" class="txt">
                </td>
                <td>
                   <span id="msgId" class="errMsg">ID를 입력해 주세요.</span>
                </td>
            </tr>
            <tr>
                <th>패스워드</th>
                <td>
                   <input type="password" name="userPwd" class="txt">
                </td>
               <td>
                   <span id="msgPwd" class="errMsg">패스워드를 입력해 주세요.</span>
                </td>
            </tr>
            <tr style="heigth: 40px;"></tr>
            <tr>
                <td colspan="2" style="width: 120px; text-align: center;">
                   <a href="javascript:checkAndLogin()"><button type="button" class="btn"  style="width: 250px;">입력</button>
                   </a>
                </td>
                <td></td>
            </tr>
        </table>
        <input type="hidden" name="userName" value="userName">
        <input type="hidden" name="userTel" value="userTel">
    </form>
 </div>
 
</body>
</html>