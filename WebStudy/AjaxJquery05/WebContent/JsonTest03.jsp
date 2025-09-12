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
<title>JsonTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    $(function() {
        
        $("#sendBtn").click(function() {
            // 데이터 구성
            var params = "name=" + $.trim($("#name").val()) 
                    + "&content=" + $.trim($("#content").val());

            $.ajax({
                type: "post",
                url: "jsontest03ok.do",
                data: params,
                dataType: "json",      //-- check~!!!
                success: function(jsonObj) {
                    var out = "";

                    // check~!!!
                    // 수신된 jsonObj 는 JSON배열 객체
                    // -> 배열방만큼(배열의 길이만큼) 반복문 순환
                   <%-- for (var idx=0; idx<jsonObj.length: idx++) //-- idx: 0 1 2 3 4
                    {
                       var num = jsonObj[idx].num;
                       var name = jsonObj[idx].name;
                       var content = jsonObj[idx].content;
                       out += "<br>==========================";
                       out += "<br> - 번호 : " + num;
                       out += "<br> - 이름 : " + name;
                       out += "<br> - 내용 : " + content;
                       out += "<br>==========================";
                    } --%>
                   
                    $("#resultDiv").html(out);
                    console.log(">>>> out : " +  out)

                },
                beforeSend: function() {
                    var flag = true;

                    if (!$.trim($("#su1").val())) {
                        alert("su1을 입력해야 합니다.");
                        $("#su1").focus();
                        flag = false;
                    }
                    if (!$.trim($("#su2").val())) {
                        alert("su2을 입력해야 합니다.");
                        $("#su2").focus();
                        flag = false;
                    }

                    return flag;
                },
                error: function(e) {
                    alert(e.responseText);
                }
            });
        });//$("#sendBtn").click(function() {
    });//$(function() {
</script>
</head>
<body>
<!-- 
    jsontest02.do → com.test.ajax.JsonTest03Controller.java
                 (→ WEB-INF/view/JsonTest03.jsp)
                      ↓
                 jsontest03ok.do → com.test.ajax.JsonTest03okController.java
                               ↓ (연산 수행 후 내용 전달 : 연산 결과값)
                            (→ WEB-INF/view/JsonTest03ok.jsp)
                             (JSON 객체 전달: su1, su2, oper, result)

-->
<details open="open">
    <summary>jQuery의 ajax() 활용 실습</summary>
    <p>json control</p>
    
    <div>
        <input type="text" id="su1" class="txt txtNum"/>
        <select id="oper">
            <option value="add">덧셈</option>
            <option value="sub">뺄셈</option>
            <option value="mul">곱셈</option>
            <option value="div">나눗셈</option>
        </select>
        <input type="text" id="su2" class="txt txtNum"/>
        <br><br>
        <input type="button" value="결과 확인" id="sendButton" class="btn" style="width: 700px;"/>
    </div>
    
    
    <!-- AJAX 를 활용한 결과 갱신 -->
    <div id="resultDiv">
    
    </div>
    
    
    <div>
        <label><input type="radio" name="rdo">rdo1</label>
        <label><input type="radio" name="rdo">rdo2</label>
    </div>
    
    <div>
        <label><input type="checkbox" name="chk">chk1</label>
        <label><input type="checkbox" name="chk">chk2</label>
    </div>
    
    <div>
        <input type="text" />
    </div>
</details>

</body>
</html>