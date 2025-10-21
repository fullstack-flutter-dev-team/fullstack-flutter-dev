■■■ Mybatis Framework 환경설정(이클립스 버전) ■■■

1. 『http://blog.mybatis.org/ 』 에서 mybatis 다운로드
   
   - Products 메뉴 선택(클릭)
     → 『https://blog.mybatis.org/p/products.html 』로 이동

   - 이동한 페이지의 Products 항목의 리스트들 중
     『MyBatis 3 SQL Mapping Framework for Java』 에서
      download 메뉴 선택(클릭)
      → 『https://github.com/mybatis/mybatis-3/releases 』 로 이동

   - 이동한 페이지에서 『mybatis-3.5.10』 항목의
     『▶ Assets』 선택(클릭) → 『▼ Assets』 형태로 노드 확장

   - 확장된 노드의 목록들 중 『mybatis-3.5.10.zip 3.69 MB May 24, 2022』 선택(클릭)
     → 파일 다운로드 진행

   - 다시 웹브라우저의 뒤로가기 버튼 선택(클릭)
     → 『https://blog.mybatis.org/p/products.html 』로 이동

   - 이동한 페이지의 Integration 항목의 리스트들 중
     『Spring Integration with Spring (spring) 』 에서
     download 메뉴 선택(클릭)
     → 『https://github.com/mybatis/spring/releases 』 로 이동


   - 이동한 페이지에서 『mybatis-spring-1.3.2』 항목의
      『▶ Assets』 선택(클릭) → 『▼ Assets』 형태로 노드 확장

     
   - 확장된 노드의 목록들 중 『mybatis-spring-1.3.2.zip 52.1 KB Mar 14, 2018』 선택(클릭)
     → 파일 다운로드 진행

2. 다운로드 완료된 파일을 압축 해제하여 아래의 파일을 준비한다.

    - mybatis-3.5.10.jar
    - mybatis-spring-1.3.2.jar
-----------------------------------------------------------------------------------
■■■ Spring MVC + Annotation + mybatis 프로젝트 실습 01 ■■■
○ 프로젝트
  - mybatisApp01
  
○ SpringMVC + mybatis 프로젝트 관련 라이브러리 등록(16개)
   - org.springframework.aop-3.0.2.RELEASE.jar
   - org.springframework.asm-3.0.2.RELEASE.jar
   - org.springframework.beans-3.0.2.RELEASE.jar
   - org.springframework.context-3.0.2.RELEASE.jar
   - org.springframework.core-3.0.2.RELEASE.jar
   - org.springframework.expression-3.0.2.RELEASE.jar
   - org.springframework.jdbc-3.0.2.RELEASE.jar
   - org.springframework.transaction-3.0.2.RELEASE.jar
   - org.springframework.web-3.0.2.RELEASE.jar
   - org.springframework.web.servlet-3.0.2.RELEASE.jar
   -
   - com.springsource.org.apache.commons.logging-1.1.1.jar
   -
   - standard.jar
   - jstl.jar
   -
   - ojdbc6.jar

<br>   ```+```
   - mybatis-3.5.10.jar
   - mybatis-spring-1.3.2.jar
  
○ 물리적 파일 구성
  - ISampleDAO.java           → 인터페이스
  - SampleController.java     → 컨트롤러(Controller, 클래스)
  - SampleDAO.xml             → 매퍼 XML

※ 매퍼 XML 샘플
   - 다운로드를 수행한 pdf 파일(mybatis-3.5.10.pdf)의 내용 중
   『2.1.5 Exploring Mapped SQL Statements』 항목의
   XML 관련 내용을 확인하여 샘플 DTD 를 구성할 수 있도록 한다.
   (→ pdf 파일의 페이지 번호 4)
      ```
      <?xml version="1.0" encoding="UTF-8" ?>
      <!DOCTYPE mapper
      PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
      "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
      <mapper namespace="org.mybatis.example.BlogMapper">
      <select id="selectBlog" resultType="Blog">
      select * from Blog where id = #{id}
      </select>
      </mapper>
      ```

○ 기능 구현
  - 마이바티스 환경 구성 후 프로젝트 정상 구동(실행) 여부 확인
---
### ■■■ Spring MVC + Annotation + mybatis 프로젝트 실습 02 ■■■

○ 프로젝트
   -  mybatisApp02

○ 관련 라이브러리 등록 및 환경구성 (※ 위에서 정리한 내용참조)
   ..

○ 기능 구현
  -  이름, 전화번호를 데이터베이스에서 읽어내어 화면에 출력
  - 이 과정에서 mybatis 활용.

