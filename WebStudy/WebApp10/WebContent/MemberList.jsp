<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.test.MemberDAO" %>
<%@ page import="com.test.MemberDTO" %>
<%@ page import="com.util.DBConn" %>
<%

StringBuffer str = new StringBuffer();
//MemberDAO dao = new MemberDAO();
MemberDAO dao = null;

String memberCount = "";

try {
    dao = new MemberDAO();
    
    memberCount += "<span id='memberCount'>전체 인원 수 : ";
    memberCount +=  dao.count() + " 명</span>";
    
    str.append("<table class='table'>");
    str.append("    <tr>");
    str.append("        <th>번호</th>");
    str.append("        <th>이름</th>");
    str.append("        <th>전화번호</th>");
    str.append("    </tr>");
    
    // MemberDAO 객체의 list() 메서드 호출
    //-- 반복문 구성을 통해 <table> 하위 엘리먼트 생성
    for (MemberDTO member: dao.list()) {
        str.append("<tr>");
        str.append("<td class='record'>" + member.getSid()  + "</td>");
        str.append("<td class='record'>" + member.getName() + "</td>");
        str.append("<td class='record'>" + member.getTel()  + "</td>");
        str.append("</tr>");
    }
    
    str.append("</table>");
    
} catch (Exception e) {
    System.out.println(e.toString());
} finally {
    try {
        // 데이터베이스 연결 종료
        DBConn.close();
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
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
/* 단위는 비율(%), em 단위로 사용 권장 */
    th .record {
        text-align: center;
    }

    input {
        width: 200px;
        border-radius: 6px;
    }

    button {
        width: 400px;
        height: 40px;
        font-family: 맑은 고딕;
        font-weight: bold;
    }

    .errMsg {
        font-size: small;
        color: red;
        display: none;
    }
    
    .inputTh {
        width: 180px;
    }

</style>
<script type="text/javascript">

function formCheck() {
    // return false;
    // return true;
    var userName = document.getElementById("userName");
    var nemeMsg = document.getElementById("nemeMsg");
    
    console.log("userName : " + userName);

    nemeMsg.style.display = "none";
//     if (userName== null || userName.value == "") {
    if (userName.value == "") {
        nemeMsg.style.display = "inline";
        userName.focus();
        return false;
    }

    return true;
}

</script>
</head>
<body>
    <div>
        <h1>데이터베이스 연동 회원관리 실습</h1>
        <p>DAO, DTO 개념 적용</p>
        <hr>
    </div>


    <div>
        <form action="MemberInsert.jsp" method="post" onsubmit="return formCheck();">
            <table>
                <tr>
                    <th class="inputTh">이름(*)</th>
                    <td>
                        <input type="text" id="userName" name="userName" class="txt">
                    </td>
                    <td>
                        <span class="errMsg" id="nemeMsg">이름을 입력해야 합니다.</span>
                    </td>
                </tr>
                <tr>
                    <th class="inputTh">전화번호</th>
                    <td>
                        <input type="tel" id="userTel" name="userTel" class="txt">
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="btn" id="btnAdd">회원 추가</button>
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
    <br><br>

    <div>
<!--         <span id="memberCount">전체 인원 수 : 1명</span> -->
<!--         <table class="table"> -->
<!--             <tr> -->
<!--                 <th>번호</th> -->
<!--                 <th>이름</th> -->
<!--                 <th>전화번호</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--                 <td class="record">1</td> -->
<!--                 <td class="record">홍길동</td> -->
<!--                 <td class="record">010-111-1111</td> -->
<!--             </tr> -->
<!--         </table>     -->

        <!-- 전체 인원 수 확인 -->
        <%=memberCount %>

        <!-- 번호, 이름, 전화번호 항목에 대한 리스트 구성 -->
        <%=str.toString() %>
    </div>


</body>
</html>