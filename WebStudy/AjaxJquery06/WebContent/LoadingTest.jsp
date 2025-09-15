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
<title></title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    $(function() {
        $("#sendBtn").click(function() {

            var param = "name=" + $.trim($("#name").val())
                     + "&content=" + $.trim($("#content").val());

            $.ajax(
            {
                type: "post",
                url: "LoadingTestOk.jsp",
                data: param,
                success: function(args) {
                    $("#resultDiv").html(args);

                    $("#name").val("");
                    $("#content").val("");
                    $("#name").focus();
                },
                beforeSend: function() {
                    var flag = true;

                    if (!$.trim($("#name").val())) {
                        alert("이름을 입력해야 합니다.")
                        $("#name").focus();

                        flag= false
                    }

                    if (!$.trim($("#content").val())) {
                        alert("내용을 입력해야 합니다.")
                        $("#content").focus();

                        flag= false
                    }

                    return flag;
                },
                error: function(e) {
                    alert(e.responseText);
                }
            }
            );
        });
        
        // check~!!!
        // $(document).ajaxStart(동작).ajaxComplete(동작);
        $(document).ajaxStart(function() {
            // AJAX 요청 시작 시....
            $("#loading").show();
            $("#resultDiv").hide();
        }).ajaxComplete(function() {
            // AJAX 요청 완료 시....
            $("#loading").hide();
            $("#resultDiv").show();
        });
    });

</script>
</head>
<body>

<details open="open">
    <summary>jQuery의 ajax() 활용 실습</summary>
    <p>로딩 이이지 적용</p>
    
    <div>
        이름
        <input type="text" id="name" class="txt"><br>
        
        내용
        <input type="text" id="content" class="txt"><br>
        <br><br>
        
        <input type="button" id="sendBtn" class="btn" value="등록하기">
    </div>
    
    <div id="loading" style="display: none">
        기다려주세요....
        <img alt="loading" src=<%=cp %>/images/loading_01.gif>
    </div>
    
    <!-- AJAX 처리 결과 수신 -->
    <div id="resultDiv">
        test
    </div>
</details>

</body>
</html>