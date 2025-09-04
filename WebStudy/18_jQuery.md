### ▣▣▣ jQuery(제이쿼리) ▣▣▣
---
○ 개요
- jQuery 는 빠르고 간결한 Javascript Library.
  - //-- javascript 로 할 수 있는 것은 모두 jQuery 로 가능 (그 반대도 동일)
- HTML Document traversing, 이벤트 처리, 애니메이션, 
  AJAX 를 단순화하여 빠른 웹 개발을 가능하게 한다.
  - //-- AJAX : javascript로 비동기 통신기반으로 일종의 기존의 기술을 묶어서 처리하는 개념
  - //--        별도의 독립적이고 새로운 기술인 것은 아님
  - //--        XML, HTML, Https 들을 묶어서 사용하는 것..?
- CSS 규격 지원 : CSS 1~3 와 기본 XPath 지원.
- 다양한 브라우저 지원
- 경량 파일(약 90KB 수준의 파일크기)
- John Resig 에 의해 개발 

○ jQuery 를 사용함으로써 얻을 수 있는 장점
- HTML 과 DOM, CSS 의 변경이 간편하다.
- 이벤트 처리가 간편하다.
- 애니메이션과 같은 각종 효과를 적용하기 쉽다.
- AJAX(비동기통신 기술(데이터바인딩, 기존 것을 조립해서 적용한 것..)), JSON 과 같은 처리가 간편하다
  - //-- XML : 구조화 된 데이터를 표현하는데 특화된 것
  - XML 
    - **데이터의 구조화**
    - Element들로 부모-자식 관계로 데이터를 구조화
      ```
      <name>홍길동</name>
      <age>34</age>
      <year>2025</year>
      <person mid="1">
        <name>홍길동</name>
        <age>34</age>
      </person>
      <person mid="2">
        <name>이하나</name>
        <age>24</age>
      </person>

      <JSON>
      var Obj1 = {
        name: 홍길동,
        age: 34
      }
      var Obj2 = {
        name: 이하나,
        age: 24
      }
      ```
    - 단점
      - 데이터를 표현하는데 많은 노력이 필요
  - //-- JSON : XML 의 단점
    - //         (실제 안에 들어있는 데이터 ex)   - 240(신발사이즈)일 때 다만 240 을 수식하는 ~의 신발사이즈 라고 하는 것이 용량을 더 차지함)를
    - //         좀 보완한 기술로 알아둘 것 (구조적인 표현을 잘해야 함)
    ```
    <!--
      과거에 클라이언트 입장에서(즉, 브라우저 상태에 따라서)
        <!--
          자바 스크립트 코드
        //-->
        
      자바스크립트가 돌아가는 브라우저 : 코드를 인식
      자바스크립트가 호환되지 않는 브라우저 : html주석 처리 됨
    -->
    ```
