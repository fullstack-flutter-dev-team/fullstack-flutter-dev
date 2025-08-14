<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckArea.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
    span {
        color: red;
        font-weight:bold;
    }
</style>
</head>
<body>
    <div>
        <h1>JSP를 이용한 데이터 송수신 실습</h1>
        <p><span>CheckArea.jsp</span> → CheckAreaOk.jsp</p>
        <hr>
    </div>

    <div>
        <h2>textarea, check 데이터 전송</h2>

        <form action="/WebApp05/CheckAreaOk.jsp" method="post">
        <%-- <form action="CheckAreaOk.jsp" method="post"> --%>
            이름
            <input type="text" class="txt" name="name">
            <br><br>

             메모<br>
             <textarea rows="5" cols="30" name="memo"></textarea>
            <br><br>

            이상형<br>
            <label><input type="checkbox" name="checkGroup" value="박보영">박보영</label>
            <label><input type="checkbox" name="checkGroup" value="손흥민">손흥민</label>
            <label><input type="checkbox" name="checkGroup" value="천우희">천우희</label>
            <label><input type="checkbox" name="checkGroup" value="권지용">권지용</label>
            <br>
            <label><input type="checkbox" name="checkGroup" value="아이유">아이유</label>
            <label><input type="checkbox" name="checkGroup" value="김남길">김남길</label>
            <label><input type="checkbox" name="checkGroup" value="카리나">카리나</label>
            <label><input type="checkbox" name="checkGroup" value="손석구">손석구</label>
            <br><br>

            <input type="submit" value="전송하기" class="btn control" style="width: 200px;">
        
        </form>
    </div>
</body>
</html>