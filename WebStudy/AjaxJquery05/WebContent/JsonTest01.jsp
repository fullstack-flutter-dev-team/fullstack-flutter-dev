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
<title>JsonTest01.jsp</title>
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
                url: "JsonTest01ok.jsp",
                data: params,
                dataType: "json", //-- check~!!!
                success: function(jsonObj) {
                    var out = "";

                    // check~!!!
                    var num = jsonObj.num;
                    var name = jsonObj.name;
                    var content = jsonObj.content;

                    out += "<br>==========================";
                    out += "<br> - 번호 : " + num;
                    out += "<br> - 이름 : " + name;
                    out += "<br> - 내용 : " + content;
                    out += "<br>==========================";

                    $("#resultDiv").html(out);
                    console.log(">>>> out : " +  out)

                    $("#name").val("");
                    $("#content").val("");
                    
                    $("#name").focus();
                },
                beforeSend: function() {
                    var flag = true;

                    if (!$.trim($("#name").val())) {
                        alert("이름을 입력해야 합니다.");
                        $("#name").focus();
                        flag = false;
                    }
                    if (!$.trim($("#content").val())) {
                        alert("내용을 입력해야 합니다.");
                        $("#content").focus();
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

<details open="open">
    <summary>jQuery의 ajax() 활용 실습</summary>
    <p>json control</p>
    
    <div>
        이름
        <input type="text" id="name" class="txt"><br>
        
        내용
        <input type="text" id="content" class="txt"><br>
        <br><br>
        
        <input type="button" id="sendBtn" class="btn" value="등록하기">
    </div>
    
    <!-- AJAX 처리 결과 수신 -->
    <div id="resultDiv">
        test
    </div>
</details>

</body>
</html>