### ▣▣▣ DTD(Document Type Definition) ▣▣▣
```HTML 에서의 유효성에 대한 단점을 XML 에서 보완한 것```

#### ○ 개요 
  - **```XML 문서의 엘리먼트, 속성에 대한 구조(structure)를 표현한 문서.```**
    - XML 의 명세서? 명세부 같은 느낌 -- XML 이 몸체부!
    - CSS 처럼 외부에서 HTML 을 수식해주는 도와주는 느낌은 아님!
   
  - **```DTD(Document Type Definition)는 문서의 형태를 정의하는 것```** 으로
    XML 문서의 구조를 명시적으로 선언하는 역할을 하며
    XML 문서가 잘 만들어진 유효한 문서인지를 확인하기 위해 사용하는 문서이다.
  - 따라서, DTD 를 사용하여 요소와 요소의 내용, 속성과 속성의 내용
    그리고 요소의 순서나 반복성을 미리 정해놓고 XML 문서를 작성하는 것이다.
  - 이렇게 되면 XML 문서를 작성하는 경우에 잘못된 문서를 작성하게 되는 실수를 줄일 수 있게 된다.
   
#### ○ DTD 샘플
-
  ```
  <!DOCTYPE 루트 엘리먼트
  [
  <!ELEMENT 루트 엘리먼트(1차하위엘리먼트 목록)>
  <!ELEMENT 1차 하위엘리먼트(2차하위엘리먼트 목록)>
  <!ELEMENT 2차 하위엘리먼트(#PCDATA)>
  <!ATTLIST 2차 하위엘리먼트
            속성이름 속성값 필수여부
            ...>
  ]>
  ```
    - #IMPLIED  : 이 속성값은 명시되기도 하고, 명시되지 않기도 한다.(선택적)
    - #REQUIRED : 이 속성값은 반드시 명시되어야한다.(필수)
    - #FIXED    : 이 속성값은 특정값으로 고정되어 사용된다.(고정)
   → xml 문서에 대한 설계과정
   - 대상 문서는 위의 명세부와 같이 규칙을 잘 준수해서 만들어졌어! 하고 알려주거나, 만들 때 이러한 규칙을 지켜서 만들거라는 가이드가 될 수도 있다.
   
○ DTD 와 XML 문서의 결합
   - 별도의 『.dtd』 파일을 작성한 후에 XML 문서와 연결
      ```
      // note.xml
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE note SYSTEM "Note.dtd">
      <note>
        <to>Tove</to>
        <from>Jani</from>
        <heading>Remainder</heading>
        <body>Do not forget me this weekend!</body>
      </note>
      ```

      ```
      // Note.dtd
      <!DOCTYPE note							//-- 루트 엘리먼트 note
      [
        <!ELEMENT note (to,from,heading,body)>	//-- 루트 엘리먼트 하위에 ( ) 가 있다.
        <!ELEMENT to (#PCDATA)>					//-- to 엘리먼트 하위에 (  ) 가 있다.
        <!ELEMENT from (#PCDATA)>
        <!ELEMENT heading (#PCDATA)>
        <!ELEMENT body (#PCDATA)>
      ]>
      ```
   - xml 문서 내부에 삽입 //-- 임베디드 방식
      ```
      // note.xml
      <?xml version="1.0" encoding="UTF-8"?>

      <!DOCTYPE note
      [
        <!ELEMENT note (to,from,heading,body)>
        <!ELEMENT to (#PCDATA)>
        <!ELEMENT from (#PCDATA)>
        <!ELEMENT heading (#PCDATA)>
        <!ELEMENT body (#PCDATA)>
      ]>
      ```
      ```
      <note>
          <to>Tove</to>
          <from>Jani</from>
          <heading>Remainder</heading>
          <body>Do not forget me this weekend!</body>
      </note>
      ```
---
### ▣▣▣ XML 문서의 기본 작성 및 관찰 ▣▣▣
※ 문법적으로 기본 요건을 충족한 XML 문서를 『well-formed XML』 이라고 한다.
- 루트 엘리먼트 이름은 .xml 파일 이름과 동일한 이름 사용
- 루트 엘리먼트는 하나만 사용
- 정보를 표현할 수 있는 구조화된 문서 작성
- 복수(다수)의 데이터를 표현하는 경우 중간에 적절한 부모 태그 지정
- 동일한 이름을 가진 엘리먼트인 경우 적절한 속성과 속성값 부여
- 엘리먼트 하위에는 엘리먼트(또는 데이터)만 구성
- 특수문자가 포함된 데이터인 경우 『CDATA 섹션』 으로 처리
  ```
  <tel>010-1234-1234</tel>
  → <tel><![CDATA[010-1234-1234]]></tel>

  <email>study@test.com</email>
  → <email><![CDATA[study@test.com]]></email>
  ```


<br>
<br>

---
-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/

---