- 브라우저 호환성을 해결할 수 있다.
----
○ jQuery 다운로드 및 라이브러리 포함
- jQuery 다운로드 --// js 파일 을 다운로드 받는 것~
  - http://jquery.com/

  ```
  //-- 버전이 높을수록 고도화 된 것은 아니고,
  //-- 필요한 기능이 어느 버전에 있느냐에 따라서 해당 버전을 사용하게 되는 것
  //-- 소수점은 딱히 신경쓰지 않아도 되며, 사용한 것에 따라 x 점 대~ 사용 참조 같은 식으로 사용
- jQuery 를 사용하기 위한 라이브러리 포함
- //-- 1번으로 사용하면 네트워크에 연결되지않아도 사용가능 (2번은 항상 네트워크 필요)

  1. 로컬 PC 저장소에 물리적으로 존재할 때
     (즉, 제이쿼리 파일을 다운로드 받은 경우, 
      특정 디렉터리 안에 들어있는 경우 그 경로까지 지정해 주어야 한다.)
     <script type="text/javascript" src="jquery-x.x.x.js"></script>
  2. CDN 으로 직접 경로 지정
     <script type="text/javascript" src="http://code.jquery.com/jquery.x.x.x.js"></script>

- jQuery UI 를 사용하기 위한 CSS 및 라이브러리 포함.
  ```
  //-- 클라이언트 파트(웹 브라우저)에서 보여지는 UI 를 쉽게 하도록 
  ```
   1.로컬 PC  저장소에 물리적으로 존재할 때
   ```
     <link rel="stylesheet" href="jquery-ui.css"></link>
     <script type="text/javascript" src="jquery-x.x.x.js"></script>
     <script type="text/javascript" src="jquery-ui-x.x.x.custom.min.js"></script>
   ```
   2.CDN 으로 직접 경로 지정
   ```
     <link rel="stylesheet" href="http://code.jquery.com/x.x.x/base...css"></link>
     <script type="text/javascript" src="http://code.jquery.com/jquery....js"></script>
     <script type="text/javascript" src="http://code.jquery.com/ui/...-ui.js"></script>
   ```
   - js는 위에서 아래로 우선순위, css는 가장 가까운 위치부터 우선순윅 정해짐
---
○ jQuery 의 사용방법 (2가지)
  1. http://jquery.com/ 에서 파일을 다운로드 하여 사용하는 방법
     ※ 다운로드 받을 수 있는 종류
       - 『prodction』 버전
         - 소스를 압축해서(불필요한 공백 및 개행 제거)
           웹 서버에서 빠르게 실행할 수 있도록 경량화/최소화 한 버전
       - 『development』 버전
         - 테스트나 디버깅 또는 코드에 대한 분석을 위해
           압축을 하지 않고 가독성을 높여 놓은 버전
           - (공백 및 개행 처리가 포함되어 있음)

  2. CDN (Content Delivery Network) 을 통해 사용하는 방법
     - ※ CDN : 웹 페이지를 실행할 때 마다 공개 서버에서 네트워크를 통해
              jQuery 를 다운로드 받을 수 있도록 해주는 개념
     - 별도의 파일을 다운로드 받을 필요 없이
        ```
        『<script type="text/javascript" src="http://code.jquery.com/jquery-x.x.x.js"></script>』
        ```
        와 같은 구문을 통해 참조하여 포함시킬 수 있도록 한다.
---
○ jQuery 참조 및 학습 사이트
- http://try.jquery.com/
- http://learn.jquery.com/
- http://www.w3schools.com/jquery/

- ※ jQuery 는 자바스크립트 라이브러리 일종이다.
   『wirrte less, do more』를 통해 알 수 있듯이
   기존 자바스크립트 문장을 더 적은 라인으로 줄일 수 있다.
   또한, 라이브러리 자체도 가볍고 설치도 필요없이 사용할 수 있다.
----
---
○ jQuery 의 대표적인 선택자 3가지
- 타입 선택자(요소 선택자 : 엘리먼트 선택자)
  페이지 상의 모든 <p> 요소를 선택하고자 할 경우 다음과 같이 기술하면 된다.
  『$("p")』
- 클래스 선택자
  <p class="test"> 와 같이 클래스가 test 인 요소를 선택하고자 할 경우
  다음과 같이 기술하면 된다.
  『$(".test")』
- 아이디 선택자
  <p id="test"> 와 같이 아이디가 test 인 요소를 선택하고자 할 경우
  다음과 같이 기술하면 된다.
  『$("#test")』

○ 그 외 선택자
- 『$("*")』
  : 모든 요소를 선택한다.
- 『$(this)』
  : 현재 요소를 선택한다. (이 선택자는 따옴표 없음에 유의할 것)
- 『$("div span")』
  : <div> 요소 안에 있는 <span>요소를 선택한다.
- 『$("p.test")』
  : <p> 요소 중에서 test 클래스인 요소를 선택한다.
- 『$("p:first")』
  : 첫 번째 <p> 요소를 선택한다.
- 『$("ul li:first")』
  : 첫 번째 <ul>에서 첫 번째 <li> 요소를 선택한다.
- 『$("ul li:first-child")』
  : 모든 <ul>에서 첫 번째 <li> 요소를 선택한다.
- 『$("[href]")』
  : href 속성을 가진 모든 요소들을 선택한다.
- 『$("a[target='_blank']")』
  : 모든 <a> 요소들 중 target 속성에서 _blank 값을 가진 것들을 선택한다.
- 『$("a[target!='_blank']")』
  : 위와 반대로 _blank 값이 없는 것들을 선택한다.
- 『$(":button")』
  : 모든 <button> 요소와 모든 <input type="button"> 을 선택한다.
- 『$("tr:even")』
  : 모든 짝수 <tr> 요소를 선택한다.
- 『$("tr:odd")』
  : 모든 홀수 <tr> 요소를 선택한다.
- 『$("ul > li")』
  : <ul> 요소에서 직계 자손인 <li> 요소만 선택한다.
    (다중 리스트 구조로 되어 있을 때...)


---
-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/