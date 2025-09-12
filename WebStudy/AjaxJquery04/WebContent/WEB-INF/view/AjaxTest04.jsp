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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    //jQuery문법
    $(function() {
        
        $("#sendBtn").click(function(){
            console.log(">>> sendBtn click!!");

            var params = "title=" + $.trim($("#title").val())
                        + "&content=" + $.trim($("#content").val());
            
            // $ → jQuery
            $.ajax({
                type: "POST",    //-- 대소문자 구분없음
                url: "ajaxtest04ok.do",
                data: params,
                dataType: "xml", //-- check~!!!
                beforeSend: function() {
                    var flag = false;

                    if (!$("#title").val()) {
                        return flag;
                    }

                     if (!$("#content").val()) {
                        return flag;
                    }
                    return true;
                },
                success: function(xmlData) {
                    var status = $(xmlData).find("status").each(function() {
                        var status = $(this).text();
                        console.log(">>> status : " + status);
                    });

                    var str = "";
                    $(xmlData).find("records").each(function() {
                        var record = $(this);
                        var id = $(record).attr("id");
                        var title = $(this).find("title").text();
                        var content = $(this).find("content").text();
                        str += ">> id=" + id + "<br> - title= " + title
                                + "<br> - content= " + content

                        console.log(">>> str : " + str);
                    });
                    
                    var items = $(xmlData).find("comment");
                    var out = "";
                    items.each(function() {
                        var item = $(this);
                        out += $(item).find("id").text() + "<br>";
                        out += $(item).find("title").text() + "<br>";
                        out += $(item).find("content").text() + "<br><br>";
                    })
                    
                    console.log(">> result: " + out);
                    $("#resultDiv").html(out);
                    $("#title").val("");
                    $("#content").val("");
                    $("#title").focus();
                },
                error: function(e) {
                    alert(e.responseText);
                },
            });

        });
    });//$(function() {

</script>
</head>
<body>

<!-- 
    ajaxtest04.do → com.test.ajax.AjaxTest04Controller.java
                 (→ WEB-INF/view/AjaxTest04.jsp)
                      ↓
                 ajaxtest04ok.do → com.test.ajax.AjaxTest04okController.java
                            (→ WEB-INF/view/AjaxTest04ok.jsp)

-->

<details open="open">
    <summary>jQuery의 ajax() 활용 실습(XML)</summary>
    <p>xml control</p>
    <div>
        제목
        <input type="text" id="title" class="txt"><br><!-- 테스트 -->
        
        내용
        <input type="text" id="content" class="txt"><br><!-- 반갑습니다. -->
        <br><br>
        
        <input type="button" id="sendBtn" class="btn" value="등록하기">
    </div>
    
    <!-- AJAX 처리 결과 수신 -->
    <div id="resultDiv">
        <!-- 
        
            >> id=1
            - title=테스트
            - content=반갑습니다.
            
            >> id=2
            - title=테스트
            - contnet=반갑습니다.
        
         -->
    </div>
</details>

</body>
</html>