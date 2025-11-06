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
<title>GradeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

<!-- 기본 CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부트스트랩 부가 테마 CSS -->
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
   .scrollable-panel {
        max-height: 640px;
        overflow: auto;
   }
</style>

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="http://maxcdn.bootstrap.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
     $(function() {
         $("#addStudent").click(function() {
             console.log(">>>>>");
             window.location.href = "studentinsertform.action";
         });
         
         // 학생 정보 이동
         $("#studentList").click(function() {
             $(location).attr("href", "studentlist.action");
         });
         
         // 성적 정보 이동
         $("#gradelist").click(function() {
             $(location).attr("href", "gradelist.action");
         });
         
     });//$(function() {
</script>
</head>
<body>

<!-- 상단 메뉴 -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <ul class="nav nav-pills" role="tablist">
            <li role="presentation">
                <a href="studentlist.action">학생 리스트</a>
            </li>
            <li  role="presentation" class="active">
                <a href="gradelist.action">성적 리스트</a>
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
            <div class="panel-heading">성적 정보 출력</div>
            
            <div class="panel-body scrollable-panel">
                <table class="table">
                    <thead>
                        <tr>
                            <th>SID</th>
                            <th>NAME</th>
                            <th>SUB1</th>
                            <th>SUB2</th>
                            <th>SUB3</th>
                            <th>TOT</th>
                            <th>AVG</th>
                            <th>CH</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="grade" items="${list }">
                            <tr>
                                <td>${grade.sid }</td>
                                <td>${grade.name }</td>
                                <td>${grade.sub1 }</td>
                                <td>${grade.sub2 }</td>
                                <td>${grade.sub3 }</td>
                                <td>${grade.tot }</td>
                                <td>${grade.avg }</td>
                                <td>${grade.ch }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <button type="button" class="btn btn-primary btn-sm" role="badgeFrame">
                    Count <span class="badge" role="badge">${count }</span>
                </button>
            </div>
        </div> <!-- close .panel .panel-default  -->
    </div> 
</div> 

</body>
</html>