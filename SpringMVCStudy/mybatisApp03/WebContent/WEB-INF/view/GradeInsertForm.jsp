<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="<%=cp %>/images/favicon.png" type="image/x-icon">
<link rel="icon" href="<%=cp %>/images/favicon.png" type="image/x-icon">
<title>GradeInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

<!-- 기본 CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부트스트랩 부가 테마 CSS -->
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="http://maxcdn.bootstrap.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
     $(function() {
         $("#cancel").click(function() {
             console.log(">>>>>");
             window.location.href = "studentlist.action";
         });
         
         // 학생 정보 이동
         $("#studentList").click(function() {
             $(location).attr("href", "studentlist.action");
         });
         
         // 성적 정보 이동
         $("#gradelist").click(function() {
             $(location).attr("href", "gradelist.action");
         });
     });
</script>
</head>
<body>

<!-- 상단 메뉴 -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <ul class="nav nav-pills">
            <li class="nav-item">
                <a class="nav-link" href="studentlist.action">학생 리스트</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active"  aria-current="page" href="gradelist.action">성적 리스트</a>
            </li>
        </ul>
    </div>
</nav>
<br><br><br><br>

<%-- 
<div>
    <h1><b>성적 정보</b></h1>
    <hr>
</div>
 --%>

<div class="container">
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-heading" id="title">성적 정보 입력</div>
        
            <div class="panel-body">
                <form role="form" action="gradeinsert.action" method="post">
                    <div class="form-group">
                        <label for="sid">
                            SID : 
                        </label>
                        <input type="text" class="form-control" id="sid" name="sid"
                               value=${sid } readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="name">
                            NAME : 
                        </label>
                        <input type="text" class="form-control" id="name" name="name"
                               value=${name } readonly="readonly">
                    </div>
                    
                    <div class="form-group">
                        <label for="sub1">
                            SUB1 : 
                        </label>
                        <input type="text" class="form-control" id="sub1" name="sub1">
                    </div>
                    
                    <div class="form-group">
                        <label for="sub2">
                            SUB2 : 
                        </label>
                        <input type="text" class="form-control" id="sub2" name="sub2">
                    </div>
                    
                    <div class="form-group">
                        <label for="sub3">
                            SUB3 : 
                        </label>
                        <input type="text" class="form-control" id="sub3" name="sub3">
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-sm">SUBMIT</button>
                    <button type="button" id="cancel" class="btn btn-default btn-sm btnCancel">CANCEL</button>
                </form> 
            </div>
        </div><!-- close .pane .panel-default  -->
    </div>
</div>

</body>
</html>