<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="com.util.DBConn" %>

<%
// 1. Test002.jsp 빌드
// 2. 데이터베이스 액션 처리(연결, 조회)
// 3. Test002.jsp (리스트 처리)

// 결과 변수
String retStr = "";
StringBuilder sb = new StringBuilder();
String strStatus = "";
try {
    // 데이터베이스 연결
    Connection conn = DBConn.getConnection();
    if (conn != null) {
        strStatus = "데이터베이스 연결 성공!!";
        
        // 쿼리문 준비(-> select)
        String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
        
        // 작업 객체 생성 및 준비된 쿼리문 수행
        Statement stmt = conn.createStatement();
        
        // 
        ResultSet rs = stmt.executeQuery(sql);
        
        // 결과 ResultSet 에 대한 처리 → 반복문 구성
        sb.append("<table class='table'>");
        sb.append("    <tr>");
        sb.append("        <th id='numTitle'>번호</th>");
        sb.append("        <th id='nameTitle'>이름</th>");
        sb.append("        <th id='telTitle'>전화번호</th>");
        sb.append("    </tr>");
        while (rs.next()) {
            sb.append("<tr>");
            sb.append("     <td id='numTitle'>" + rs.getString("SID") + "</td>");
            sb.append("     <td id='nameTitle'>" + rs.getString("NAME") + "</td>");
            sb.append("     <td id='telTitle'>" + rs.getString("TEL") + "</td>");
            sb.append("</tr>");
        }
        
        sb.append("</table>");
        
        rs.close();
        stmt.close();
        DBConn.close();
    } else {
        strStatus = "데이터베이스 연결 실패!!";
    }
} catch (Exception e) {
    strStatus += e.toString();
    System.out.println(e.toString());
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
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
        var userName = document.getElementById("userName").value;
        var nameMsg = document.getElementById("nameMsg");

        if (userName==null || userName == "") {
            nameMsg.style.display = "inline";
            return false;
        } else {
            return true;
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
                    <td>
                        <input type="text" id="userName"  name="userName" class="txt">
                        <span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="tel" id="userTel" name="userTel" class="txt">
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