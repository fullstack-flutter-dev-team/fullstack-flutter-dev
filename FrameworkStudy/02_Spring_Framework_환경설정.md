### ▣▣▣ Spring Framework 환경설정 ▣▣▣
---
※ 스프링 프레임워크(Spring Framework) 구성을 위해
   스프링 프레임워크 관련 리소스를 다운로드 받아야 하는데
   **http://www.spring.io** 경로에 접근하여 확인해보면
   다운로드 받을 수 있는 경로를 찾을 수 없는 상태이다.
   (STS 연동 (Maven 활용)만 가능한 상태...)

○ 적용 및 테스트가 원활한 버전으로 실습 환경 구성 (비 STS)
    - ① spring-framework-3.0.2-wiht-docs.zip
        - 기본적인 스프링 프레임워크 구성에 필요한 필수적인 jar 파일과 
      스프링 프레임워크 설명문서(pdf 버전, html 버전)가 포함된 항목,
      스프링 원래의 jar 파일들
    - ② spring-framework-3.0.2-dependencies.zip
     - 스프링 프레임워크 구성에 의존성을 가진 jar 파일들이 포함된 항목,
      어떤 기능을 수행하는냐에 따라 추가적으로 필요한 항목.
      스프링이 참조하는 의존 jar 파일들~!!!

※ 주의 
    - 다운로드 받은 두개의 압축 파일은 C:\ 또는 D:\ 드라이브 루트에
   폴더를 생성하여 압축을 풀어놓는다.
   그 안에 들어있는 jar 파일들을 선택적으로 복사하여 사용할 예정이기 떄문애
   쉬운 경로에 압축을 풀어놓는다는 의미도 있지만
   압축을 해제하는 과정에서 이름(경로포함)이 길어서 특정 파일에 대해
   제대로 압축을 해제하지 못하고 오류가 발생하기 때문에
   간단한 경로에서 압축을 해제할 수 있도록 한다.

---
### ■■■ IoC/DI 관련 실습 01 ■■■
※ **스프링 프레임워크 없이 IoC/DI** 개념 실습

- ○ 실습 성격 및 주요사항
  1. 콘솔 프로젝트
  2. 성적 처리
     - 국어, 영어, 수학 점수를 입력 받아 총점, 평균을 출력하는 프로그램
  3. SpringApp01

- ○ 물리적 파일 구성
  1. Record.java         → 인터페이스
  2. RecordView.java     → 인터페이스
  3. RecordImpl1.java    → 클래스, Record 인터페이스를 구현하는 클래스
  4. RecordImpl2.java    → 클래스, Record 인터페이스를 구현하는 클래스
  5. RecordViewImpl.java → 클래스, RecordView 인터페이스를 구현하는 클래스
  6. Main.java → 클래스, main() 메소드를 포함하는 테스트 클래스

---
### ■■■ IoC/DI 관련 실습 02 ■■■
※ **스프링 프레임워크 적용 IoC/DI** 개념 실습

- ○ 실습 성격 및 주요사항
  1. 콘솔 프로젝트
  2. 성적 처리
     - 국어, 영어, 수학 점수를 입력 받아 총점, 평균을 출력하는 프로그램
  3. SpringApp02

#### ※ 스프링 자원을 활용할 수 있도록 기본 환경 구성
   1. 프로젝트 명 마우스 우클릭
   2. Build Path > Configure Build Path ... 메뉴 선택
   3. Libraries 탭 선택 > Add External JARs ...버튼 선택
   4. 필요한 jar 파일을 해당 프로젝트에 외부 라이브러리로 등록
      - 경로 1 → ```C:\spring-framework-3.0.2-with-docs\dist```
        - 파일 1 → **org.springframework.asm-3.0.2.RELEASE.jar**
        - 파일 2 → **org.springframework.beans-3.0.2.RELEASE.jar**
        - 파일 3 → **org.springframework.context-3.0.2.RELEASE.jar**
        - 파일 4 → **org.springframework.core-3.0.2.RELEASE.jar**
        - 파일 5 → **org.springframework.expression-3.0.2.RELEASE.jar**
      - 경로 2 → ```C:\spring-framework-3.0.2-dependencies\org.apache.commons```
          - ```C:\spring-framework-3.0.2-dependencies\org.apache.commons```
            - ```\com.springsource.org.apache.commons.logging\1.1.1```
        - 파일 6 → **com.springsource.org.apache.commons.logging-1.1.1.jar**
   5. **스프링 프레임워크의 환경 설정 파일은 기본적으로 XML 형식으로 생성**
        - annotation 방식은 유연성을 해침. XML 형식으로 사용 권장
        - 생성 위치는 프로젝트 하위의 src 디렉터리 (현재 실습 환경은 콘솔이므로...)
        - 현재 실습 환경에서의 파일 이름은 사용자가 임의로 부여해서 생성하는 것이 가능한 상황
        - → 『src > **applicationContext.xml**』
   6. 생성한 applicationContext.xml 파일에
        - 스프링이 관리하게(참조하게) 될 객체에 대한 정보와 DI 설정을 추가하게 되며
      이와 같은 문서의 구성을 위해 스프링에서 제공하는 문서 참조
        - 참조 경로 → ```C:\spring-framework-3.0.2-with-docs\docs\spring-framework-reference\htmlsingle```
        - 참조 파일 → spring-framework-reference.xml
        - 참조 위치 → ```III. Core Technologies```
          - ```3. The IoC container```
          - ```3.2 Container overview```
          - ```3.2.1. Configuration metadata```
          - → 링크로 이동하면 xml 샘플 파일을 확인할 수 있으며,
            - 이 내용을 복사하여 applicationContext.xml에 덮어쓰기(전체 선택 후 붙여넣기)

- ○ 물리적 파일 구성
  1. Record.java         → 인터페이스 → 기존 소스코드(SpringApp01) 활용
  2. RecordView.java     → 인터페이스 → 기존 소스코드(SpringApp01) 활용
  3. RecordImpl1.java    → 클래스, Record 인터페이스를 구현하는 클래스 → 기존 소스코드(SpringApp01) 활용
  4. RecordImpl2.java    → 클래스, Record 인터페이스를 구현하는 클래스 → 기존 소스코드(SpringApp01) 활용
  5. RecordViewImpl.java → 클래스, RecordView 인터페이스를 구현하는 클래스 → 기존 소스코드(SpringApp01) 활용
  6. Main.java → 클래스, main() 메소드를 포함하는 테스트 클래스  → 수정(check~!!!)
  7. applicationContext.xml  → 프로젝트 > src 폴더 하위에 생성(현재 파일의 이름은 임의로 지정 가능)

---
-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/