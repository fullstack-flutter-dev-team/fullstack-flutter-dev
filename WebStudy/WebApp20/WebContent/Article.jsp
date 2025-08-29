<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>

<%

// 이전 페이지(최초 요청 or List.jsp or Article.jsp)로부터 넘어온 데이터 수신
// → num(게시물 번호), pageNum(페이지 번호)
String strPageNum = request.getParameter("pageNum");  //-- 페이지 번호
String strNum = request.getParameter("num");          //-- 게시물 번호

//데이터베이스 연결
Connection conn = DBConn.getConnection();
BoardDAO dao = new BoardDAO(conn);

int num = Integer.parseInt(strNum);

// 해당 게시물 조회수 증가
dao.updateHitCount(num);

// 해당 게시물을 기준으로 이전/다음 게시물 번호 조회
int prevNum = dao.getBeforeNum(num); // ??  67
int nextNum = dao.getNextNum(num);   //     67   ??
String prevContent = "";
String nextContent = "";

// 이전글/다음글 객체 인스턴스 변수
BoardDTO dtoPrev = null;
BoardDTO dtoNext = null;

if (prevNum != -1) { //-- 이전 게시물이 존재할 경우...
    dtoPrev = dao.getReadData(prevNum);
    prevContent = dtoPrev.getContent();
}

if (nextNum != -1) { //-- 다음 게시물이 존재할 경우...
    dtoNext = dao.getReadData(nextNum);
    nextContent = dtoNext.getContent();
}

// 해당 게시물의 상세 내용 가져오기
BoardDTO dto = dao.getReadData(num); //-- 현재 게시물
int nLineCount = 1; // 게시물 본문 라인 수 저장 변수
String[] arrContent = dto.getContent().split("\n");
// 게시물 내용 다듬기 - 글 엔터를 <br/>로 변경   
dto.setContent(dto.getContent().replaceAll("\n", "<br>")); 
//-- 안녕하세요\n반갑습니다.
//   → 안녕하세요<br>반갑습니다.
     
if (arrContent != null) {
 nLineCount = arrContent.length;
}

// 데이터베이스 연결 닫기
DBConn.close();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
</head>
<body>

<div id="bbs">
	<div id="bbs_title">게시판 (JDBC 연동 버전)</div>
    <div id="bbsArticle">
    	<div id="bbsArticle_header">게시물의 제목입니다.</div>
    	<div class="bbsArticle_bottomLine">
<!--             <dl> -->
<!--             	<dt>작성자</dt> -->
<!--             	<dt>홍길동</dt> -->
                
<!--             	<dt>라인수</dt> -->
<!--             	<dt>3</dt> -->
<!--             </dl> -->
            <dl>
            	<dt>작성자</dt>
            	<dd><%=dto.getName() %></dd>
                
            	<dt>라인수</dt>
            	<dd><%=nLineCount %></dd>
            </dl>
        </div><!-- .bbsArticle_bottomLine -->
	    <div class="bbsArticle_bottomLine">
<!--             <dl> -->
<!--             	<dt>등록일</dt> -->
<!--             	<dt>2025-08-29</dt> -->
                
<!--             	<dt>조회수</dt> -->
<!--             	<dt>23</dt> -->
<!--             </dl> -->
            <dl>
            	<dt>등록일</dt>
            	<dd><%=dto.getCreated() %></dd>
                
            	<dt>조회수</dt>
            	<dd><%=dto.getHitCount() %></dd>
            </dl>
        </div><!-- .bbsArticle_bottomLine -->
        
        <div id="bbsArticle_content">
<!--             <table style="width:600px;"> -->
            <table>
                <tr>
<!--                     <td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150px;"> -->
                    <td style="vertical-align: top;">
<!--                         어쩌구 저쩌구 궁시렁 궁시렁<br> -->
<!--                         이러쿵 저러쿵 하는<br> -->
<!--                          내용입니다. -->
                        <%=dto.getContent() %>
                    </td>
                </tr>
            </table>
        </div><!-- #bbsArticle_content -->
        <div class="bbsArticle_bottomLine">
<!--             이전글 : (54) 점심 메뉴에 대해 작성한 게시물 -->
<%--             이전글 : (<%=prevNum %>) <%=prevContent %> --%>
            <% 
            if (prevNum != -1) {
            %>
                이전글 : <a href="<%=cp%>/Article.jsp?pageNum=<%=strPageNum%>&num=<%=prevNum%>">(<%=prevNum %>) <%=prevContent %></a>
             <% } else { %>
                이전글 : 없음
             <% } %>
        </div>
        <div class="bbsArticle_noLine">
<!--             다음글 : (56) 주말 일정에 대해 작성한 게시물 -->
<%--             다음글 : (<%=nextNum %>) <%=nextContent %> --%>
            <% 
            if (nextNum != -1) {
            %>
                다음글 : <a href="<%=cp%>/Article.jsp?pageNum=<%=strPageNum%>&num=<%=nextNum%>">(<%=nextNum %>) <%=nextContent %></a>
             <% } else { %>
                다음글 : 없음
             <% } %>
        </div>
    </div><!-- #bbsArticle -->
    
    <div class="bbsArticle_noLine" id="address">
<!--         From : 211.238.142.62   -->
        From : <%=dto.getIpAddr() %>    
    </div><!-- .bbsArticle_noLine -->   

    <div id="bbsArticle_footer">
    
        <div id="leftFooter">
            <input type="button" value="수정" class="btn2">  
             <!-- updated 폼에서 삭제도 같이 진행 --> 
            <input type="button" value="삭제" class="btn2">       
        </div><!-- #leftFooter -->
        
        <div id="rightFooter">
            <input type="button" value="리스트" class="btn2"
            onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=strPageNum %>'">
        </div><!-- #rightFooter -->
    
    </div><!-- #bbsArticle_footer -->
</div>

</body>
</html>