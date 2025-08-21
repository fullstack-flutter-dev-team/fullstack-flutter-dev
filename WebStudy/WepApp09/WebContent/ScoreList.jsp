<%@ page contentType="text/html; charset=UTF-8"%>
<%@page  import= "java.sql.Connection"%>
<%@page  import= "java.sql.Statement"%>
<%@page  import= "java.sql.ResultSet"%>
<%@page import= "com.util.DBConn" %>
<%

StringBuilder sb = new StringBuilder();
StringBuilder sbList = new StringBuilder();
String strStatus = "";
int idx = 0;
String[] arrBgColor = {"#f5faf0ff", "#f9f5faff"};

try {
    // DB connection
    Connection conn = DBConn.getConnection();
    
    if (conn != null) {
        sb.append("SELECT SID, NAME, KOR, ENG, MAT");
        sb.append(", (KOR+ENG+MAT) AS TOT, ROUND((KOR+ENG+MAT)/3, 1) AS AVG ");
        sb.append(" FROM TBL_SCORE");
        sb.append(" ORDER BY SID");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sb.toString());
        
        // 점수 리스트 테이블 생성
        sbList.append("<table class='table' style='width: 75%;' border=1>");
        sbList.append("    <tr>");
        sbList.append("        <th style='width: 10%;text-align: center'>번호</th>");
        sbList.append("        <th style='width: 10%;text-align: center'>이름</th>");
        sbList.append("        <th style='width: 15%;text-align: center'>국어점수</th>");
        sbList.append("        <th style='width: 15%;text-align: center'>영어점수</th>");
        sbList.append("        <th style='width: 15%;text-align: center'>수학점수</th>");
        sbList.append("        <th style='width: 10%;text-align: center'>총점</th>");
        sbList.append("        <th style='width: 10%;text-align: center'>평균</th>");
        sbList.append("    </tr>");
        while (rs.next()) {
            sbList.append("    <tr style='background-color: "+  arrBgColor[idx%2] +"'>");
            sbList.append("        <td style='width: 10%;'>"+ rs.getString(1) +"</td>");
            sbList.append("        <td style='width: 10%;'>"+ rs.getString(2) +"</td>");
            sbList.append("        <td style='width: 15%;'>"+ rs.getString(3) +"</td>");
            sbList.append("        <td style='width: 15%;'>"+ rs.getString(4) +"</td>");
            sbList.append("        <td style='width: 15%;'>"+ rs.getString(5) +"</td>");
            sbList.append("        <td style='width: 10%;'>"+ rs.getString(6)  +"</td>");
            sbList.append("        <td style='width: 10%;'>"+ rs.getFloat(7)  +"</td>");
            sbList.append("    </tr>"); 
            idx++;
        }
        
        sbList.append("</table>");
    }
    
} catch (Exception e) {
    
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
    .msg {
        color: red;
        font-size: small;
        display: none;
    }
    
    .btn {
        width: 100%;
    }
    
    .table > th {
        text-align: center;
    }
    
    td {
        text-align: center;
    }
    
    span {
        padding-left: 10px;
    }
    
</style>
<script type="text/javascript">
function checkInput(){
    var retFlag = true;
    var name = document.getElementById("name").value;
    var msgName = document.getElementById("msgName");
    var kor = document.getElementById("kor").value;
    var msgKor = document.getElementById("msgKor");
    var eng = document.getElementById("eng").value;
    var msgEng = document.getElementById("msgEng");
    var mat = document.getElementById("mat").value;
    var msgMat = document.getElementById("msgMat");
    
    if (name =="") {
        msgName.style.display ="inline";
        retFlag = false;
    } else {
        msgName.style.display ="none";
    }
    if (kor == "" || parseInt(kor) < 0 || parseInt(kor) > 100) {
        msgKor.style.display ="inline";
        retFlag = false;
    } else {
        msgKor.style.display ="none";
    }
    if (eng == "" ||  parseInt(eng) < 0 || parseInt(eng) > 100) {
        msgEng.style.display ="inline";
        retFlag = false;
    } else {
        msgEng.style.display ="none";
    }
    if (mat == "" ||  parseInt(mat) < 0 || parseInt(mat) > 100) {
        msgMat.style.display ="inline";
        retFlag = false;
    } else {
        msgMat.style.display ="none";
    }
    
    return retFlag;
    
}

</script>
</head>
<body>


<%-- 

        -------------------------------------------------------------

        이름(*)  [textbox ]      -> 이름 입력 확인
        국어점수 [textbox ]      -> 0 ~ 100 사이의 정수가 입력되었는지 확인
        영어점수 [textbox ]      -> 0 ~ 100 사이의 정수가 입력되었는지 확인
        수학점수 [textbox ]      -> 0 ~ 100 사이의 정수가 입력되었는지 확인


        <성적 데이터 추가>  -> button
        
        번호    이름     국어점수  영어점수  수학점수   총점  평균
        1        홍길동    90            90      80     xxx   xx.x

        -------------------------------------------------------------

        - 사용자의 최초 요청 주소는
            http://localhost:3306/WebApp09/ScoreList.jsp 로 한다.
            
        ○ 물리적 파일 구성
            - WebApp09_scott.sql
            - ScoreList.jsp 
            - ScoreInsert.jsp
            - com.util.DBConn.java
 --%>

    <div>
        <form action="ScoreInsert.jsp" method="post" onsubmit="return checkInput();">
            <table>
                <tr>
                    <th>이름(*)</th>
                    <td>
                        <input type="text" id="name" name="name" class="txt">
                    </td>
                    <td>
                        <span id="msgName" class="msg">이름 입력 확인</span>
                    </td>
                </tr>
                <tr>
                    <th>국어점수</th>
                    <td>
                        <input type="text" id="kor" name="kor" class="txt">
                    </td>
                    <td>
                        <span id="msgKor" class="msg">0 ~ 100 사이의 정수가 입력되었는지 확인</span>
                    <td>
                </tr>
                <tr>
                    <th>영어점수</th>
                    <td>
                        <input type="text" id="eng" name="eng" class="txt">
                    </td>
                    <td>
                        <span id="msgEng" class="msg">0 ~ 100 사이의 정수가 입력되었는지 확인</span>
                    </td>
                </tr>
                <tr>
                    <th>수학점수</th>
                    <td>
                        <input type="text" id="mat" name="mat" class="txt">
                    </td>
                    <td>
                        <span id="msgMat" class="msg">0 ~ 100 사이의 정수가 입력되었는지 확인</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="btn">성적 데이터 추가</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <br>
    
    <!-- 점수 리스트 테이블 -->
    <%=sbList.toString() %>
    
    
</body>
</html>