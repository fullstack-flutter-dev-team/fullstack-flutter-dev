<%@ page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">
<script type="text/javascript">
function checkInput() {
    console.log(">>> checkInput");
    var form = document.inputForm;
    var msgName = document.getElementById("msgName");
    var msgTel = document.getElementById("msgTel");
    
    msgName.style.display = "none";
    msgTel.style.display = "none";
    var retFlag = true;
    
    if (form.userName.value == "") {
        msgName.style.display = "inline";
        retFlag  = false;
    } else {
        msgName.style.display = "none";
    }
    
    if (form.userTel.value == "") {
        msgTel.style.display = "inline";
        retFlag  = false;
    } else {
        msgTel.style.display = "none";
    }
    
     if (retFlag) {
        form.submit();
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
     <form action="TestSession02ex.jsp" method="post" name="inputForm">
         <table>
             <tr>
                 <th>이름</th>
                 <td>
                    <input type="text" name="userName" class="txt">
                 </td>
                 <td>
                    <span id="msgName" class="errMsg">이름을 입력해 주세요.</span>
                 </td>
             </tr>
             <tr>
                 <th>전화번호</th>
                 <td>
                    <input type="tel" name="userTel" class="txt">
                 </td>
               <td>
                   <span id="msgTel" class="errMsg">전화번호 입력해 주세요.</span>
                </td>
             </tr>
             <tr style="heigth: 40px;"></tr>
             <tr>
                 <td colspan="2" style="width: 120px; text-align: center;">
                    <a href="javascript:checkInput()"><button type="button" class="btn"  style="width: 250px;">입력</button>
                    </a>
                 </td>
                 <td></td>
             </tr>
         </table>
     </form>
 </div>

</body>
</html>