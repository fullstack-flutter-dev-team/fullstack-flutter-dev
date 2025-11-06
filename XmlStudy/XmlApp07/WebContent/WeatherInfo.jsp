<%@page import="com.test.ForecastShortLandDAO"%>
<%@page import="com.test.ForecastShortLandDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.test.ForecastShortSummaryDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>

<%
    // 이전 페이지로(WeatherInfo.jsp)부터 전달받은 데이터
//-- stnId
String stnId = request.getParameter("stnId");

ForecastShortSummaryDAO dao ;

if (stnId == null) {
    stnId = "108"; //-- 전국 날씨 정보
}


// DAO 생성
dao = new ForecastShortSummaryDAO(stnId);

String tmFc = dao.getTmFc();
String wfSv1 = dao.getWfSv1();
String wn = dao.getWn();

System.out.println(">--->> tmFc : " + tmFc);
System.out.println(">--->> wfSv1 : " + wfSv1);
System.out.println(">--->> wn : " + wn);

System.out.println(">--->> stnId : " + stnId);
// ---------------------------------------- 기상 개황

//-- 육상 예보
    //----------------------------------------------
    // 육상    서울·인천·경기도      서울    11B10101
    // 육상    서울·인천·경기도      인천    11B20201
    // 육상    부산.울산.경상남도    부산    11H20201
    // 육상    대구.경상북도         대구    11H10701
    // 육상    광주.전라남도         광주    11F20501
    // 육상    전북자치도            전주    11F10201
    // 육상    대전.세종.충청남도    대전    11C20401
    // 육상    충청북도             청주    11C10301
    // 육상    강원도               철원    11D10101
    // 육상    제주도               제주    11G00201
    //----------------------------------------------

    String regId = "11B10101"; //-- 날씨 정보 전국(수도권)
    switch (Integer.parseInt(stnId)) {
        case 108: regId = "11B10101"; break;
        case 109: regId = "11B20201"; break;
        case 159: regId = "11H20201"; break;
        case 143: regId = "11H10701"; break;
        case 156: regId = "11F20501"; break;
        case 146: regId = "11F10201"; break;
        case 133: regId = "11C20401"; break;
        case 131: regId = "11C10301"; break;
        case 105: regId = "11D10101"; break;
        case 184: regId = "11G00201"; break;
    }

    StringBuffer sb = new StringBuffer();
    ForecastShortLandDAO dao2 = new ForecastShortLandDAO();

    // 날씨 시간별 정보
    ArrayList<ForecastShortLandDTO> timeList = dao2.shortLandList();

    sb.append("<table class='table'>");
    sb.append("<thead>");
    sb.append("<tr>");
    sb.append("<th>발표번호</th>");
    sb.append("<th>예보구역 코드</th>");
    sb.append("<th>강수확률</th>");
    sb.append("<th>강수형태</th>");
    sb.append("<th>시</th>");
    sb.append("<th>풍향</th>");
    sb.append("<th>날씨</th>");
    sb.append("<th>하늘상태</th>");
    sb.append("</tr>");
    sb.append("</thead>");
    
    sb.append("<tbody>");
    for (ForecastShortLandDTO w : timeList) {
        sb.append("<tr>");
        sb.append(String.format("<td>%s</td>", w.getNumEf()));                //-- 발표번호
        sb.append(String.format("<td>%s</td>", w.getRegId()));                //-- 예보구역코드
        sb.append(String.format("<td>%s%%</td>", w.getRnSt()));               //-- 강수확률
        sb.append(String.format("<td>%s</td>", w.getRnYn()));                 //-- 강수형태
        sb.append(String.format("<td>%s℃</td>", w.getTa()));                   //-- 예상기온
        sb.append(String.format("<td>%s</td>", w.getWd1()));                  //-- 풍향
        sb.append("<td>");
        sb.append(String.format("<img src='images/%s'/> %s", w.getImg(), w.getWf()));   //-- 날씨
        sb.append("</td>");
        sb.append("<td>");
        sb.append(String.format("<img src='images/%s.png'/>", w.getSkyImg()));//-- 하늘상태
        sb.append("</td>");
        sb.append("</tr>");
    }
    sb.append("</tbody>");
 
 sb.append("</table>");
//------------------------------------------ 육상 예보
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weathrer.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<!-- 기본 CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부트스트랩 부가 테마 CSS -->
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">
    $(function() {
        // 선택한 라디오 버트의 상태를
        // 사용자가 선택한 항목이 선택된 상태(checked)로 유지될 수 있도록 처리

        // 확인(테스트)
//         $(":radio:eq(3)").attr("checked", "checked");//-- 대구,경북

        // 확인(테스트)
//         $(":radio[value=131]").attr("checked", "checked");//-- 충청북도
        $(":radio[value=<%=stnId%>]").attr("checked", "checked");//-- 충청북도

    });

</script>
</head>
<body>

<div class="container">
    <h2>
    기상 예보<small>단기 예보</small>
    </h2>
    <hr>

    <div class="panel-group" role="group">
        <div class="panel panel-default" role="group">
            <div class="panel-heading">지역 선택</div>
            <div class="panel-body">
                <form action="" method="get" role="form">
                    <label><input type="radio" name="stnId" value="108">전국</label>
                    <label><input type="radio" name="stnId" value="109">서울·인천·경기도</label>
                    <label><input type="radio" name="stnId" value="159">부산.울산.경상남도</label>
                    <label><input type="radio" name="stnId" value="143">대구.경상북도</label>
                    <label><input type="radio" name="stnId" value="156">광주.전라남도</label>
                    <label><input type="radio" name="stnId" value="146">전북자치도</label>
                    <label><input type="radio" name="stnId" value="133">대전.세종.충청남도</label>
                    <label><input type="radio" name="stnId" value="131">충청북도</label>
                    <label><input type="radio" name="stnId" value="105">강원도</label>
                    <label><input type="radio" name="stnId" value="184">제주도</label>
                    <br>
                    <button type="submit" class="btn btn-default">날씨 조회</button>
                </form>
            </div>
            <br>
        </div>
        <div class="panel panel-default" role="group">
            <div class="panel-heading">기상 정보 출력</div>
                <div class="panel-body">
                    <p>
<!--                         <b>2025년 11월 05일 05:00 발표</b> -->
                        <b><%=tmFc %></b>
                    </p>
                    <p>
                        <span style="font-size: 10pt;">
                         <%=wfSv1 %>
                        </span>
                    </p>
                </div>
                <p>
                    <span style="font-size: 9pt; font-Weight: bold;">
                        <%=wn %>
                    </span>
                </p>
                <br>

                <%-- 
                <table class="table">
                    <thead>
                        <tr>
                            <th>발표번호</th>
                            <th>예보구역 코드</th>
                            <th>강수확률</th>
                            <th>강수형태</th>
                            <th>시</th>
                            <th>풍향</th>
                            <th>날씨</th>
                            <th>하늘상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>10</td>
                            <td>123</td>
                            <td>60%</td>
                            <td>비</td>
                            <td>10</td>
                            <td>NE</td>
                            <td><img src="images/DB08.png">흐리고비</td>
                            <td><img src="images/DB04.png">흐림</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>123</td>
                            <td>60%</td>
                            <td>비</td>
                            <td>10</td>
                            <td>NE</td>
                            <td><img src="images/DB08.png">흐리고비</td>
                            <td><img src="images/DB04.png">흐림</td>
                        </tr>
                    </tbody>
                </table> 
                --%>
                <%=sb.toString()%>
            </div>
        </div>
    </div>
</div>

</body>
</html>