### ▣▣▣ JSP 데이터 송수신 실습 ▣▣▣
```
ex) 
Aaa.html   → Bbb.jsp
Aaa.html   → Bbb.java(Servlet)
Aaa.jsp    → Bbb.jsp
Aaa.jsp    → Bbb.java(Servlet)
Aaa.java(Servlet)    → Bbb.jsp
Aaa.java(Servlet)    → Bbb.java(Servlet)
```

- 일반적으로 이 과정에서
    - Aaa 페이지에서는 [form] 태그 및 action, method 속성 필요
      - [input] 이나 [button] 태그의 type="submit" 속성 필요
    - Bbb 페이지에서는 request 객체의 getParameter() 메소드 필요

 1. request 내부 객체
    - request 객체는 웹 브라우저에서 JSP(또는 Servlet) 페이지로 전달되는 정보의 모임으로
      HTTP 헤더와 HTTP 바디로 구성되며, 웹 컨테이너는 요청된 HTTP 메세지를 통해
      HTTPServletRequest 객체 타입인 request 객체로 사용된다.
    - //-- doPost 등의 parameter HttpServletRequest 와 HttpServletResponse response 를 의미
    - 즉, request 객체는 웹 브라우저가 JSP(또는 Servlet) 페이지로 보낸 내용에 대한 정보를 갖고 있는 내부 객체인 것이다.
  
 2. String getParameter(name)
     - 이름이 name 인 파라미터에 할당된 값을 반환하며, 지정된 파라미터 값이 없으면 null 을 반환한다.  
     - 파라미터(name) 자체가 없을 때도 null
  
  3. String[] getParameterValues(name)
     - 이름이 name 인 파라미터의 모든 값을 String 배열로 반환한다.
     - 주로 checkbox 등 동일한 이름을 사용하는 form 태그 엘리먼트의 값을 반환받기 위해 사용한다.
  
  4. void setCharacterEncoding(encode)
     - 전송된 데이터의 문자 인코딩 방식을 지정한다.
     - 요청 객체를 받아왔을 때 request 상태일 때 미리 인코딩하여 get Parameter로 가져와서 사용할 수 있다. (한글의 경우만 신경 쓰면 된다.)

---
-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/