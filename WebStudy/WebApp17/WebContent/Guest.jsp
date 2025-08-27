<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
th {
    width: 20%;
}

td {
    
    width: 40%;
}
</style>
<script type="text/javascript">
function sendIt() {
    var myForm = document.myForm;
    
    
    myForm.submit();
}

</script>
</head>
<body>

<div>
    <h1>간단한 기본 방명록 작성 실습</h1>
    <hr>
</div>


<!--
 
○ 물리적 파일 구성
  - Guest.jsp → 작성자, 제목, 내용
  - com.tet.GuestDTO → Java Bean 구성
  - Guest_ok.jsp → 데이터 수신 → 객체 생성 → 결과화면 구성
  
 -->
 
<div>
    <form action="Guest_ok.jsp" method="post" name="myForm">
        <table class="table">
          <tr>
              <th>작성자</th>
              <td>
                  <input type="text" name="userName" class="txt">
              </td>
          </tr>
          <tr>
              <th>제목</th>
              <td>
                  <input type="text" name="subject" class="txt">
              </td>
          </tr>
          <tr>
              <th>내용</th>
              <td>
                  <textarea name="content" class="txt" cols="35" rows="20"></textarea>
              </td>
          </tr>
          <tr>
              <td colspan="2">
                 <button type="button" class="btn" style="width: 100%;" onclick="sendIt()">방명록 작성</button>
              </td>
          </tr>
        
        </table>
    </form>
</div>

</body>
</html>