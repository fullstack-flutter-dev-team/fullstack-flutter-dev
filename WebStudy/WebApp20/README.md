### ▣▣▣ JDBC연동 게시판 구성 실습 ▣▣▣

○ 실습 프로젝트 : WebApp20

○ 물리적 파일 구성
  - 00. WebApp20_scott(plsql).sql
---
  - 01. [DBConn.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/src/com/util/DBConn.java)
  - 02. [MyUtil.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/src/com/util/MyUtil.java)
  - 03. [BoardDTO.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/src/com/test/BoardDTO.java)
  - 04. [BoardDAO.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/src/com/test/BoardDAO.java)
---
  - 05. [List.jsp](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/WebContent/List.jsp)
  - 06. Created.jsp - 입력폼
  - 07. Created_ok.jsp - 액션처리 페이지
  - 08. [Article.jsp](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/WebContent/Article.jsp)
  - 09. Updated.jsp
  - 10. Updated_ok.jsp
  - 11. Delete_ok.jsp
---
  - 12. [style.css](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/WebContent/css/style.css)
  - 13. [list.css](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/WebContent/css/list.css)
  - 14. [article.css](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/WebContent/css/article.css)
  - 15. [created.css](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/WebContent/css/created.css)
 --- 
  - 16. [util.js](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/WebStudy/WebApp20/WebContent/js/util.js)
---

-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/