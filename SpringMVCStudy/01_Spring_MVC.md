### ▣▣▣ Spring MVC ▣▣▣
---
1. 웹 개발을 위한 MVC 패턴이 적용된 Spring Framework
   - Spring 에서는 **DispatcherServlet** 클래스가 컨트롤러 역할을 수행하게 된다.
     - 스프링에서는 서블릿이 여려개가 존재.....?
   - //-- 클라이언트 방문시 직원(view) 직접 만나지 않고
   - //-- 큰 빌딩의 인포데스크가 관리(dispatcher-servlet) - 해당 회사에 팀 담당자(servlet)에 연락 
   - //--           ---------------- 이게 스프링(프론트 컨트롤러)       ---------(사용자 정의 컨트롤러)
2. Spring MVC 의 주요 구성요소
   - **DispatcherServlet**
     - //-- 스프링(프론트 컨트롤러) , 지정되어있는 이름
     - 클라이언트의 요청을 전달받는다.
     - Controller(사용자 정의 컨트롤러)에 클라이언트의 요청을 전달하고,
     - Controller가 반환한 결괏값을 View에 전달하여
     - 적절한 응답을 생성할 수 있도록 처리한다.
   - **HandlerMapping**
     - 클라이언트의 요청 URL을 어떤 Controller가 처리할지 결정한다.
   - **Controller**
     - 사용자 정의 Controller. 액션 처리. **(→ 우리가 작성)**
     - FrontController 와 다수의 사용자 정의 Controller
   - **ModelAndView**
     - View 객체 정보와 결괏값이 들어있는 객체.
   - **ViewResolver**
     - 요청에 대한 처리 결과를 보여줄 View 를 결정한다.
   - **view**
     - 요청에 대한 처리 결과를 보여줄 응답(결과 출력)을 생성한다. **(→ 우리가 작성)**
   - **web.xml**
     - DispatcherServlet 객체 등록.  **(→ 우리가 작성)**
     - **FrontController 등록**
     - //-- *.action 이라는 주소요청이 온다면
     - //-- (원래는) 해당 서블릿으로 보내~
     - //-- → (대신에) 모두 DispatcherServlet 으로 보내 라고 작업하게 됨
   - **dispatcher-servlet.xml**
     - Controller 객체 등록. **(→ 우리가 작성)**
     - 사용자 정의 Controller 등록
     - //-- 프론트 컨트롤러를 제어할 수 있는 작업지시서 작성 하는 곳
     - //-- 지정되어있는 이름
     - //-- web.xml 에서 넘어오면
     - //-- hi.action 이면 해당 사용자 정의 컨트롤러로 가라
     - //-- bye.action 이면 해당 사용자 정의 컨트롤러로 가라 
     - //-- 이러한 작업들을 기재하게 된다.
     
3. Spring MVC 실행 흐름
   - 사용자 요청 → DispatcherServlet
   - DispatcherServlet → HandlerMapping 에 주소 분석 요청 
     - //-- ex) hi.action 인지 ...  찾아서 업무 분배 → 특정 컨트롤러에
   - DispatcherServlet → 특정 Controller 객체 호출 및 결과 수신.
      - 결과는 ModelAndView 객체.
        - ※ ModelAndView 객체
          - View 객체 정보와 결과 값이 들어있는 객체
   - DispatcherServlet → ViewResolver 에 View 객체 분석 요청.
   - DispatcherServlet → 특정 View 객체에 Model 객체를 넘겨주고 결과 출력.

4. Spring MVC 에서 우리가 해야할 일
   - **Controller**
     - //-- 사용자 정의 컨트롤러
     - 액션 처리를 담당하는 Controller 클래스 설계(작성)
     - Annotation 을 사용하지 않을 경우, Controller 인터페이스를 구현하여 작성
   - **View**
     - 결과 출력용 JSP 페이지 작성
   - **web.xml**
     - 서블릿 주소와 DispatcherServlet 객체 등록
   - **dispatcher-servlet.xml**
     - 우리가 작성한 Controller 객체 등록
     - URL 매핑 주소 등록
```
※ Spring 이 스트럿츠를 비롯하여 다양한 웹 프레임워크와 비교적 연동이 잘 되는 편이기는 하지만
   서로 다른 두 프레임워크를 연동하기 위해서는 설정의 중복 등 개발과정에서 불편함이 존재할 수 밖에 없다.
   따라서, Spring 이 자체적으로 제공하는 MVC 프레임워크를 사용하게 되면
   Spring 이 제공하는 AOP, 트랜잭션 처리, IoC/DI 등의 기능을 그대로 사용하면서 
   MVC 패턴에 기반하여 웹 어플리케이션을 개발할 수 있다.
   또한, 다른 프레임워크와 Spring 을 연동하기 위해서 설정을 중복해서 적용해야 한다든지...
   하는 개발과정에서 나타나는 불편을 해소할 수 있게 된다.
```
---
### ■■■ Spring MVC 프로젝트 실습01 ■■■
- ○ Perspective
   - JavaEE

- ○ 다이나믹 웹 프로젝트 생성
   - mvcApp01
   - (STS - 스프링 / 스프링 레거시 / 스프링 부트 / 스프링 MVC ...)

