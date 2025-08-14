<%@ page contentType="text/html; charset=UTF-8"%>
<% 
    // 스크립트릿 영역

    // ※ 이번에 수신하게 되는 내용을... 한글 데이터가 포함된 형태
    request.setCharacterEncoding("UTF-8"); //-- check~!!!

    // 이전 페이지(RadioSelect.jsp)로부터 넘어온 데이터 수신
    //  → name, gender, major, hobby
    String nameStr = request.getParameter("name");     //-- 텍스트박스... 단일값 수신
    String memoStr = request.getParameter("memo"); //-- 라디오버튼... 단일값 수신
    String[] starArr = request.getParameterValues("checkGroup"); //-- 선택상자... 다중값 수신 check~!!!
    // 다중 선택이 가능한 선택상자일 경우..
    // getParameterValues() 로 데이터 수신 → 문자열 배열 반환

    // 수신한 데이터에 대한 처리

    // name → 특이사항 없음~!!

    memoStr = memoStr.replaceAll("\n", "<br>");

 

    // memo → 특이사항 없음~!!

    // hobby
    String starStr = "";
    // 배열에 대한 처리 check~!!!
    if (starArr != null) {
        for (String star : starArr) {
            starStr += "[" + star +"]";
        }
    } 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <p>CheckArea.jsp → <span>CheckAreaOk.jsp</span></p>
        <hr>
    </div>

    <div>
        <h3>이름 : <%=nameStr %></h3>
        <h3>메모</h3>
        <p><%=memoStr %></p>
        <h3>이상형 : <%=starStr %></h3>
    </div>
</body>
</html>