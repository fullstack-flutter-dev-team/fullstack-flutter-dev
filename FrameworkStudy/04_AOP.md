### ■■■ AOP(Aspect Oriented Programming) ■■■
---
※ 공통의 관심 사항을 적용해서 발생하는 의존 관계의 복잡성과 코드 중복을 해소해 주는 프로그래밍 기법.

---
○ AOP 개념
   - //-- AOP에서는 보조 업무가 주인공
   - //-- 즉 aspect 라고 지칭하게 되면 보조업무를 의미한다.
   - 주 업무를 수행할 때 보조적인 업무(주 업무 실행 시간 체크, 로그 기록 등) 가 진행되어야 하는 상황이다.
   - 만약, 주 업무가 여러개이고, 동일한 보조 업무의 수행이 진행되어야 한다면,
   보조 업무 부분은 중복된 코드가 될 수 밖에 없다.
   - 이런 중복 요소를 제거하고, 보조 업무를 보다 독립적인 방법으로 실행할 수 있도록
   구성하는 것을 AOP기법 이라고 한다.
----
○ AOP 관련 주요 용어
   - **보조 업무(cross-cutting concern)**
     - 주 업무시 발생하는 보조적인 업무.
     - 주 업무와 분리 및 결합이 쉽게 이루어질 수 있도록 만들어야 한다.
   
   - 주 업무(core concern, primary concern)
     - 핵심적인 기능을 수행하는 부분.
     - 사용자의 요청에 대한 기본적인 수행 및 관련 결과를 반환해야한다.
   
   - Advice
     - 언제 어떤 공통 관심 사항(보조 업무, cross-cutting concern)을 적용할지 결정하는 방법
     //-- 어떤 위상에 삽입하는지
     - Before Advice, After Advice, Around Advice 등이 있다.
       - Before Advice
          - 보조 업무가 주 업무 실행 전에 수행되는 경우
       - After Advice
          - 보조 업무가 주 업무 실행 후에 수행되는 경우
       - Around Advice
          - 보조 업무가 주 업무 실행 전과 후에 수행되는 경우
   
   - proxy
     - //-- 틀
     - **주 업무를 실행하는 객체와 동일한 모양을 가진 가짜 객체.**
     - 사용자가 직접 주 업무를 실행하는 객체를 찾아가는 것이 아니라,
     proxy 를 찾아가도록 지정하게 된다.
     - proxy 내부에서 보조 업무를 실행한 후, 주 업무를 호출하도록 하면
     외부에서 볼 때(사용자가 체감할 때), 주 업무를 실행하는 것과 같은 결과가 나오도록 할 수 있다.
   
   - joinpoint
     - proxy 내부에서 주 업무를 호출하는 경우에 특정 지점에만 호출되도록 할 수 있다.
   
   - weaving
     - advice 를 주 업무에 적용하는 과정을 부르는 명칭.
   
   - aspect
     - 여러 주 업무 객체에 공통적으로 적용되는 공통 관심 사항(보조업무)을 aspect 라고 한다.
     - (※ 즉, 보조업무 == cross-cutting concern == 공통 관심 사항 == aspect)
-----
○ AOP 진행 순서
```
    사용자           프록시             보조업무                주업무
   (client)         (proxy)     (cross-cutting concern)    (core concern)
      ○-------------------------------------------------------->○
      ●-------①------>●
                      ●--------②-------->●
                      ●------------------③--------------------->●
                      ●<-----------------④----------------------●
                      ●--------⑤-------->●
                      
      ○<--------------------------------------------------------○
      ●<------⑥-------●
```    
  - ① 사용자는 proxy 에 접근한다.
    - 사용자 입장에서는 proxy 객체가 주 업무(core concern) 객체와 같다고 인지하게 된다.
  
  - ② proxy 객체 내부에서 보조 업무(cross-cutting concern)를 진행한다.
    - 주 업무 실행 전에 수행되는 보조 업무는 Before Advice , Around Advice 가 있다.
  
  - ③ proxy 객체 내부에서 주 업무(core concern)를 호출한다.
    - 이로 인해 주 업무가 수행된다
  
  - ④ 주 업무가 수행된(처리한) 결과 값을 반환한다.
  
  - ⑤ proxy 객체 내부에서 보조 업무(cross-cutting concern)를 진행하게 된다.
    - 주 업무기 실행된 후에 수행되는 보조 업무는 After Advice, Around Advice 가 있다.
  
  - ⑥ 사용자에게 결과값을 반환한다.(사용자가 기대한 서비스가 수행된다.)



