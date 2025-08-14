<%@ page contentType="text/html; charset=UTF-8"%>
<%

// 이전 페이지(Send01.html)로 부터 넘어온 데이터 수신
// → userName, kor, eng, mat

// 한글 수신을 위한 인코딩 방식 지정
request.setCharacterEncoding("UTF-8");
//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음
//   그러므로 기본 설정은 UTF-8로 구성하는 것이 좋음
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//   처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글이 깨지지 않음.
//   또한 지금 하고 있는 이 처리는... 데이터를 수신해서 사용하는 처리보다
//   먼저 수행되어야 한글이 깨지지 않은 상태로 사용할 수 있음)
      
String userName = request.getParameter("userName");
String kor  = request.getParameter("kor");
String eng  = request.getParameter("eng");
String mat  = request.getParameter("mat");

int nKor = 0, nEng = 0, nMat = 0, nTot = 0;
double dAvg =0.0;

try {
	nKor = Integer.parseInt(kor);
	nKor = Integer.parseInt(kor);
	nEng = Integer.parseInt(eng);
	nMat = Integer.parseInt(mat);
	nTot = nKor+nEng+nMat;
	dAvg = nTot/3.0;
} catch(Exception e) {
	System.out.println(e.toString());
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
    <h1>데이터 송수신 실습 02</h1>
    <hr>
</div>

<!--  
        『김한국님, 성적 처리가 완료되었습니다.
            회원님의 점수는 국어:90 점, 영어:80점, 수학:70점 입니다.
            총점은 240점, 평균은 80.0 입니다.』
-->
<div>
    <span style="color:blue;font-weight:bold;"><%=userName %></span>님, 성적 처리가 완료되었습니다.<br>
    회원님의 점수는 <span style="color:blue;font-weight:bold;">국어:<%=kor %></span>점, <span style="color:blue;font-weight:bold;">영어:<%=eng %></span>점, <span style="color:blue;font-weight:bold;">수학:<%=mat %></span>점 입니다.<br>
    총점은 <%=nTot %>점, 평균은 <%=dAvg %> 입니다.
</div>

</body>
</html>