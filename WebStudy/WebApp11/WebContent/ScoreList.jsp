<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.util.DBConn"%>
<%@ page import="com.test.ScoreDAO"%>
<%@ page import="com.test.ScoreDTO"%>
<%

ScoreDAO dao = new ScoreDAO();
StringBuilder sb = new StringBuilder();

try {
    ArrayList<ScoreDTO> scoreList = dao.listScore();

    sb.append("<table class='table'>");
    sb.append("    <tr>");
    sb.append("        <th>번호</th>");
    sb.append("        <th>이름</th>");
    sb.append("        <th>국어점수</th>");
    sb.append("        <th>영어점수</th>");
    sb.append("        <th>수학점수</th>");
    sb.append("        <th>총점</th>");
    sb.append("        <th>평균</th>");
    sb.append("    </tr>");

    for (ScoreDTO score : scoreList) {
        sb.append("    <tr>");
        sb.append("        <td>" + score.getSid() + "</td>");
        sb.append("        <td>" + score.getName() + "</td>");
        sb.append("        <td>" + score.getKor() + "</td>");
        sb.append("        <td>" + score.getEng() + "</td>");
        sb.append("        <td>" + score.getMat() + "</td>");
        sb.append("        <td>" + score.getTot() + "</td>");
        sb.append("        <td>" + score.getAvg() + "</td>");
        sb.append("    </tr>");
    }

    sb.append("</table>");
} catch (Exception e) {
    System.out.println(e.toString());
} finally {
    try {
        // 데이터베이스 연결 종료
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
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
    .msg {
        padding: 1em;
        font-size: small;
        color: red;
        display: none;
    }
    
    table {
        width: 80%;
    }

    table th {
        background-color: #d8cacaff
    }
    
</style>
<script type="text/javascript">
    function checkInput()
    {
        var retFlag = true;
        var name = document.getElementById("name").value;
        var kor = document.getElementById("kor").value;
        var eng = document.getElementById("eng").value;
        var mat = document.getElementById("mat").value;
        
        var msg = document.getElementsByClassName("msg");
        var msgName = document.getElementById("msgName");
        var msgKor = document.getElementById("msgKor");
        var msgEng = document.getElementById("msgEng");
        var msgMat = document.getElementById("msgMat");
        
        console.log(">>name : " + name);
        console.log(">>kor : " + kor);
        console.log(">>eng : " + eng);
        console.log(">>mat : " + mat);
        
        // 초기화
//          msg.style.display = false;

        if (name == "") {
            msgName.style.display = "inline";
            retFlag = false;
        } else {
            msgName.style.display = "none";
        }
        
        if (kor == "") {
            msgKor.style.display = "inline";
            retFlag = false;
        } else {
            msgKor.style.display = "none";
        }

        if (eng == "") {
            msgEng.style.display = "inline";
            retFlag = false;
        } else {
            msgEng.style.display = "none";
        }

        if (mat == "") {
            msgMat.style.display = "inline";
            retFlag = false;
        } else {
            msgMat.style.display = "none";
        }
        
        
        return retFlag;
    }
</script>
</head>
<body>

<!--

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
            http://localhost:3306/WebApp11/ScoreList.jsp 로 한다.
            
        ○ 물리적 파일 구성
            - WebApp11_scott.sql
            - com.test.ScoreDTO.java
            - com.test.ScoreDAO.java
            - ScoreList.jsp 
            - ScoreInsert.jsp
            - com.util.DBConn.java
 -->
 
    <%-- 성적 입력 --%>
    <div>
        <form action="ScoreInsert.jsp" method="post" id="form" onsubmit="return checkInput();">
            <table class="table">
                <tr>
                    <th>이름(*)</th>
                    <td><input type="text" id="name" name="name" class="txt"></td>
                    <td><span id="msgName" class="msg">이름 입력 확인</span></td>
                </tr>
                <tr>
                    <th>국어점수</th>
                    <td><input type="text"  id="kor" name="kor" class="txt"></td>
                    <td><span id="msgKor" class="msg">0 ~ 100 사이의 정수가 입력되었는지 확인</span></td>
                </tr>
                <tr>
                    <th>영어점수</th>
                    <td><input type="text" id="eng" name="eng" class="txt"></td>
                    <td><span id="msgEng" class="msg">0 ~ 100 사이의 정수가 입력되었는지 확인</span></td>
                </tr>
                <tr>
                    <th>수학점수</th>
                    <td><input type="text" id="mat" name="mat" class="txt"></td>
                    <td><span id="msgMat" class="msg"> 0 ~ 100 사이의 정수가 입력되었는지 확인</span></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">성적 데이터 추가</button>
                        <button type="reset">리셋</button>
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
    <hr>
    <br>

    <div>
<!--         <table class="table"> -->
<!--             <tr> -->
<!--                 <th>번호</th> -->
<!--                 <th>이름</th> -->
<!--                 <th>국어점수</th> -->
<!--                 <th>영어점수</th> -->
<!--                 <th>수학점수</th> -->
<!--                 <th>총점</th> -->
<!--                 <th>평균</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--                 <td>1</td> -->
<!--                 <td>홍길동</td> -->
<!--                 <td>90</td> -->
<!--                 <td>89</td> -->
<!--                 <td>67</td> -->
<!--                 <td>246</td> -->
<!--                 <td>82.0</td> -->
<!--             </tr> -->
<!--         </table> -->
    <%=sb.toString() %>
    </div>
 

</body>
</html>