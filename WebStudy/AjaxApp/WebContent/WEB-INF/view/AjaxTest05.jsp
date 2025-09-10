<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<%!
String COLOR_RED      = "\u001B[31m" ;
String COLOR_GREEN    = "\u001B[32m" ;
String COLOR_YELLOW   = "\u001B[33m" ;
String COLOR_BLUE     = "\u001B[34m" ;
%>

<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest05.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<style type="text/css">
    #search {
        width: 700px;
    }
    
    #list {
        border: 1px solid gray;
        width: 700px;
        
        position: absolute;
        left: 80px;
        
        display: none;
        margin-top: 2px;
        margin-left: 7px;
    }
    
    #list .item {
        padding: 3px;
    }
    
    #list #footer {
        height: 14px;
        background-color: #ddd;
        text-align: right;
        padding: 5px;
        font-size: small;
    }
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
    window.onload = function() {
        
        console.log(">>> onLoaded!!");

//         var wordDiv = document.querySelector(".item");
//         wordDiv.onmouseover  = function() {
//             console.log(">> word : ");
//         }
        
    }
    
    // 검색창에서 키보드 입력이 있을 때 마다...
    // 그 때 까지의 입력된 단어를 서버오 전송하고...
    // 전송된 단어에 적합한 추천 검색어를 받아올 수있도록 처리

    
    function search() {
        // 데이터 수집
        // (→ 검색어로 입력된 값 얻어오기)
        var search = document.getElementById("search").value;
        
        // 서버로 전송을 수행하기 전에 유효성 검사 ---------------


        // 1. 검색어가 존재할 경우에만 서버로 데이터를 전송할 수 있도록 처리
        if (search.replace(" ", "") == "") {
            document.getElementById("list").style.display = "none";
        }

        // 2. 한글 완성형 정규 표현식
        //   입력된 검색어가 완성형 한글일 경우에만 검색 키워드를 서버로 전송할 수 있도록 처리
        //   → 정규표현식 사용
        //   → /^[가-힇]+$/
        var regEx =  /^[가-힇]+$/;

        if (!regEx.test(search)) {
            return;
        }

        // ---------------------------- 서버로 전송을 수행하기 전에 유효성 검사
        console.log(">>>> search : " + search);

        // test05.do

        // 요청 URL 준비
        var url = "test05.do?search=" + search;

        // test05.do
        // XMLHttpRequest 객체 (→ AJAX 객체) 생성
        ajax = createAjax(); //-- ajax.js

        // 설정
        ajax.open("GET", url, true);


        // ajax.onreadysteatechange = 동작
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 4 && ajax.status == 200) {
                // 업무 처리 수행(→ 외부로 추출하여 함수 정의)
                callBackFunc();
            }
        }

        // check~!!!
        // 실행
        ajax.send("");
        
    }

    // 수행할 업무 내용 정의
    //-- XML 목록으로 받아온 검색어들을
    //    적당한 리스트로 생성해서 화면에 출력할 수 있도록 처리
    function callBackFunc() {
        var listDiv = document.getElementById("list");
        var itemsDiv = document.getElementById("items");
       // var data = ajax.reaponseText;
        //
        // XML문서 전체의 참조 객체
        // (→ 흔히 XML문서 객체)
        var doc = ajax.responseXML;
        
        // XML 문서의 최상위 엘리먼트(루트 엘리먼트, 도큐먼트 엘리먼트)
        //-- 현재는 『<list></list>』 엘리먼트
        var root = doc.documentElement;
        
        // 루트 엘리먼트(list 엘리먼트) 하위의 모든 『<item></item>』엘리먼트 반환받기
        //   (반복적으로 구성된 여러 엘리먼트)
        var itemList = root.getElementsByTagName("item");
        if (itemList.length == 0) {
            listDiv.style = "none";
            return;
        }

        // 초기화
        listDiv.innerHTML = "";

        // 수신한 데이터(추천 검색어) 삽입하기
        for (var i=0; i<itemList.length; i++) {
            var word = itemList[i].getElementsByTagName("word")[0].firstChild.nodeValue;
            //var word = itemList[i].firstChild.nodeValue;
            console.log(">>> word : " +  word);
            listDiv.innerHTML += "<div class='item'>"+ word + "</div>";
        }

        listDiv.style = "display: inline";
    }
</script>
</head>
<body>

<div>
    <details>
        <summary>AJAX 실습-5</summary>
        <p>
           - 추천 검색어
        </p>
    </details>
    <hr>
</div>

<div>
    검색어
    <input type="text" id="search" class="txt control" placeholder="검색어를 입력하세요." 
     onkeyup="search();">
</div>
<div id="list">
    <div id="items">
        <div class="item">가나</div>
        <div class="item">가다랑어</div>
        <div class="item">가방</div>
    </div>
    <div id="footer">
        완성형 추천 검색어
    </div>
</div>


</body>
</html>