---
### ■■■ AOP 개념 실습 01 ■■■
※ **AOP 기법을 적용하기 이전 형태의** 실습

- ○ 실습 성격 및 주요사항
  1. 콘솔 프로젝트
  2. 기본적인 산술 연산 처리 -> 주 업무 구성
  3. AOP 기법을 적용하지 않은 상태에서 처리시간측정 및 로그 처리 등의 보조 업무를 적용시켜보는 실습을 진행한다.
  5. SpringApp05
  6. 로그 자원 및 스톱워치 기능을 사용하기 위해 개별적으로 필요한 관련 jar 파일을 등록하여 실습을 진행할 수 있도록 한다.

○ 등록해야 할 jar 파일
- 경로1 : ```C:\spring-framework-3.0.2-with-docs\dist```
  - 파일1 :  ```org.springframework.core-3.0.2.RELEASE.jar```
  - (core) //-- 스톱워치 
- 경로2 : ```C:\spring-framework-3.0.2-dependencies\org.apache.commons\com.springsource.org.apache.commons.logging\1.1.1```
  - 파일2 :  ```com.springsource.org.apache.commons.logging-1.1.1.jar```
  - //-- 로그기능
  
○ 물리적 파일 구성
1. Calculator.java        → 인터페이스
2. CalculatorImpl.java    → 클래스 → 주 업무와 보조 업무 적용
3. Main.java              → 클래스 → main() 메소드를 포함하는 테스트 클래스

---

### ■■■ AOP 개념 실습 02 ■■■
※ **단순히 AOP 기법만 적용한 형태의** 실습

- ○ 실습 성격 및 주요사항
  1. 콘솔 프로젝트
  2. 기본적인 산술 연산 처리 -> 주 업무 구성
  3. AOP 기법을 적용하여 보조 업무(처리시간측정 및 로그 처리)를 적용시켜보는 실습을 진행한다.
  4. SpringApp06
  5. 로그 자원 및 스톱워치 기능을 사용하기 위해 개별적으로 필요한 관련 jar 파일을 등록하여 실습을 진행할 수 있도록 한다.

○ 등록해야 할 jar 파일
- 경로1 : ```C:\spring-framework-3.0.2-with-docs\dist```
  - 파일1 :  ```org.springframework.core-3.0.2.RELEASE.jar```
  - (core) //-- 스톱워치
- 경로2 : ```C:\spring-framework-3.0.2-dependencies\org.apache.commons\com.springsource.org.apache.commons.logging\1.1.1```
  - 파일2 :  ```com.springsource.org.apache.commons.logging-1.1.1.jar```
  -  //-- 로그기능
  
○ 물리적 파일 구성
1. Calculator.java          → 인터페이스 → 기존 소스코드 그대로 활용.
2. **CalculatorProxy.java** → 프록시 클래스 → 보조업무 적용 및 주 업무 호출.
3. CalculatorImpl.java    → 클래스 → 주 업무만 적용 →  (보조 업무 분리 → 프록시로 이관)
4. Main.java              → 클래스. → main() 메소드를 포함하는 테스트 클래스

---

### ■■■ AOP 개념 실습 03 ■■■
※ **Spring AOP 기법을 적용한 형태의** 실습

○ 실습 성격 및 주요사항
  1. 콘솔 프로젝트
  2. 기본적인 산술 연산 처리 -> 주 업무 구성
  3. Spring AOP 기법을 적용하여 보조 업무(처리시간측정 및 로그 처리)를 적용시켜보는 실습을 진행한다.
  4. SpringApp07
  5. 로그 자원 및 스톱워치 기능을 사용하기 위해 개별적으로 필요한 관련 jar 파일을 등록하여 실습을 진행할 수 있도록 한다.

○ 물리적 파일 구성
1. Calculator.java        → 인터페이스 → 기존 소스코드 그대로 활용.
2. CalculatorAspect.java  → 보조 업무 클래스 → 보조 업무 적용 및 주 업무 호출 과정
3. CalculatorImpl.java    → 클래스 → 주 업무만 적용 → 기존 소스코드 그대로 활용.
4. Main.java              → 클래스. → main() 메소드를 포함하는 테스트 클래스
5. config.xml             → 스프링 환경 설정 파일(문서)→ 객체 생성, 관리 및 DI 설정

