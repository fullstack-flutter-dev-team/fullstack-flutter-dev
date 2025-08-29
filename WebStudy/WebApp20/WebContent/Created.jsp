<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">
<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">
    function sendIt() {
        var f = document.myForm;
        
        // 제목 입력 확인 ------------------------------------------
        // 필수 입력 황목 기재 여부 확인 및 공백 처리
        var str = f.subject.value;
        str = str.trim(); //-- 앞/뒤 공백 제거
        
        // * javascript 의 trim()
        //   IE 8.0 이후부터 사용
        
        
        // 확인
        console.log("|" + str + "|");
        
        
        if (!str) {
            alert("\n제목을 입력해야 합니다~!!!");
            f.subject.focus();
            return;
        }
        // ---------------------------------------- 제목 입력 확인
        
        // 이름 입력 확인 ------------------------------------------
        // 필수 입력 황목 기재 여부 확인 및 공백 처리
        var str = f.name.value;
        str = str.trim(); //-- 앞/뒤 공백 제거
        // * javascript 의 trim()
        //   IE 8.0 이후부터 사용
        
        // 확인
        console.log("|" + str + "|");
        
        if (!str) {
            alert("\n작성자 이름을 입력해야 합니다~!!!");
            f.name.focus();
            return;
        }
        // --------------------------------------- 이름 입력 확인
        
        // 이메일 검사 -------------------------------------------------
        // 이메일은 필수 입력 항목이 아니므로 선택적인 입력이 가능하지만
        // 입력을 한 상황이라면, 이메일 형식에 맞도록 입력이 이루어졌는지
        // 확인이 필요한 데이터이므로 이에 대한 처리 수행
        if (f.email.value)  // 이메일 항목에 내용을 입력한 상황이라면...
        {
            if (!isValidEmail(f.email.value))   // 유효한 형태가 아니라면!
            {
                alert("\n정상적인 이메일 형식을 입력해야 합니다~!!!");
                f.email.focus();
                return;
            }
        }
        // ---------------------------------------- 이메일 검사
        
        // 패스워드 입력 확인 ---------------------------------
        // 필수 입력 항목 기재 여부 확인 및 공백 처리
        str = f.pwd.value;
        str = str.trim();
        
        if (!str)
        {
            alert("\n패스워드를 입력해야 합니다~!!!");
            f.pwd.focus();
            return;
        }
        // --------------------------------- 패스워드 입력 확인

        // 내용 입력 확인 -------------------------------------
        // 필수 입력 항목 기재 여부 확인 및 공백 처리
        str = f.content.value;
//         str = str.trim();
        
        if (!str)
        {
            alert("\n내용을 입력해야 합니다~!!!");
            f.content.focus();
            return;
        }
        // ------------------------------------- 내용 입력 확인
        
        f.action = "<%=cp%>/Created_ok.jsp";
        
        f.submit();
        
    }

</script>
</head>
<body>

<div id="bbs">
    <div id="bbs_title">
        게시판 (JDBC 연동 버전)
    </div><!-- #bbs_title -->
    
    <form action="" method="post" name="myForm">
        <div id="bbsCreated">
            <div class="bbsCreated_bottomLine">
                <dl>
                    <dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
                    <dd>
                        <input type="text" name="subject" class="boxTF" maxlength="20" style="width: 420px;">
                    </dd>
                </dl>
            </div><!-- .bbsCreated_bottomLine -->
            <div class="bbsCreated_bottomLine">
                <dl>
                    <dt>이&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
                    <dd>
                        <input type="text" name="name" class="boxTF" maxlength="20" style="width: 420px;">
                    </dd>
                </dl>
            </div><!-- .bbsCreated_bottomLine -->
            <div class="bbsCreated_bottomLine">
                <dl>
                    <dt>이&nbsp;&nbsp;메&nbsp;&nbsp;일</dt>
                    <dd>
                        <input type="email" name="email" class="boxTF" maxlength="50" style="width: 420px;">
                    </dd>
                </dl>
            </div><!-- .bbsCreated_bottomLine -->
            
            <div id="bbsCreated_content">
                <dl>
                    <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
                    <dd>
                        <textarea rows="12" cols="70" name="content" class="boxTA"></textarea>
                    </dd>
                </dl>
            </div><!-- #bbsCreated_content -->
            
            <div class="bbsCreated_noLine">
                <dl>
                    <dt>패스워드</dt>
                    <dd>
                         <input type="password" name="pwd" class="boxTF" maxlength="10">
                         <span style="font-size: 6pt; color: red;">(게시물 수정 및 삭제 시 필요)</span>
                    </dd>
                </dl>
            </div><!-- .bbsCreated_noLine -->
        </div><!-- #bbsCreated -->
        
        <div id="bbsCreated_footer">
            <input type="button" value="등록하기" class="btn2" onclick="sendIt()">
            <input type="reset" value="다시입력" class="btn2"
             onclick="document.myForm.subject.focus();">
            <input type="button" value="작성취소" class="btn2"
             onclick="javascript:location.href='<%=cp %>/List.jsp'">
        </div><!-- #bbsCreated_footer -->
    </form>
</div><!-- #bbs -->


</body>
</html>