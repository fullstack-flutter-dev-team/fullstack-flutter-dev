<%@ page contentType="text/html; charset=UTF-8"%>
<%

//
 

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
	
	if (name == null || name =="") {
		msgName.style.display ="inline";
		retFlag = false;
	} else {
		msgName.style.display ="none";
	}
	if (kor == null || kor =="") {
		msgKor.style.display ="inline";
		retFlag = false;
	} else {
		msgKor.style.display ="none";
	}
	if (eng == null || eng =="") {
		msgEng.style.display ="inline";
		retFlag = false;
	} else {
		msgEng.style.display ="none";
	}
	if (mat == null || mat =="") {
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
                        <span id="msgName" class="msg">이름 입력 확인</span>
                    </td>
                </tr>
                <tr>
                    <th>국어점수</th>
                    <td>
                        <input type="text" id="kor" name="kor" class="txt">
                        <span id="msgKor" class="msg">0 ~ 100 사이의 정수가 입력되었는지 확인</span>
                    </td>
                </tr>
                <tr>
                    <th>영어점수</th>
                    <td>
                        <input type="text" id="eng" name="eng" class="txt">
                        <span id="msgEng" class="msg">0 ~ 100 사이의 정수가 입력되었는지 확인</span>
                    </td>
                </tr>
                <tr>
                    <th>수학점수</th>
                    <td>
                        <input type="text" id="mat" name="mat" class="txt">
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
    
    
</body>
</html>