○ 데이터베이스 관련 객체 준비
   - 사용 계정 : scott
   - 테이블 : TBL_MEMBERLIST
   - 테이블 구조 : 
   - MID NUMBER      --PK
      , NAME VARCHAR2(30)
      , TELEPHONE VARCHAR2(40)
   - 시퀀스 : MEMBERLISTSEQ

○ 페이지 레이아웃 구성
   회원 관리
 
   이름 [ ]
   전화 [  ]

    < 회원 추가 >

    전체 인원 수 : 2명
    ----------------------
     번호  이름     전화
      1    도우너   010-11..
      2    마일콜   010-22..
    ----------------------

○ 물리적 파일 구성
   - mybatisApp02_scott.sql → 데이터베이스 관련작업
   
   - MemberDTO.java   → 데이터 전송 객체 자료형 클래스(DTO)
   - IMemberDAO.java  → 인터페이스
   - MemberController → 컨트롤러
   - MemberDAO.xml    → mybatis 환경 설정 파일 활용
   - MemberMain.java  → mybatis 객체 활용(Controller)
   - MemberList.jsp   → view 페이지 활용

   - dispatcher-servlet.xml → mybatis 객체 등록 및 활용
   - web.xml → front Controller 등록 및 인코딩 설정 (필터활용)

○ 사용자 최초 요청 주소
   http://localhost:3306/mybatisApp02/memberlist.action


---
### ■■■ Spring MVC + Annotation + mybatis 프로젝트 실습 03 ■■■

○ 프로젝트
   -  mybatisApp03

○ 기본적인 환경은 mybatisApp00 의 src, WebContent 덮어쓰기로 처리

○ 기능 구현
   - 학사관리(성적 처리)

○ 데이터베이스 관련 객체 준비
   - **```scott.TBL_STUDENT```** 테이블 
 
         ```
         (  SID  NUMBER      --PK
          , NAME VARCHAR2(30)
          , TEL  VARCHAR2(40)
         )
         ```
   - **```scott.TBL_GRADE```** 테이블 
      ```
      (  SID  NUMBER      --PK/FK
         , SUB1 NUMBER(3)
         , SUB2 NUMBER(3)
         , SUB3 NUMBER(3)
      )
      ```
   - **```scott.STUDENTVIEW```** 뷰 
       - 뷰 구조
         ```
         SID, NAME, TEL, SUB(참조 레코드 수)
         ```
   - **```scott.GRADEVIEW```** 뷰
      - 뷰 구조 
         ```
         SID, NAME, SUB1, SUB2, SUB3, TOT, AVG, CH
         ```
        - 총점(TOT), 평균(AVG), 등급(CH)(합격, 과락, 불합격)

○ 물리적 파일 구성
   - **mybatisApp03_scott.sql**
     - 데이터베이스 관련 작업
<br>``` --🔹-- ```
   - **StudentDTO.java**
     - 데이터 전송 객체 자료형 클래스(DTO)
      - 학생 데이터 저장 및 전송
   - **GradeDTO.java**
     - 데이터 전송 객체 자료형 클래스(DTO)
      - 성적 데이터 저장 및 전송
<br>``` --🔹-- ```
   - **IStudentDAO.java**
     - 인터페이스
     - 학생 데이터 액션 처리 메소드 선언
   - **IGradeDAO.java** 
     - 인터페이스
     - 성적 데이터 액션 처리 메소드 선언
<br>``` --🔹-- ```
   - **StudentDAO.xml**
     - mybatis 환경 설정 파일 활용
   - **GradeDAO.xml**
     - mybatis 환경 설정 파일 활용
<br>``` --🔹-- ```
   - **StudentController.java**
     - mybatis 객체 활용(Controller)
   - **GradeController.java**
     - mybatis 객체 활용(Controller)
<br>``` --🔹-- ```
   - **StudentList.jsp**
     - View 페이지 활용(JSP)
     - 학생 명단 출력 레이아웃 구성
   - **StudentInsertForm.jsp**
     - View 페이지 활용(JSP)
     - 학생 데이터 입력 폼 구성
<br>``` --🔹-- ```
   - **GradeList.jsp**
     - View 페이지 활용(JSP)
     - 성적 리스트 출력 레이아웃 구성
   - **GradeInsertForm.jsp**
     - View 페이지 활용(JSP)
     - 성적 데이터 입력 폼 구성
<br>``` --🔹-- ```
   - **dispatcher-servlet.xml**
     - mybatis 관련 객체 등록 및 활용
   - **web.xml**
     - Front Controller 등록 및 인코딩 필터 활용

○ 사용자 최초 요청 주소
   http://localhost:3306/mybatisApp03/studentlist.action

---
-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/

---