○ 등록해야 할 jar 파일
   - (로그 기록 및 스톱워치 사용을 위해 등록한 jar 파일) ```+ 스프링 AOP 기법을 적용하기 위한 jar 파일```
- 경로1 : ```C:\spring-framework-3.0.2-with-docs\dist```
  - 파일1 :  **```org.springframework.asm-3.0.2.RELEASE.jar```**           (asm)
  - 파일2 :  **```org.springframework.beans-3.0.2.RELEASE.jar```**         (beans)
  - 파일3 :  **```org.springframework.context-3.0.2.RELEASE.jar```**       (context)
  - 파일4 :  **```org.springframework.core-3.0.2.RELEASE.jar```**          (core)
  - 파일5 :  **```org.springframework.expression-3.0.2.RELEASE.jar```**    (expression)
  - 파일6 :  **```org.springframework.aop-3.0.2.RELEASE.jar```**           (aop)
- 경로2 : ```C:\spring-framework-3.0.2-dependencies\org.apache.commons\com.springsource.org.apache.commons.logging\1.1.1```
  - 파일7 :  **```com.springsource.org.apache.commons.logging-1.1.1.jar```**
- 경로3 : ```C:\spring-framework-3.0.2-dependencies\org.aopalliance\com.springsource.org.aopalliance\1.0.0```
  - 파일8 :  **```com.springsource.org.aopalliance-1.0.0.jar```**
---


### ■■■ AOP 개념 실습 04 ■■■
※ **Spring AOP 기법을 적용한 형태의** 실습 + Before Advice 추가

※ AOP Advice
  - Advice - 언제 어떤 공통 관심사항(보조 업무, cross-cutting concern)을
          적용할지에 대한 내용을 결정하는 방법
  - Before Advice - 보조 업무가 주 업무 실행 전에 수행되는 경우 
  - After Advice  - 보조 업무가 주 업무 실행 후에 수행되는 경우
  - Around Advice - 보조 업무가 주 업무 실행 전과 후에 수행되는 경우

○ 실습 성격 및 주요사항
  1. 콘솔 프로젝트
  2. 기본적인 산술 연산 처리 -> 주 업무 구성
  3. Spring AOP 기법을 적용하여 보조 업무(처리시간측정 및 로그 처리)를 적용시켜보는 실습을 진행한다.
  4. SpringApp08
  5. 로그 자원 및 스톱워치 기능을 사용하기 위해 개별적으로 필요한 관련 jar 파일을 등록하여 실습을 진행할 수 있도록 한다.
  6. 위의 사항에 추가로 Before Advice를 적용한다.

○ 물리적 파일 구성
1. Calculator.java        → 인터페이스 → 기존 소스코드 그대로 활용.
2. CalculatorAspect.java  → 보조 업무 클래스 → 보조 업무 적용 및 주 업무 호출 과정  → 기존 소스코드 그대로 활용.
3. CalculatorImpl.java    → 클래스 → 주 업무만 적용 → 기존 소스코드 그대로 활용.
4. Main.java              → 클래스. → main() 메소드를 포함하는 테스트 클래스  → 기존 소스코드 그대로 활용.
5. config.xml             → 스프링 환경 설정 파일(문서) → 객체 생성, 관리 및 DI 설정 등
6. **CalculatorBeforeAdvice.java** → 추가. Before Advice 적용

○ 등록해야 할 jar 파일
- (로그 기록 및 스톱워치 사용을 위해 등록한 jar 파일) ```+ 스프링 AOP 기법을 적용하기 위한 jar 파일```
- 경로1 : ```C:\spring-framework-3.0.2-with-docs\dist```
  - 파일1 :  **```org.springframework.asm-3.0.2.RELEASE.jar```**           (asm)
  - 파일2 :  **```org.springframework.beans-3.0.2.RELEASE.jar```**         (beans)
  - 파일3 :  **```org.springframework.context-3.0.2.RELEASE.jar```**       (context)
  - 파일4 :  **```org.springframework.core-3.0.2.RELEASE.jar```**          (core)
  - 파일5 :  **```org.springframework.expression-3.0.2.RELEASE.jar```**    (expression)
  - 파일6 :  **```org.springframework.aop-3.0.2.RELEASE.jar```**           (aop)
- 경로2 : ```C:\spring-framework-3.0.2-dependencies\org.apache.commons\com.springsource.org.apache.commons.logging\1.1.1```
  - 파일7 :  **```com.springsource.org.apache.commons.logging-1.1.1.jar```**
