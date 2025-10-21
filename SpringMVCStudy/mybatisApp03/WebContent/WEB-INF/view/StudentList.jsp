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
<title>StudentList.jsp</title>
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
</head>
<body>


<div>
    <h1>학생 정보</h1>
    <hr>
</div>

<div class="container">
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-heading" id="title">
                학생 정보 입력            
            </div>
        
            <div class="panel-body">
                <form role="form" action="memberinsert.action" method="post">
                
                    <div class="form-group">
                        <label for="name">
                            NAME : 
                        </label>
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                    
                    <div class="form-group">
                        <label for="telephone">
                            TEL :
                        </label>
                        <input type="tel" class="form-control" id="tel" name="tel">
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-sm">SUBMIT</button>
                    <button type="button" class="btn btn-default btn-sm btnCancel">CANCEL</button>
                
                </form> 
            </div>
        </div><!-- close .pane .panel-default  -->
        
        <br><br>
    
        <div class="panel panel-default">
            <div class="panel-heading">
                학생 정보 출력
            </div>
            
            <div class="panel-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>SID</th>
                            <th>NAME</th>
                            <th>TEL</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${list }">
                            <tr>
                                <td>${student.sid }</td>
                                <td>${student.name }</td>
                                <td>${student.tel }</td>
                            </tr>
                        </c:forEach>
                        
                    </tbody>
                    </table>

                    <button type="button" class="btn btn-primary btn-sm" role="badgeFrame">
<!--                         Count <span class="badge" role="badge">1</span> -->
                        Count <span class="badge" role="badge">${count }</span>
                    </button>
                    
                </div>
            </div> <!-- close .panel .panel-default  -->
        </div> 
    
    </div> 

</body>
</html>