- ○ 톰캣 서버 등록 및 포트(port)설정
   - port 8080 → 8090 → 3306 / URIEncoding="UTF-8" → **server.xml**
   - ```Tomcat_server > server.xml``` (#63 ~ 67)
      ```
      <Connector URIEncoding="UTF-8" connectionTimeout="20000" maxParameterCount="1000" port="3306" protocol="HTTP/1.1" redirectPort="8443"/>
      ```

- ○ 기타 환경 설정
   - 폰트, 줄번호, 편집 포맷, 인코딩 방식, 템플릿 등... →  **epf 파일 import**

- ○ Spring MVC 환경 설정을 위한 기본적인 라이브러리 등록(14개 파일)
   - **WebContent > WEB-INF > lib 경로에 등록**
   - 경로1 → **```C:\spring-framework-3.0.2-with-docs\dist```**
      - 파일1  → ```org.springframework.aop-3.0.2.RELEASE.jar```              → aop
      - 파일2  → ```org.springframework.asm-3.0.2.RELEASE.jar```              → asm
      - 파일3  → ```org.springframework.beans-3.0.2.RELEASE.jar```            → beans
      - 파일4  → ```org.springframework.context-3.0.2.RELEASE.jar```          → context
      - 파일5  → ```org.springframework.core-3.0.2.RELEASE.jar```             → core
      - 파일6  → ```org.springframework.expression-3.0.2.RELEASE.jar```       → expression
      - 파일7  → ```org.springframework.jdbc-3.0.2.RELEASE.jar```             → jdbc
      - 파일8  → ```org.springframework.transaction-3.0.2.RELEASE.jar```      → trasaction
      - 파일9  → ```org.springframework.web.servlet-3.0.2.RELEASE.jar```      → servlet
      - 파일10 → ```org.springframework.web-3.0.2.RELEASE.jar```              → web
   - 경로2 → **```C:\spring-framework-3.0.2-dependencies\org.apache.commons\com.springsource.org.apache.commons.logging\1.1.1```**
      - 파일11 → ```com.springsource.org.apache.commons.logging-1.1.1.jar```  → logging
   - 경로3 → **```C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib```**
              (오라클 설치 경로)
      - 파일12 → ```ojdbc6.jar```         → ojdbc6
   - 경로4 → **```C:\Downloads\13_JSTL\jakarta-taglibs-standard-1.1.2\lib```**
     - 파일13 → ```jstl.jar```            → jstl
     - 파일14 → ```standard.jar```        → standard

※ **WebContent > WEB-INF > lib 경로에 xml 파일 생성**
   - → 『dispatcher-servlet.xml』
   - 『dispatcher-servlet.xml』 파일을 WebContent > WEB-INF 경로에 생성한다
   - 그리고 이 파일의 기본 설정 내용(템플릿)을 구성하기 위해
   - 스프링 DOC 의 내용을 참고해서 작성할 수 있도록 한다.
     - 경로       →  **```C:\spring-framework-3.0.2-with-docs\docs\spring-framework-reference\pdf```**
     - 파일       →  **```spring-framework-reference.pdf```**
     - 내용(위치) →  문서 구조성 425 페이지 (실제 내용 상 450 페이지)
       - 해당 위치로 이동하면 XML 파일에 대한 샘플 코드가 있다.
       -    이 내용을 복사하여 dispatcher-servelet.xml 파일의 기본 템플릿으로 작성한다.
            - 내용(위치)
              - V.The Web → P.441
                - 15.Web MVC framework → P.442
                  - 15.3 Implementing Controllers → P.449
                    - Defining a controller with @Controller → P.450
         ```
         <?xml version="1.0" encoding="UTF-8"?>
         <beans xmlns="http://www.springframework.org/schema/beans"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns:p="http://www.springframework.org/schema/p"
         xmlns:context="http://www.springframework.org/schema/context"
         xsi:schemaLocation="
         http://www.springframework.org/schema/beans
         http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
         http://www.springframework.org/schema/context
         http://www.springframework.org/schema/context/spring-context-3.0.xsd">
         <context:component-scan base-package="org.springframework.samples.petclinic.web"/>
         // ...
         </beans>
         ```

○ 물리적 파일 구성
   - HelloController.java
   - Hello.jsp
   - dispatcher-servlet.xml
   - web.xml
   - hello.action → 빈_파일
   - 
○ 사용자 최초 요청 주소 
   - http://localhost:3306/mvcApp01/hello.action

###### 다이나믹 웹 프로젝트 생성 → 서버 → server.xml → preference import → Spring MVC 환경 설정을 위한 라이브러리 등록 → dispatcher-servlet.xml 생성 → 템플릿 내용 넣기 → 파일 구성


※ mvcApp01 프로젝트의 실행 및 처리 과정 정리
   - ① 외부요청
      - http://localhost:3306/mvc01/hello.action
      - → web.xml 관여
         (→ Front Controller 등록 → DispatcherServlet 등록)
   - ② DispatcherServlet 요청 접수
      - → web.xml → DispatcherServlet 등록
      -   web.xml → URL 패턴 등록        
      - → dispatcher-servlet.xml 관여
         - (→ 사용자 요청 분석 → 특정 컨트롤러 지정)
   - ③ **해당 컨트롤러(HelloController)** 의 **특정 메소드(handleRequest)** 호출 (액션 처리, ModelAndView 객체 반환)
      - → 사용자의 요청에 적합한 서비스 액션 처리
      - → 결과 데이터가 들어있는 모델 객체 준비
      - → View 정보(JSP 페이지 정보) 반환
         - → 여기서는 객체가 아닌 경로 포함된 View 페이지의 이름
   - ④ View 페이지에서 최종 웹 페이지를 작성
      - → JSP 페이지 내에서 EL 이나 JSTL 등의 표기 사용 가능
   - ⑤ 응답 완료
---

### ■■■ Spring MVC 프로젝트 실습02 ■■■
- ○ Perspective
   - JavaEE

- ○ 다이나믹 웹 프로젝트 생성
   - mvcApp02
   - (STS - 스프링 / 스프링 레거시 / 스프링 부트 / 스프링 MVC ...)

- ○ **mvcApp00 으로 부터 src, WebContent 디렉터리 복사&붙여넣기로 대체**
  - 톰캣 서버 등록 및 포트(port)설정
  - 기타 환경 설정, 
  - Spring MVC 환경 설정을 위한 기본적인 라이브러리 등록 및 설정,
  - dispatcher-servlet.xml 파일 구성
  - web.xml 파일 구성

- ○ 톰캣 서버 등록 및 포트(port)설정
   - port 8080 → 8090 → 3306 / URIEncoding="UTF-8" → **server.xml**
   - ```Tomcat_server > server.xml``` (#63 ~ 67)
      ```
      <Connector URIEncoding="UTF-8" connectionTimeout="20000" maxParameterCount="1000" port="3306" protocol="HTTP/1.1" redirectPort="8443"/>
      ```

- ○ 기타 환경 설정
   - 폰트, 줄번호, 편집 포맷, 인코딩 방식, 템플릿 등... →  **epf 파일 import**

- ○ Spring MVC 환경 설정을 위한 기본적인 라이브러리 등록(14개 파일)
   - **WebContent > WEB-INF > lib 경로에 등록**
   - 경로1 → **```C:\spring-framework-3.0.2-with-docs\dist```**
      - 파일1  → ```org.springframework.aop-3.0.2.RELEASE.jar```              → aop
      - 파일2  → ```org.springframework.asm-3.0.2.RELEASE.jar```              → asm
      - 파일3  → ```org.springframework.beans-3.0.2.RELEASE.jar```            → beans
      - 파일4  → ```org.springframework.context-3.0.2.RELEASE.jar```          → context
      - 파일5  → ```org.springframework.core-3.0.2.RELEASE.jar```             → core
      - 파일6  → ```org.springframework.expression-3.0.2.RELEASE.jar```       → expression
      - 파일7  → ```org.springframework.jdbc-3.0.2.RELEASE.jar```             → jdbc
      - 파일8  → ```org.springframework.transaction-3.0.2.RELEASE.jar```      → trasaction
      - 파일9  → ```org.springframework.web.servlet-3.0.2.RELEASE.jar```      → servlet
      - 파일10 → ```org.springframework.web-3.0.2.RELEASE.jar```              → web
   - 경로2 → **```C:\spring-framework-3.0.2-dependencies\org.apache.commons\com.springsource.org.apache.commons.logging\1.1.1```**
      - 파일11 → ```com.springsource.org.apache.commons.logging-1.1.1.jar```  → logging
   - 경로3 → **```C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib```**
              (오라클 설치 경로)
      - 파일12 → ```ojdbc6.jar```         → ojdbc6
   - 경로4 → **```C:\Downloads\13_JSTL\jakarta-taglibs-standard-1.1.2\lib```**
     - 파일13 → ```jstl.jar```            → jstl
     - 파일14 → ```standard.jar```        → standard

※ **WebContent > WEB-INF > lib 경로에 xml 파일 생성**
   - → 『dispatcher-servlet.xml』
   - 『dispatcher-servlet.xml』 파일을 WebContent > WEB-INF 경로에 생성한다
   - 그리고 이 파일의 기본 설정 내용(템플릿)을 구성하기 위해
   - 스프링 DOC 의 내용을 참고해서 작성할 수 있도록 한다.
     - 경로       →  **```C:\spring-framework-3.0.2-with-docs\docs\spring-framework-reference\pdf```**
     - 파일       →  **```spring-framework-reference.pdf```**
     - 내용(위치) →  문서 구조성 425 페이지 (실제 내용 상 450 페이지)
       - 해당 위치로 이동하면 XML 파일에 대한 샘플 코드가 있다.
       -    이 내용을 복사하여 dispatcher-servelet.xml 파일의 기본 템플릿으로 작성한다.
            - 내용(위치)
              - V.The Web → P.441
                - 15.Web MVC framework → P.442
                  - 15.3 Implementing Controllers → P.449
                    - Defining a controller with @Controller → P.450
         ```
         <?xml version="1.0" encoding="UTF-8"?>
         <beans xmlns="http://www.springframework.org/schema/beans"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns:p="http://www.springframework.org/schema/p"
         xmlns:context="http://www.springframework.org/schema/context"
         xsi:schemaLocation="
         http://www.springframework.org/schema/beans
         http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
         http://www.springframework.org/schema/context
         http://www.springframework.org/schema/context/spring-context-3.0.xsd">
         <context:component-scan base-package="org.springframework.samples.petclinic.web"/>
         // ...
         </beans>
         ```

○ 물리적 파일 구성
   - SendController.java      → 컨트롤러 객체
   - Send.jsp                 → 뷰 객체
   - 
   - ReceiveController.java   → 컨트롤러 객체
   - Receive.jsp              → 뷰 객체
   - 
   - dispatcher-servlet.xml   → 컨트롤러 객체 등록 / URL매핑 주소 등록
   - web.xml                  → DisppatcherServlet 객체 등록 / URL매핑 주소 등록
   - send.do
  
○ 사용자 최초 요청 주소
   - http://localhost:3306/mvcApp02/send.do

###### 다이나믹 웹 프로젝트 생성 → 서버 → server.xml → preference import → Spring MVC 환경 설정을 위한 라이브러리 등록 → dispatcher-servlet.xml 생성 → 템플릿 내용 넣기 → 파일 구성


※ mvcApp01 프로젝트의 실행 및 처리 과정 정리
   - ① 외부요청
      - http://localhost:3306/mvcApp02/hello.action
      - → web.xml 관여
         (→ Front Controller 등록 → DispatcherServlet 등록)
   - ② DispatcherServlet 요청 접수
      - → web.xml → DispatcherServlet 등록
      -   web.xml → URL 패턴 등록        
      - → dispatcher-servlet.xml 관여
         - (→ 사용자 요청 분석 → 특정 컨트롤러 지정)
   - ③ **해당 컨트롤러(HelloController)** 의 **특정 메소드(handleRequest)** 호출 (액션 처리, ModelAndView 객체 반환)
      - → 사용자의 요청에 적합한 서비스 액션 처리
      - → 결과 데이터가 들어있는 모델 객체 준비
      - → View 정보(JSP 페이지 정보) 반환
         - → 여기서는 객체가 아닌 경로 포함된 View 페이지의 이름
   - ④ View 페이지에서 최종 웹 페이지를 작성
      - → JSP 페이지 내에서 EL 이나 JSTL 등의 표기 사용 가능
   - ⑤ 응답 완료
---

### ■■■ Spring MVC 프로젝트 실습03 ■■■
- ○ Perspective
   - JavaEE

- ○ 다이나믹 웹 프로젝트 생성
   - mvcApp03
   - (STS - 스프링 / 스프링 레거시 / 스프링 부트 / 스프링 MVC ...)

- ○ **mvcApp00 으로 부터 src, WebContent 디렉터리 복사&붙여넣기로 대체**
  - 톰캣 서버 등록 및 포트(port)설정
  - 기타 환경 설정, 
  - Spring MVC 환경 설정을 위한 기본적인 라이브러리 등록 및 설정,
  - dispatcher-servlet.xml 파일 구성
  - web.xml 파일 구성

- ○ 톰캣 서버 등록 및 포트(port)설정
   - port 8080 → 8090 → 3306 / URIEncoding="UTF-8" → **server.xml**
   - ```Tomcat_server > server.xml``` (#63 ~ 67)
      ```
      <Connector URIEncoding="UTF-8" connectionTimeout="20000" maxParameterCount="1000" port="3306" protocol="HTTP/1.1" redirectPort="8443"/>
      ```

- ○ 기타 환경 설정
   - 폰트, 줄번호, 편집 포맷, 인코딩 방식, 템플릿 등... →  **epf 파일 import**


- ○ 실습 성격
  - 데이터 송수신 관련 실습(Spring MVC 버전)
  - JDBC 모듈 추가 활용
  - SimpleDriverDataSource 객체 활용

- ○ 기능 구현
  - 사용자로부터 이름, 전화번호 데이터를 입력받아 데이터베이스에 저장
  - 저장된 이름, 전화번호 항목을 데이터베이스로부터 읽어 화면에 구성

- ○ 사전 작업
  - TBL_MEMBERLIST 테이블 구성
  - MEMBERLISTSEQ 시퀀스 생성
  - 샘플 데이터 입력
  

- ○ 기본 레이아웃(페이지 화면 구성)
   ```
      이름 [         ]       → <input type="text">
      전화 [         ]       → <input type="text">
        < 회원 추가 >        → <button type="button">

      전체 인원 수 : 2명      → <p>...</p>
      --------------------   → <table>...</table>
      번호  이름  전화번호
      1    노.. 010...
      2    박.. 010...
      --------------------
   ```
  
- ○ Spring MVC 환경 설정을 위한 기본적인 라이브러리 등록(14개 파일)
   - **WebContent > WEB-INF > lib 경로에 등록**
   - 경로1 → **```C:\spring-framework-3.0.2-with-docs\dist```**
      - 파일1  → ```org.springframework.aop-3.0.2.RELEASE.jar```              → aop
      - 파일2  → ```org.springframework.asm-3.0.2.RELEASE.jar```              → asm
      - 파일3  → ```org.springframework.beans-3.0.2.RELEASE.jar```            → beans
      - 파일4  → ```org.springframework.context-3.0.2.RELEASE.jar```          → context
      - 파일5  → ```org.springframework.core-3.0.2.RELEASE.jar```             → core
      - 파일6  → ```org.springframework.expression-3.0.2.RELEASE.jar```       → expression
      - 파일7  → ```org.springframework.jdbc-3.0.2.RELEASE.jar```             → jdbc
      - 파일8  → ```org.springframework.transaction-3.0.2.RELEASE.jar```      → trasaction
      - 파일9  → ```org.springframework.web.servlet-3.0.2.RELEASE.jar```      → servlet
      - 파일10 → ```org.springframework.web-3.0.2.RELEASE.jar```              → web
   - 경로2 → **```C:\spring-framework-3.0.2-dependencies\org.apache.commons\com.springsource.org.apache.commons.logging\1.1.1```**
      - 파일11 → ```com.springsource.org.apache.commons.logging-1.1.1.jar```  → logging
   - 경로3 → **```C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib```**
              (오라클 설치 경로)
      - 파일12 → ```ojdbc6.jar```         → ojdbc6
   - 경로4 → **```C:\Downloads\13_JSTL\jakarta-taglibs-standard-1.1.2\lib```**
     - 파일13 → ```jstl.jar```            → jstl
     - 파일14 → ```standard.jar```        → standard

※ **WebContent > WEB-INF > lib 경로에 xml 파일 생성**
   - → 『dispatcher-servlet.xml』
   - 『dispatcher-servlet.xml』 파일을 WebContent > WEB-INF 경로에 생성한다
   - 그리고 이 파일의 기본 설정 내용(템플릿)을 구성하기 위해
   - 스프링 DOC 의 내용을 참고해서 작성할 수 있도록 한다.
     - 경로       →  **```C:\spring-framework-3.0.2-with-docs\docs\spring-framework-reference\pdf```**
     - 파일       →  **```spring-framework-reference.pdf```**
     - 내용(위치) →  문서 구조성 425 페이지 (실제 내용 상 450 페이지)
       - 해당 위치로 이동하면 XML 파일에 대한 샘플 코드가 있다.
       -    이 내용을 복사하여 dispatcher-servelet.xml 파일의 기본 템플릿으로 작성한다.
            - 내용(위치)
              - V.The Web → P.441
                - 15.Web MVC framework → P.442
                  - 15.3 Implementing Controllers → P.449
                    - Defining a controller with @Controller → P.450
         ```
         <?xml version="1.0" encoding="UTF-8"?>
         <beans xmlns="http://www.springframework.org/schema/beans"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns:p="http://www.springframework.org/schema/p"
         xmlns:context="http://www.springframework.org/schema/context"
         xsi:schemaLocation="
         http://www.springframework.org/schema/beans
         http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
         http://www.springframework.org/schema/context
         http://www.springframework.org/schema/context/spring-context-3.0.xsd">
         <context:component-scan base-package="org.springframework.samples.petclinic.web"/>
         // ...
         </beans>
         ```

○ 물리적 파일 구성
   - mvcApp03_scott.sql 
     - → 데이터베이스 관련 객체 구성 및 실습 데이터 준비
   - MemberDTO.java  
     - → 사용자 정의 자료형 클래스(DTO 활용)
   - IMemberDAO.java 
     - → 인터페이스
   - MemberDAO.java
      - → 데이터베이스 액션 처리 클래스
      - → Connection 객체에 대한 의존성 주입
      - → (의존성 주입을 위한 준비 필요)
   - MemberListController.java
      - → 사용자 정의 컨트롤러 클래스
      - → 리스트 출력 액션
      - → DAO 객체에 대한 의존성 주입 
      - → (의존성 주입을 위한 준비 필요)
   - MemberList.jsp 
     - → 회원 리스트 출력용 뷰
     - → 회원 데이터 입력(추가) 폼 화면 구성
  
   - MemberInsertController.java 
      - → 사용자 정의 컨트롤러 클래스
      - → 회원 데이터 추가 액션
      - → DAO 객체에 대한 의존성 주입
      - → (의존성 주입을 위한 준비 필요 → setter 메소드 구성)
   
  - dispatcher-servlet.xml 
      - → 컨트롤러 객체 등록
      - → URL 매핑 주소 등록
      - → SimpleDriverDataSource 객체 등록
      - → 의존 객체 주입 설정 
      - → DAO 객체 등록
         ```
            <!-- DataSource -->
            <!-- → SimpleDataSource -->
            <bean id="localDataSource" class="org.springframework.jdbc.datasource.SimpleDriverDataSource">
               <property name="driverClass" value="oracle.jdbc.driver.OracleDriver"></property>
               <property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"></property>
               <property name="username" value="scott"></property>
               <property name="password" value="tiger"></property>
            </bean>
         ```

  - web.xml
    - → DispatcherServlet 객체 등록
    - → URL 매핑 주소 등록

   - memberlist.do
      - → 이클립스 실행 과정에서 요청을 위한 빈 파일
  
○ 사용자 최초 요청 주소
   - http://localhost:3306/mvcApp03/memberlist.do

###### 다이나믹 웹 프로젝트 생성 → 서버 → server.xml → preference import → Spring MVC 환경 설정을 위한 라이브러리 등록 → dispatcher-servlet.xml 생성 → 템플릿 내용 넣기 → 파일 구성


※ mvcApp01 프로젝트의 실행 및 처리 과정 정리
   - ① 외부요청
      - http://localhost:3306/mvc01/hello.action
      - → web.xml 관여
         (→ Front Controller 등록 → DispatcherServlet 등록)
   - ② DispatcherServlet 요청 접수
      - → web.xml → DispatcherServlet 등록
      -   web.xml → URL 패턴 등록        
      - → dispatcher-servlet.xml 관여
         - (→ 사용자 요청 분석 → 특정 컨트롤러 지정)
   - ③ **해당 컨트롤러(HelloController)** 의 **특정 메소드(handleRequest)** 호출 (액션 처리, ModelAndView 객체 반환)
      - → 사용자의 요청에 적합한 서비스 액션 처리
      - → 결과 데이터가 들어있는 모델 객체 준비
      - → View 정보(JSP 페이지 정보) 반환
         - → 여기서는 객체가 아닌 경로 포함된 View 페이지의 이름
   - ④ View 페이지에서 최종 웹 페이지를 작성
      - → JSP 페이지 내에서 EL 이나 JSTL 등의 표기 사용 가능
   - ⑤ 응답 완료
---

### ■■■ Spring MVC 프로젝트 실습04 ■■■
- ○ Perspective
   - JavaEE

- ○ 다이나믹 웹 프로젝트 생성
   - mvcApp04
   - (STS - 스프링 / 스프링 레거시 / 스프링 부트 / 스프링 MVC ...)

- ○ **mvcApp00 으로 부터 src, WebContent 디렉터리 복사&붙여넣기로 대체**
  - 톰캣 서버 등록 및 포트(port)설정
  - 기타 환경 설정, 
  - Spring MVC 환경 설정을 위한 기본적인 라이브러리 등록 및 설정,
  - dispatcher-servlet.xml 파일 구성
  - web.xml 파일 구성

- ○ 톰캣 서버 등록 및 포트(port)설정
   - port 8080 → 8090 → 3306 / URIEncoding="UTF-8" → **server.xml**
   - ```Tomcat_server > server.xml``` (#63 ~ 67)
      ```
      <Connector URIEncoding="UTF-8" connectionTimeout="20000" maxParameterCount="1000" port="3306" protocol="HTTP/1.1" redirectPort="8443"/>
      ```

- ○ 기타 환경 설정
   - 폰트, 줄번호, 편집 포맷, 인코딩 방식, 템플릿 등... →  **epf 파일 import**


- ○ 실습 성격
  - 데이터 송수신 관련 실습(Spring MVC 버전)
  - JDBC 모듈 추가 활용
  - SimpleDriverDataSource 객체 활용

- ○ 기능 구현(데이터 각 유형별 CRUD 실습)
   - 직원 정보 출력, 입력, 수정, 삭제 기능 구현.
   - 지역 정보 출력, 입력, 수정, 삭제 기능 구현.
   - 부서 정보 출력, 입력, 수정, 삭제 기능 구현.
   - 직위 정보 출력, 입력, 수정, 삭제 기능 구현.
   - 로그인 / 로그아웃 기능 구현
      - → 관리자 및 일반 직원 로그인 구분.
      - ==> Spring MVC, JSP/Servlet, Oracle, HTML/CSS/Javascript, AJAX, jQuery, EL, JSTL 표현 등 사용.

- ○ 사전 작업
   - → 테이블 및 시퀀스, 주요 쿼리문, 샘플 데이터 등 구성
     - EMPLOYEE  → 직원
     - REGION    → 지역
     - DEPARTMEN → 부서
     - POSITION  → 직위
     - 샘플 데이터 → 입력...
     - 주요 쿼리문 구성
  
- ○ Spring MVC 환경 설정을 위한 기본적인 라이브러리 등록(14개 파일)
   - **WebContent > WEB-INF > lib 경로에 등록**
   - 경로1 → **```C:\spring-framework-3.0.2-with-docs\dist```**
      - 파일1  → ```org.springframework.aop-3.0.2.RELEASE.jar```              → aop
      - 파일2  → ```org.springframework.asm-3.0.2.RELEASE.jar```              → asm
      - 파일3  → ```org.springframework.beans-3.0.2.RELEASE.jar```            → beans
      - 파일4  → ```org.springframework.context-3.0.2.RELEASE.jar```          → context
      - 파일5  → ```org.springframework.core-3.0.2.RELEASE.jar```             → core
      - 파일6  → ```org.springframework.expression-3.0.2.RELEASE.jar```       → expression
      - 파일7  → ```org.springframework.jdbc-3.0.2.RELEASE.jar```             → jdbc
      - 파일8  → ```org.springframework.transaction-3.0.2.RELEASE.jar```      → trasaction
      - 파일9  → ```org.springframework.web.servlet-3.0.2.RELEASE.jar```      → servlet
      - 파일10 → ```org.springframework.web-3.0.2.RELEASE.jar```              → web
   - 경로2 → **```C:\spring-framework-3.0.2-dependencies\org.apache.commons\com.springsource.org.apache.commons.logging\1.1.1```**
      - 파일11 → ```com.springsource.org.apache.commons.logging-1.1.1.jar```  → logging
   - 경로3 → **```C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib```**
              (오라클 설치 경로)
      - 파일12 → ```ojdbc6.jar```         → ojdbc6
   - 경로4 → **```C:\Downloads\13_JSTL\jakarta-taglibs-standard-1.1.2\lib```**
     - 파일13 → ```jstl.jar```            → jstl
     - 파일14 → ```standard.jar```        → standard

※ **WebContent > WEB-INF > lib 경로에 xml 파일 생성**
   - → 『dispatcher-servlet.xml』
   - 『dispatcher-servlet.xml』 파일을 WebContent > WEB-INF 경로에 생성한다
   - 그리고 이 파일의 기본 설정 내용(템플릿)을 구성하기 위해
   - 스프링 DOC 의 내용을 참고해서 작성할 수 있도록 한다.
     - 경로       →  **```C:\spring-framework-3.0.2-with-docs\docs\spring-framework-reference\pdf```**
     - 파일       →  **```spring-framework-reference.pdf```**
     - 내용(위치) →  문서 구조성 425 페이지 (실제 내용 상 450 페이지)
       - 해당 위치로 이동하면 XML 파일에 대한 샘플 코드가 있다.
       -    이 내용을 복사하여 dispatcher-servelet.xml 파일의 기본 템플릿으로 작성한다.
            - 내용(위치)
              - V.The Web → P.441
                - 15.Web MVC framework → P.442
                  - 15.3 Implementing Controllers → P.449
                    - Defining a controller with @Controller → P.450
         ```
         <?xml version="1.0" encoding="UTF-8"?>
         <beans xmlns="http://www.springframework.org/schema/beans"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns:p="http://www.springframework.org/schema/p"
         xmlns:context="http://www.springframework.org/schema/context"
         xsi:schemaLocation="
         http://www.springframework.org/schema/beans
         http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
         http://www.springframework.org/schema/context
         http://www.springframework.org/schema/context/spring-context-3.0.xsd">
         <context:component-scan base-package="org.springframework.samples.petclinic.web"/>
         // ...
         </beans>
         ```

○ 물리적 파일 구성
   - #00. mvcApp04_scott.sql 
     - → 데이터베이스 관련 객체 구성 및 실습 데이터 준비
   - #01. Employee.java
     - DTO 개념 활용 (→ DTO 계층)
     - 직원 데이터 자료형 클래스.
   - #02. Department.java 
     - DTO 개념 활용 (→ DTO 계층)
     - 부서 데이터 자료형 클래스.
   - #03. Region.java 
     - DTO 개념 활용 (→ DTO 계층)
     - 지역 데이터 자료형 클래스.
   - #04. Position.java 
     - DTO 개념 활용 (→ DTO 계층)
     - 직위 데이터 자료형 클래스.
   - #05. IEmployeeDAO.java 
     - → 인터페이스.
   - #06. IDepartmentDAO.java
     - → 인터페이스.
   - #07. IRegionDAO.java
     - → 인터페이스.
   - #08. IPositionDAO.java
     - → 인터페이스.
   - #09 EmployeeDAO.java 
      - → 데이터베이스 액션 처리 클래스
      - 직원 데이터 CRUD 액션(직원 데이터 출력, 입력, 수정, 삭제 액션)
      - Connection 객체에 대한 의존성 주입 준비
      - (인터페이스 속성 구성 / setter 구성)

   - #10 DepartmentDAO.java 
      - → 데이터베이스 액션 처리 클래스
      - 부서 데이터 CRUD 액션
      - Connection 객체에 대한 의존성 주입 준비
      - (인터페이스 속성 구성 / setter 구성)

   - #11. RegionDAO.java 
      - → 데이터베이스 액션 처리 클래스
      - 지역 데이터 CRUD 액션
      - Connection 객체에 대한 의존성 주입 준비
      - (인터페이스 속성 구성 / setter 구성)

   - #12. PositionDAO.java 
      - → 데이터베이스 액션 처리 클래스
      - 직위 데이터 CRUD 액션
      - Connection 객체에 대한 의존성 주입 준비
      - (인터페이스 속성 구성 / setter 구성)

   - #13. EmployeeMenu.jsp 
      - → 메인 메뉴 뷰 페이지.
      - 직원 관리, 부서 관리, 지역 관리, 직위 관리
      - 로그아웃 기능 포함.
  
   - #14. menuStyle.css 
      - → 메뉴 스타일 구성.

   - #15. EmployeeList.jsp 
     - → 직원 리스트 출력 페이지.
  
   - $16. main.css 
     - → 메인 스타일 구성.

   - #17. EmployeeListController.java
       - → 사용자 정의 컨트롤러 클래스
       - 직원 리스트 컨트롤러 
       - 리스트 페이지 요청에 대한 액션 처리
       - (employeelist.action) 리스트 출력 액션
       - (의존성 주입을 위한 준비 필요)
       - DAO 객체에 대한 의존성 주입(DI)을 위한 준비
         - 인터페이스 형태의 자료형 속성으로 구성
         - setter 구성 

   - #17. IMemberDAO.java → 인터페이스
     - MemberDAO.java 
     - → 데이터베이스 액션 처리 클래스
      - Connection 객체에 대한 의존성 주입
      - (의존성 주입을 위한 준비 필요)
   - #18. web.xml
     - → DispatcherServlet 객체 등록
     -  URL 매핑 주소 등록

   - #19. dispatcher-servlet.xml 
      - → 컨트롤러 객체 등록
      - URL 매핑 주소 등록
      - SimpleDriverDataSource 객체 등록
      - 의존 객체 주입 설정 
      - DAO 객체 등록

   - #20. EmployeeInsertFormController.java
      - (employeeinsertform.action)
      - → 직원 데이터 입력 폼 컨트롤러
      - 
   - #21. EmployeeInsertForm.jsp
     - 직원 데이터 입력 폼 뷰 페이지

   - #22. AjaxController.java
      - (ajax.action)
      - AJAX 요청 컨트롤러
  
   - #23. Ajax.jsp
      - 

   - #24. EmployeeInsertController.java
      - (employeeinsert.action)
      - 직원 데이터 입력 액션 컨트롤러
    - 
   - #25. EmployeeUpdateForm.jsp
     - 직원 데이터 수정 폼 뷰 페이지

   - #26. EmployeeUpdateFormController.java
     - (employeeupdateform.action)
     - 직원 데이터 수정 폼 컨트롤러

   - #27. EmployeeUpdateController.java
     - (employeeupdate.action)
     - 직원 데이터 수정 액션 컨트롤러
  
   - #28. EmployeeDeleteController.java
     - (employeedelete.action)
     - 직원 데이터 삭제 액션 컨트롤러

   - #29. LoginForm.jsp
     - 관리자, 일반사원 로그인 폼 뷰 페이지
     - ID(employeeId), PW(주민번호 뒤 7자리) 입력

   - #30. LoginFormController.java
     - 로그인 폼 컨트롤러
     - loginform.action
  
   - #31. LoginController.java
     - 로그인 액션 컨트롤러
     - login.action
```
로그인 →  관리자   → employeelist.action
         일반직원  → emplist.action
```

   - employeelist.action → 이클립스 실행 과정에서 요청을 위한 빈 파일

   - Ajax.jsp

   - #32. LogoutController.java
     - 로그아웃 액션 컨트롤러
     - logout.action

   - #33. EmpList.jsp
     - 직원 리스트 출력 페이지
     - 일반 직원이 접근하는 직원 데이터 출력 페이지
     - emplist.action

   - #34. EmpListController.java
     - 직원 리스트 출력 액션 컨트롤러
     - emplist.action
  
   - RegionListController.java
     - 지역 리스트 출력 액션 컨트롤러
     - regionList.action
 
   - RegionList.jsp
     -  지역 리스트 뷰
     -  regionlist.action
  
   - RegionInsertFormController.java
     -  지역 등록 폼 컨트롤러
     - regionInsertFrom.action

   - RegionInsertForm.jsp
     -  지역 등록 폼 뷰

   - RegionInsertController.java
     -  지역 등록 액션 컨트롤러
     - regionInsert.action

   - RegionUpdateFormController.java
     -  지역 변경 폼 컨트롤러
     - regionUpdateForm.action

   - RegionUpdateForm.jsp
     -  지역 변경 폼 뷰

   - RegionUpdateController.java
     -  지역 변경 액션 컨트롤러
     - regionUpdate.action

   - RegionDeleteController.java
     -  지역 삭제 액션 컨트롤러
     - regionDelete.action

   - DepartmentListController.java
     -  부서 리스트 조회 액션 컨트롤러
     - departmentlist.action

   - DepartmentList.jsp
     -  부서 리스트 뷰
     -  departmentlist.action

   - DepartmentInsertFormController.java
     -  부서 등록 폼 컨트롤러
     - departInsertForm.action

   - DepartmentInsertForm.jsp
     -  부서 등록 폼 뷰

   - DepartmentInsertController.java
     -  부서 등록 액션 컨트롤러
     - departInsert.action

   - DepartmentUpdateFormController.java
     -  부서 변경 폼 액션 컨트롤러
     - departUpdateForm.action

   - DepartmentUpdateForm.jsp
     -  부서 변경 폼 뷰

   - DepartmentUpdateController.java
     -  부서 변경 액션 컨트롤러
     - departUpdate.action

   - DepartmentDeleteController.java
     -  부서 삭제 액션 컨트롤러
     - departDelete.action

   - PositionListController.java
     - 직위 리스트 컨트롤러
     - positionlist.action

   - PositionList.jsp
     -  직위 리스트 뷰
     -  positionlist.action

   - PositionInsertFormController.java
     - 직위 등록 액션 컨트롤러
     - positionInsertForm.action

   - PositionInsertForm.jsp
     - 직위 등록 폼 뷰

   - PositionInsertController.java
     -  직위 등록 액션 컨트롤러
     - positionInsert.action

   - PositionUpdateFormController.java
     -  직위 변경 폼 컨트롤러
     - positionUpdateForm.action

   - PositionUpdateForm.jsp
     - 직위 변경 폼 뷰

   - PositionUpdateController.java
     -  직위 변경 액션 컨트롤러
     - positionUpdate.action

   - PositionDeleteController.java
     -  직위 삭제 액션 컨트롤러
     - positionDelete.action
  
  - dispatcher-servlet.xml 
      - → 컨트롤러 객체 등록
      - → URL 매핑 주소 등록
      - → SimpleDriverDataSource 객체 등록
      - → 의존 객체 주입 설정 
      - → DAO 객체 등록
         ```
            <!-- DataSource -->
            <!-- → SimpleDataSource -->
            <bean id="localDataSource" class="org.springframework.jdbc.datasource.SimpleDriverDataSource">
               <property name="driverClass" value="oracle.jdbc.driver.OracleDriver"></property>
               <property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"></property>
               <property name="username" value="scott"></property>
               <property name="password" value="tiger"></property>
            </bean>
         ```

  - web.xml
    - → DispatcherServlet 객체 등록
    - → URL 매핑 주소 등록

   - memberlist.do
      - → 이클립스 실행 과정에서 요청을 위한 빈 파일
  
○ 사용자 최초 요청 주소
   http://localhost:3306/mvcApp04/employeelist.action → 관리자
   http://localhost:3306/mvcApp04/emplist.action → 일반직원

###### 다이나믹 웹 프로젝트 생성 → 서버 → server.xml → preference import → Spring MVC 환경 설정을 위한 라이브러리 등록 → dispatcher-servlet.xml 생성 → 템플릿 내용 넣기 → 파일 구성


※ mvcApp01 프로젝트의 실행 및 처리 과정 정리
   - ① 외부요청
      - http://localhost:3306/mvc01/hello.action
      - → web.xml 관여
         (→ Front Controller 등록 → DispatcherServlet 등록)
   - ② DispatcherServlet 요청 접수
      - → web.xml → DispatcherServlet 등록
      -   web.xml → URL 패턴 등록        
      - → dispatcher-servlet.xml 관여
         - (→ 사용자 요청 분석 → 특정 컨트롤러 지정)
   - ③ **해당 컨트롤러(HelloController)** 의 **특정 메소드(handleRequest)** 호출 (액션 처리, ModelAndView 객체 반환)
      - → 사용자의 요청에 적합한 서비스 액션 처리
      - → 결과 데이터가 들어있는 모델 객체 준비
      - → View 정보(JSP 페이지 정보) 반환
         - → 여기서는 객체가 아닌 경로 포함된 View 페이지의 이름
   - ④ View 페이지에서 최종 웹 페이지를 작성
      - → JSP 페이지 내에서 EL 이나 JSTL 등의 표기 사용 가능
   - ⑤ 응답 완료
---

-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/