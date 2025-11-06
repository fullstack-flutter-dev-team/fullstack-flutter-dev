<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의하기 - 공모자들</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mun.css">
</head>
<body>
    <%
        // 로그인한 사용자 정보 (세션에서 가져옴)
        // String userId = (String) session.getAttribute("userId");
        // if (userId == null) {
        //     response.sendRedirect("login.jsp");
        //     return;
        // }
        
        
        String userId = "user123";
        String userEmail = "user123@example.com";
    %>
    
    <div class="container">
        <div class="header">
            <div class="header-icon">💬</div>
            <h1 class="page-title">문의하기</h1>
            <p class="page-subtitle">궁금한 사항을 문의해주세요. 빠르게 답변해드리겠습니다.</p>
        </div>
        
        <div class="info-box">
            <div class="info-box-title">
                <span>💡</span>
                <span>문의 전 확인해주세요</span>
            </div>
            <div class="info-box-content">
                <ul>
                    <li>문의 답변은 평균 1-2일 내에 이메일로 발송됩니다.</li>
                    <li>자주 묻는 질문은 FAQ 페이지에서 빠르게 확인하실 수 있습니다.</li>
                    <li>구체적으로 작성해주실수록 정확한 답변이 가능합니다.</li>
                </ul>
            </div>
        </div>
        
        <div class="quick-questions">
            <div class="quick-questions-title">
                <span>⚡</span>
                <span>자주 묻는 질문 템플릿</span>
            </div>
            <div class="quick-question-list">
                <div class="quick-question-item" onclick="applyTemplate('회원탈퇴', '회원탈퇴는 어떻게 하나요?\\n\\n탈퇴 절차와 주의사항에 대해 알려주세요.')">
                    📌 회원탈퇴는 어떻게 하나요?
                </div>
                <div class="quick-question-item" onclick="applyTemplate('모임 생성 문의', '모임을 생성하고 싶은데 방법을 알려주세요.\\n\\n모임 카테고리: \\n예상 인원: \\n활동 지역: ')">
                    📌 모임 생성 방법을 알려주세요
                </div>
                <div class="quick-question-item" onclick="applyTemplate('신고 처리 문의', '신고한 내용의 처리 결과가 궁금합니다.\\n\\n신고 번호: \\n신고 일시: ')">
                    📌 신고 처리 결과가 궁금해요
                </div>
                <div class="quick-question-item" onclick="applyTemplate('결제/환불 문의', '결제 및 환불에 대해 문의드립니다.\\n\\n문의 내용: ')">
                    📌 결제/환불 관련 문의
                </div>
            </div>
        </div>
        
        <form id="inquiryForm" onsubmit="return validateInquiry(event)">
            <div class="form-container">
                <div class="user-info-section">
                    <div class="user-info-title">
                        <span>👤</span>
                        <span>문의자 정보</span>
                    </div>
                    <div class="user-info-content">
                        <div class="user-info-item">
                            <span class="user-info-label">아이디:</span>
                            <span><%= userId %></span>
                        </div>
                        <div class="user-info-item">
                            <span class="user-info-label">이메일:</span>
                            <span><%= userEmail %></span>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">
                        제목<span class="required">*</span>
                    </label>
                    <input 
                        type="text" 
                        id="title" 
                        name="title" 
                        class="form-input" 
                        placeholder="문의 제목을 입력하세요"
                        maxlength="100"
                        required
                    >
                    <div class="char-count">
                        <span id="titleCount">0</span> / 100자
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">
                        내용<span class="required">*</span>
                    </label>
                    <textarea 
                        id="content" 
                        name="content" 
                        class="form-textarea" 
                        placeholder="문의 내용을 자세히 입력해주세요.&#13;&#10;&#13;&#10;예시)&#13;&#10;- 발생한 문제 상황&#13;&#10;- 문제 발생 일시&#13;&#10;- 사용 중인 기기 및 브라우저&#13;&#10;- 오류 메시지 (있는 경우)"
                        maxlength="2000"
                        required
                    ></textarea>
                    <div class="char-count">
                        <span id="contentCount">0</span> / 2,000자
                    </div>
                    <p class="form-help">문의 내용을 구체적으로 작성해주시면 더 정확한 답변을 받으실 수 있습니다.</p>
                </div>
                
                        <div class="button-group">
                    <a href="profilemodify.do?tab=inquiry" class="btn btn-cancel">
                        <span>✕</span>
                        <span>프로필로</span>
                    </a>
                    <button type="submit" class="btn btn-submit">
                        <span>📨</span>
                        <span>문의하기</span>
                    </button>
                </div>
            </div>
        </form>
        
    </div>
    
    <script>
        // 제목 글자수 카운트
        const titleInput = document.getElementById('title');
        const titleCount = document.getElementById('titleCount');
        
        titleInput.addEventListener('input', function() {
            titleCount.textContent = this.value.length;
        });
        
        // 내용 글자수 카운트
        const contentInput = document.getElementById('content');
        const contentCount = document.getElementById('contentCount');
        
        contentInput.addEventListener('input', function() {
            contentCount.textContent = this.value.length;
        });
        
        // 템플릿 적용
        function applyTemplate(title, content) {
            if (titleInput.value || contentInput.value) {
                if (!confirm('작성 중인 내용이 있습니다. 템플릿을 적용하시겠습니까?')) {
                    return;
                }
            }
            
            titleInput.value = title;
            contentInput.value = content;
            titleCount.textContent = title.length;
            contentCount.textContent = content.length;
            
            // 내용 입력란으로 스크롤
            contentInput.focus();
            contentInput.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }
        
        // 폼 유효성 검사
        function validateInquiry(event) {
            event.preventDefault();
            
            const title = titleInput.value.trim();
            const content = contentInput.value.trim();
            
            if (!title) {
                alert('제목을 입력해주세요.');
                titleInput.focus();
                return false;
            }
            
            if (title.length < 5) {
                alert('제목은 최소 5자 이상 입력해주세요.');
                titleInput.focus();
                return false;
            }
            
            if (!content) {
                alert('내용을 입력해주세요.');
                contentInput.focus();
                return false;
            }
            
            if (content.length < 10) {
                alert('내용은 최소 10자 이상 입력해주세요.');
                contentInput.focus();
                return false;
            }
            
            // 최종 확인
            if (confirm('문의를 등록하시겠습니까?')) {
                submitInquiry(title, content);
            }
            
            return false;
            
            
        }
        
        // 문의 제출
        function submitInquiry(title, content) {
            // 실제로는 서버로 데이터 전송
            const inquiryData = {
                userId: '<%= userId %>',
                userEmail: '<%= userEmail %>',
                title: title,
                content: content
            };
            
            console.log('문의 데이터:', inquiryData);
            
            alert('문의가 성공적으로 등록되었습니다!');
            window.location.href = '<%=cp %>/profilemodify.do';
            
        }
        
        // 페이지 이탈 방지
        let isSubmitting = false;
        
        window.addEventListener('beforeunload', function(e) {
            const title = titleInput.value.trim();
            const content = contentInput.value.trim();
            
            if (!isSubmitting && (title || content)) {
                e.preventDefault();
                e.returnValue = '';
            }
        });
        
        // 폼 제출시 이탈 방지 해제
        document.getElementById('inquiryForm').addEventListener('submit', function() {
            isSubmitting = true;
        });
    </script>
</body>
</html>
