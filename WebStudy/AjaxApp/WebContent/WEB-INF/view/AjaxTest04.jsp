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
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
    #result
    {
        width: 250px;
        color: #F33;
        font-size: small;
        /* display: none; */
        display: inline-block;
    }

    #addrResult {
        width: 800px;
    }
    
    #addr2 {
        width: 800px;
    }
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
    
    // 아이디 중복검사 버튼 클릭 이벤트 핸들러
    function chkId() {
        // 데이터 수집
        var id = document.getElementById("id").value;
        
        // 요청할 URL 구성(준비)
        var url = "test03.do?id=" + id;
        
        // AJAX 객체
        ajax = createAjax(); //-- ajax.js
        
        // 환경 설정(→ 『open("메소드방식","URL", 비동기[true]/동기[false])』)
        ajax.open("GET", url, true);
        
        // check~!!!
        ajax.send("");
        
        // ajax.onreadystatechange = 동작;
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    // 업무 처리 수행(→ 외부로 추출하여 함수 정의)
                    callBack();
                }
            }
        };

    }

    // 업무 처리 함수 정의
    //-- 넘겨준 아이디에 대한 중복 검사를 수행하고
    //   그 결과(1 or 0)를 통보받아
    //   사용자에게 메세지 출력 → span → #result
    function callBack() {
        // 외부로 추출된 업무처리 내용 구성(responseText/responseXML)
        var result = document.getElementById("result");
        var data = ajax.responseText;
        var txtColor = "color: ";
        
        // 받아온 데이터를 업무에 적용한다.
        console.log(">>>> result: " + data);
        if (parseInt(data) == 0) {
            result.innerText = "사용 가능한 아이디 입니다.";
            txtColor += "blue;";
        } else {
            result.innerText = "이미 사용중인 아이디 입니다.";
            txtColor += "red;";
        }
        result.style = "display: inline;" + txtColor;
    }


    function search() {
        console.log(">>>> search");
        
        // 데이터 수집
        var addr = document.getElementById("addr").value;

        // 요청 URL 준비
        var url = "test04.do?addr=" + addr;
        
        console.log(">>> url : " + url);

        // XMLHttpRequest 객체 (→ AJAX 객체) 생성
        ajax = createAjax(); //-- ajax.js

        // 설정
        ajax.open("GET", url, true);

        // check~!!!
        ajax.send("");

        // ajax.onreadysteatechange = 동작
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 4 && ajax.status == 200) {
                // 업무 처리 수행(→ 외부로 추출하여 함수 정의)
                callBack2();
            }
        }

    }//--search

    // 추출된 수행 업무 함수 정의
    //-- 우편번호 검색 결과를 통보 받아서
    //   사용자에게 안내해줄 
    function callBack2() {
        console.log(">>> callBack2");
        
        // var data = ajax.reaponseText;
        //
        // XML문서 전체의 참조 객체
        // (→ 흔히 XML문서 객체)
        var doc = ajax.responseXML;
        
        // XML 문서의 최상위 엘리먼트(루트 엘리먼트)
        //-- 현재는 『<list>』 엘리먼트
        var root = doc.documentElement;
        
        // list 엘리먼트 하위의 모든 『<item>』엘리먼트 반환받기(반복적으로 구성된 여러 엘리먼트)
        var itemList = root.getElementsByTagName("item");
        
        console.log(">>> itemList.length : " + itemList.length);
        
        // select box 초기화(→ #addrResult)
        var addResult = document.getElementById("addrResult");
        addResult.innerHTML = "";
        var strAddrOptions = "";
        
        // 검색 결과 확인
        if (itemList.length == 0) { //-- 데이터를 수신하지 못한 경우
            <%-- strAddrOptions = "<option>주소를 입력하세요</option>"; --%>
            addResult.innerHTML = "<option>주소를 입력하세요</option>";
        } else {
            <%-- strAddrOptions = "<option value='0'>주소를 선택하세요</option>"; --%>
            addResult.innerHTML  = "<option value='0'>주소를 선택하세요</option>";

            // 검색 결과가 존재할 경우.... 반복문을 순환하며 각 데이터 가져오기
            for (var i = 0; i< itemList.length;i++) { //-- 수신한 아이템의 갯수만큼 반복 순환
//                 console.log(">>addr : " + itemList[i].children[1].innerHTML);
                <%--                 
                    strAddrOptions += "<option value='"
                                   + itemList[i].children[0].innerHTML
                                   + "'>["
                                   + itemList[i].children[0].innerHTML
                                   + "] "
                                   + itemList[i].children[1].innerHTML
                                   + "</option>"; 
                --%>

                var zipCode = itemList[i].getElementsByTagName("zipcode")[0];
                var address = itemList[i].getElementsByTagName("address")[0];

                // * 태그가 가지는 텍스트는 태그의 첫 번째 자식이고(→ firstChild)...
                //    텍스트 노드의 값은  『nodeValue』  로 가져온다.
                var zipCodeText = zipCode.firstChild.nodeValue;
                var addressText = address.firstChild.nodeValue;

                // 가져온 데이터를 select box에 아이템 추가
                addResult.innerHTML += "<option value='" + zipCodeText + "/" + addressText
                                      + "'>[" + zipCodeText + "] " + addressText + "</option>";
            }
        }
        
        <%-- addResult.innerHTML = strAddrOptions; --%>
    }

    function selectZipCode(obj) {
        var address = obj.options[obj.selectedIndex].value;
        
        if (address != 0) {
            var zipCodeText  = address.substring(0, address.indexOf("/"));
            var strAddr1Text = address.substring(address.indexOf("/")+1);
            console.log(">>> selAddr1 - zipCodeText :" + zipCodeText);
            console.log(">>> selAddr1 - strAddr1Text :" + strAddr1Text);
            var addr1 = document.getElementById("addr1");
            var addr2 = document.getElementById("addr2");
            var addr3 = document.getElementById("addr3");
//             addr1.value = zipCodeText;
//             addr2.value = strAddr1Text;
            addr1.value = address.split("/")[0];
            addr2.value = address.split("/")[1];
            addr3.focus();
        }
    }

