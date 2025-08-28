<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

function chkForm() {
    var form = document.formFriend;
    
    var errMsg = document.querySelector(".errMsg");
    errMsg.style.display = "none";
    
    if (form.name.value == "") {
        alert("이름을 입력해 주세요.");
        errMsg.style.display = "inline";
        form.name.focus();
        return;
    } else {
        errMsg.style.display = "none";
    }
    
    console.log(">>name : " + form.name.value);
    
    form.submit();
    
}

</script>
</head>
<body>

<!-- 
    ○ 물리적 파일 구성
       - Friend.jsp
           → - 이름(text, *)
              - 나이(text)
              - 성별(radio, 남/여)
              - 이상형(check, 박보영/손흥민/천우희/권지용/카리나/아이유/정국/성시경)
       - Friend_ok.jsp
           → 데이터 수신 → 객체 생성 → 결과화면 구성
       
       - com.text.FriendDTO
           → Java Bean
 -->


<div>
    <form action="Friend_ok.jsp" method="post" name="myForm">
        <table class="table">
            <tr>
                <th>이름(*)</th>
                <td>
                    <input type="text" name="name" class="txt">
<!--                     <input type="text" name="userName" class="txt"> -->
                </td>
                <td><span id="msgName" class="errMsg">이름 입력은 필수입니다.</span></td>
            </tr>
            <tr>
                <th>나이</th>
                <td>
                    <input type="text" name="age" class="txt">
                </td>
                <td><span id="msgAge" class="errMsg">나이를 입력해 주세요.</span></td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <label><input type="radio" name="gender" id="male" value="남" checked="checked">남</label>
                    <label><input type="radio" name="gender" id="female" value="여">여</label>
                </td>
                <td><span id="msgAge" class="errMsg">성별을 선택해 주세요.</span></td>
            </tr>
            <tr>
                <th>이상형</th>
                <td>
                    <label><input type="checkbox" name="idealType" value="박보영">박보영</label>
                    <label><input type="checkbox" name="idealType" value="손흥민">손흥민</label>
                    <label><input type="checkbox" name="idealType" value="천우희">천우희</label>
                    <label><input type="checkbox" name="idealType" value="권지용">권지용</label>
                    <label><input type="checkbox" name="idealType" value="카리나">카리나</label>
                    <label><input type="checkbox" name="idealType" value="아이유">아이유</label>
                    <label><input type="checkbox" name="idealType" value="정국">정국</label>
                    <label><input type="checkbox" name="idealType" value="성시경">성시경</label>
                </td>
                <td><span id="msgAge" class="errMsg">이상형을 선택해 주세요.</span></td>
            </tr>
            <tr>
                <td colspan="2" >
                     <button type="button" onclick="chkForm();" class="btn" style="width: 100%;">등록하기</button>
                </td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>