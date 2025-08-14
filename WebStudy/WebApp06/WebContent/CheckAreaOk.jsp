<%@ page contentType="text/html; charset=UTF-8"%>
<% 
    // 스크립트릿 영역

    // ※ 이번에 수신하게 되는 내용을... 한글 데이터가 포함된 형태
    request.setCharacterEncoding("UTF-8"); //-- check~!!!

    // 이전 페이지(CheckArea.jsp)로부터 넘어온 데이터 수신
    //  → name, memo, checkGroup

    // 이름 데이터 수신
    String nameStr = request.getParameter("name");     //-- 텍스트박스... 단일값 수신
    
    // check~!!!
    // memo
    // 메모 데이터 수신()
    String memoStr = request.getParameter("memo");     //-- textarea... 단일값 수신
    System.out.println("memo - before : " + memoStr);
    memoStr = memoStr.replaceAll("\n", "<br>");
    // JDK 1.5 이후부터 『replaceAll()』 메서드 사용 가능
    //  『replaceAll()』을 통해 처리한 결과(문자열)를 다시 memo 변수에 대입
	// "안녕하세요\n반갑습니다\n다음에 또만나요" → "안녕하세요<br>반갑습니다<br>다음에 또만나요"
    System.out.println("memo - after : " + memoStr);

    // 이상형 데이터 수신
	// ※ 같은 name 속성의 값을 가진 데이터 여러 개를 수신하는 경우
	//    (즉, 다중 데이터로 수신하는 경우)
	//    이를 베열로 처리해야 한다. → 『getParameterValues()』
    String[] starArr = request.getParameterValues("checkGroup"); //-- 선택상자... 다중값 수신 check~!!!
	
	// ※ 배열 데이터를 수신하여 처리할 경우...
	//    수신된 데이터가 존재하지 않을 경우는
	//    배열의 값 자체가 null 이 되어버리기 때문에
	//    null 에 대한 확인(점검) 과정이 필요하다.  //-- check~!!

    // 다중 선택이 가능한 선택상자일 경우..
    // getParameterValues() 로 데이터 수신 → 문자열 배열 반환

    // ----------------------------------
    // 수신한 데이터에 대한 처리

    // 이상형
    String starStr = "";
    // 배열에 대한 처리 check~!!!
    if (starArr != null) {
        for (String star : starArr) {
            starStr += "[" + star +"]";
        }
    }

    // 확인
    System.out.println("name : " + nameStr);
    for (String str : starArr) {
        System.out.println("str : " + str);
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckAreaOk.jsp</title>
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
        <h2>textarea, check 데이터 수신 결과 확인</h2>
        <div>
            <h3>이름 : <%=nameStr %></h3>
            <h3>메모</h3>
            <p><%=memoStr %></p>
            <h3>이상형 : <%=starStr %></h3>
        </div>
    
    </div>
</body>
</html>