- 경로3 : ```C:\spring-framework-3.0.2-dependencies\org.aopalliance\com.springsource.org.aopalliance\1.0.0```
  - 파일8 :  **```com.springsource.org.aopalliance-1.0.0.jar```**
---


### ■■■ AOP 개념 실습 05 ■■■
※ **Spring AOP 기법을 적용한 형태의** 실습 + Before Advice 추가 + After Throwing Advice 추가

※ **AOP Advice**
  - **Advice** - 언제 어떤 공통 관심사항(보조 업무, cross-cutting concern)을
          적용할지에 대한 내용을 결정하는 방법
  - Before Advice - 보조 업무가 주 업무 실행 전에 수행되는 경우 
  - After Advice  - 보조 업무가 주 업무 실행 후에 수행되는 경우
  - Around Advice - 보조 업무가 주 업무 실행 전과 후에 수행되는 경우
  - **After Throwing Advice** - 주 업무가 실행되는 과정에서 예외가 발생하였을 때 보조 업무가 수행되는 경우
  - joinpoint - Advice 가 적용되는 지점
  - pointcut - jointpoint를 좀 더 세부적으로 적용하기 위해서 jointpoint를 잘라내는 개념
  - weaving - 주 업무에 보조 업무를 결합시키는 행위(또는 그 과정)
  
※ Spring AOP 에서는 메서드 단위까지만 pointcut을 지원

○ 실습 성격 및 주요사항
  1. 콘솔 프로젝트
  2. 기본적인 산술 연산 처리 -> 주 업무 구성
  3. Spring AOP 기법을 적용하여 보조 업무(처리시간측정 및 로그 처리)를 적용시켜보는 실습을 진행한다.
  4. **SpringApp09**
  5. 로그 자원 및 스톱워치 기능을 사용하기 위해 개별적으로 필요한 관련 jar 파일을 등록하여 실습을 진행할 수 있도록 한다.
  6. 위의 사항에 추가로 Before Advice를 적용한다.
  7. 위의 사항에 추가로 After Throwing Advice를 적용한다.

○ 물리적 파일 구성
1. Calculator.java        → 인터페이스 → 기존 소스코드 그대로 활용.
2. CalculatorAspect.java  → 보조 업무 클래스 → 보조 업무 적용 및 주 업무 호출 과정  → 기존 소스코드 그대로 활용.
3. CalculatorImpl.java    → 클래스 → 주 업무만 적용 → 기존 소스코드 그대로 활용.
4. Main.java              → 클래스. → main() 메소드를 포함하는 테스트 클래스  → 기존 소스코드 그대로 활용.
5. config.xml             → 스프링 환경 설정 파일(문서) → 객체 생성, 관리 및 DI 설정 등
6. CalculatorBeforeAdvice.java  → Before Advice 적용 → 주 업무 실행 전에 실행되아야 할 보조 업무 클래스
7. **CalculatorAfterThrowing.java** → 추가. After Throwing Advice 적용

○ 등록해야 할 jar 파일
- (로그 기록 및 스톱워치 사용을 위해 등록한 jar 파일) ```+ 스프링 AOP 기법을 적용하기 위한 jar 파일```
- 경로1 : ```C:\spring-framework-3.0.2-with-docs\dist```
  - 파일1 :  **```org.springframework.asm-3.0.2.RELEASE.jar```**           (asm)
  - 파일2 :  **```org.springframework.beans-3.0.2.RELEASE.jar```**         (beans)
  - 파일3 :  **```org.springframework.context-3.0.2.RELEASE.jar```**       (context)
  - 파일4 :  **```org.springframework.core-3.0.2.RELEASE.jar```**          (core)
  - 파일5 :  **```org.springframework.expression-3.0.2.RELEASE.jar```**    (expression)
  - 파일6 :  **```org.springframework.aop-3.0.2.RELEASE.jar```**           (aop)
- 경로2 : ```C:\spring-framework-3.0.2-dependencies\org.apache.commons\com.springsource.org.apache.commons.logging\1.1.1```
  - 파일7 :  **```com.springsource.org.apache.commons.logging-1.1.1.jar```**
- 경로3 : ```C:\spring-framework-3.0.2-dependencies\org.aopalliance\com.springsource.org.aopalliance\1.0.0```
  - 파일8 :  **```com.springsource.org.aopalliance-1.0.0.jar```**
---
-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/