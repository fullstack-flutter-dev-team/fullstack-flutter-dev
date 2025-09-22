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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
    * {
        line-height: 150%;
    }
    
    #customers th {
        background-color: #ffeeff;
        border: 1px solid gray;
    }
    
    #customers td
    {
        background-color: #eeddee;
        text-align: center;
        border: 1px solid gray; 
    }
    
    #customers tr:
    {
        background-color: #eeddee;
        text-align: center;
        border: 1px solid gray; 
    }
    
    #submitBtn
    {
        height: 150%;
        width: 350px;
        font-size: 18px;
        font-weight: bold;
        font-family: 맑은 고딕;
        color: #343;
    }
    
    #error
    {
        color: red;
        font-size: small;
        display: none;
    }
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
    
    $(function() {
        $("#submitBtn").click(function() {
        	   // 두 항목이 묶여서 처리되고 있는 상황이기 때문에... 생략 가능
            $("#err").css("display","none");
            
            if ($("#name").val() == "" || $("#telephone").val()=="")
            {
                $("#err").css("display","inline");
                return;
            }
            
            $("#memberForm").submit();
        });
        	
    	
    });// $(function() {

</script>
</head>
<body>

    <div>
    	<h1>회원 관리</h1>
    	<p>(Spring MVC 버전)</p>
    	<hr>
    </div>
    
    <div>
        <form action="memberinsert.do" method="post" id="memberForm">
            이름 <input type="text" name="name" id="name" class="txt control" required="required" />
            <br>
            전화 <input type="text" name="telephone" id="telephone" class="txt control" required="required" />
            <br><br>
            <button type="button" id="submitBtn">회원 추가</button>
            <span id="error">모든 항목을 입력해야 합니다.</span>
        </form>
        <br>
        
        <!-- <p>전체 인원 수 : 3 명</p> -->
        <!-- EL 표현에 의한 인원 수 출력 부분 -->
        <p>전체 인원 수 : ${count } 명</p>
        
        <!-- 전체 회원 리스트 출력 부분 -->
        <table id="customers" class="tbl" style="width: 500px;">
            <tr>
                <th>번호</th><th>이름</th><th>전화번호</th>
            </tr>
            <!-- 
            <tr>
                <td>1</td>
                <td>도우너</td>
                <td>010-0000-0000</td>
            </tr>
            <tr>
                <td>2</td>
                <td>마이콜</td>
                <td>010-0111-0111</td>
            </tr>
            <tr>
                <td>3</td>
                <td>희동이</td>
                <td>010-0222-0222</td>
            </tr>
            -->
            
            <!-- EL, JSTL 표현에 의한 회원 명단 출력 부분 -->
            <c:forEach var="member" items="${memberList }">
                <tr>
                    <!-- MemberDTO 객체의 getMid(), getName(), getTlephone() 메소드를 호출하는 구문 -->
                    <td>${member.mid }</td>
                    <td>${member.name }</td>
                    <td>${member.telephone }</td>
                </tr>
            </c:forEach>
        </table>
        
    </div>

</body>
</html>