</script>
</head>
<body>

<div>
    <details>
        <summary>회원 가입(아이디 중복검사 + 우편번호 검색)</summary>
        <p>
           - Test03send.java<br>
           - AjaxTest03.jsp<br>
           - ajax.js<br>      <!-- 완료 -->
           - main.css<br>     <!-- 완료 -->
           - Test03.java<br>
           - Test03ok.jsp<br>
           
           - Test04send.java<br> <!-- test04send.do → AjaxTest04.jsp -->
           - AjaxTest04.jsp<br>
           - Test04.java<br>
           
           - web.xml<br>
           * url : test03send.do / testo3.do<br>
           * 자료구조 활용<br>
        </p>
    </details>
    <hr>

</div>

<div>
    <table class="table">
        <tr>
            <th>아이디</th>
            <td>
                <input type="text" id="id" class="txt control">
                <input type="button" value="중복검사" class="btn control" onclick="chkId();">
                <span id="result"></span>
                <!-- 사용 가능한 이이디입니다. -->
                <!-- 사용 불가능한 이이디입니다. -->
            </td>
        </tr>
        <tr>
            <th>이름</th>
            <td>
                <input type="text" id="name" class="txt control">
            </td>
        </tr>
        <tr>
            <th>주소</th>
            <td>
                <input type="text" id="addr" class="txt control" placeholder="동 입력">
                <input type="button"  value="검색하기" class="btn control" onclick="search();">
                <br>
                <select id="addrResult" class="control" onchange="selectZipCode(this);">
                    <option>주소를 입력하세요.</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>주소 검색 결과</th>
            <td>
                <input type="text"  id="addr1" class="txt control" readonly="readonly" style="width:200px;"><br>
                <input type="text"  id="addr2" class="txt control" readonly="readonly"><br>
                <input type="text"  id="addr3" class="txt control" placeholder="상세주소를 입력하세요."  style="width:500px;">
            
            
            </td>
        </tr>
    </table>
</div>

</body>
</html>