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
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    $(function(){
        
        $("#sendBtn").click(function(){
            var params = "name=" + $.trim($("#name").val())
                         + "&content=" + $.trim($("#content").val())

            $.ajax(
            {
                type: "POST",
                url: "AjaxTest03ok.jsp",
                data: params,      //-- URL 지정 페이지로 넘길 값  check~!!!!
                dataType: "xml",   //-- check~!!! , 넘겨 받을 데이터 타입
                async: true,       //-- default: true
                success: function(args) {
                    var out = "";
                    out = ">> 게시물의 갯수 : " + $(args).find("totalDataCount").text() + "<br>";

                    $(args).find("comment").each(function() {
                        var item = $(this);
                        var num = item.attr("num");
                        var name = item.find("name").text();
                        var content = item.find("content").text();

                        out += "<br>==========================";
                        out += "<br> - 번호 : " + num;
                        out += "<br> - 이름 : " + name;
                        out += "<br> - 내용 : " + content;
                        out += "<br>==========================<br>";
                    });

                    $("#resultDiv").html(out);

                    $("#name").val("");
                    $("#content").val("");
                    
                    $("#name").focus();
                },
                beforeSend: function() {
                    return true;
                },
                error: function(e) {
                    alert(e.responseText);
                },
            });//$.ajax(
        });//$("#sendBtn").click(function(){
        
    });// $(function(){

</script>
</head>
<body>




<details open="open">
    <summary>jQuery의 ajax() 활용 실습(XML)</summary>
    <p>xml control</p>
    <div>
        이름
        <input type="text" id="name" class="txt"><br>
        
        내용
        <textarea rows="3" cols="50" id="content" class="txt"></textarea>
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