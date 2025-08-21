<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="com.util.DBConn" %>

<%
// 1. Test002.jsp 빌드
// 2. 데이터베이스 액션 처리(연결, 조회)
// 3. Test002.jsp (리스트 처리)

// MemberInsert.jsp

// 한글 데이터 깨짐 방지 처리
request.setCharacterEncoding("UTF-8");

// 이전 페이지 (→ Test002.jsp ) 로부터 넘어온 데이터 수신
// --> userName, userTel

String userName = request.getParameter("userName");
String userTel = request.getParameter("userTel");

System.out.println(">> userName : " + userName);
System.out.println(">> userTel : " + userTel);

// 결과 변수
String retStr = "";
StringBuilder sb = new StringBuilder();
String strStatus = "";
Connection conn = null;
Statement stmt = null;
int result = 0;

try {
    
    // 데이터베이스 연결
    conn = DBConn.getConnection();
    if (conn != null) {
        strStatus = "데이터베이스 연결 성공!!";
        
        // 쿼리문 준비(-> select)
        String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBER_SEQ.NEXTVAL, '%s', '%s')", userName, userTel);
        
        // 작업 객체 생성 및 준비된 쿼리문 수행
        stmt = conn.createStatement();
        // 
        result = stmt.executeUpdate(sql);
        stmt.close();
        DBConn.close();
    }
   
} catch(Exception e) {
    strStatus += e.toString();
    System.out.println(e.toString());
} 


if (result < 1) {
    response.sendRedirect("ErrorTest002.jsp");
} else {
    response.sendRedirect("Test002.jsp");
    
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
    .btn {
        width: 100%;
        height: 40px;
    }

    .errMsg {
        font-size: small;
        color: red;
        display: none;
    }

    #numTitle {
        width: 50px;
    }

    #nameTitle {
        width: 100px;

    }

    #telTitle {
        width: 160px;

    }

    .list {
        text-align: center;
    }

</style>
<script type="text/javascript">
    function formCheck() {
        <%-- return false; --%>
        var userName = document.getElementById("userName");
        var nameMsg = document.getElementById("nameMsg");

        if (userName == "") {
            nameMsg.style.display = "inline";
            return false;
        }
    }
</script>
</head>
<body>
    <div>
        <h1>데이터베이스 연결 및 데이터 처리</h1>
        <hr>
    </div>

    <%-- 데이터 입력 --%>
    <div>
        <form action="MemberInsert.jsp" method="post" onsubmit="return formCheck();">
            <table>
                <tr>
                    <th>이름(*)</th>
                    <td><input type="text" id="userName" class="txt"></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="tel" id="userTel" class="txt">
                        <span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <button type="submit" id="btnAdd" class="btn">데이터 추가</button>
                    </td>
                </tr>
            </table>
        </form>
        
        
    </div>
    <br>

    <%-- 처리 결과 확인 --%>
<!--     <table class="table"> -->
<!--         <tr> -->
<!--             <th id="numTitle">번호</th> -->
<!--             <th id="nameTitle">이름</th> -->
<!--             <th id="telTitle">전화번호</th> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td id="numTitle">100</td> -->
<!--             <td id="nameTitle">홍길동</td> -->
<!--             <td id="telTitle">010-1111-1111</td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td id="numTitle">101</td> -->
<!--             <td id="nameTitle">김한국</td> -->
<!--             <td id="telTitle">010-2222-2222</td> -->
<!--         </tr> -->
<!--     </table> -->
        <%=sb.toString() %>
    
    <br>
    <hr>
</body>
</html>