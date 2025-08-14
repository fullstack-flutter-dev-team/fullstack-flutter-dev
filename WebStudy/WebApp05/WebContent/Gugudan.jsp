<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
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
        <p><span>Gugudan.jsp</span> → GugudanOk.jsp</p>
        <hr>
    </div>
    <div>
        <form action="/WebApp05/GugudanOk.jsp" method="get">
            <table class="table">
                <tr>
                    <th>원하는 단 입력</th>
                    <td>
                        <input type="text" class="txt" name="dan">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="결과 확인" class="btn control" style="width: 100%;">
                    </td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>