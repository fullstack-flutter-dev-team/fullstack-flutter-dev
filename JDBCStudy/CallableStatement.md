### ▣▣▣ CallableStatement ▣▣▣

```
CallableStatement ?
CallableStatement 인터페이스는 모든 DBMS에 대한 표준 방법으로 저장 프로시저(stored procedure)를 호출하는 방법을 제공하는 인터페이스이며, 호출은 두 가지 형태 중 하나인 escape 문법으로 작성되어진다.
 
결과 매개변수를 가지는 형태와 결과 매개변수가 없는 형태 두 가지로 나뉘며 OUT 매개변수의 종류인 결과 매개변수는 저장 프로시저에 대한 리턴값이다. 두 형태 모두 IN 매개변수(입력), OUT 매개변수(출력), INOUT 매개변수(입출력)를 위해 사용되어지는 매개변수의 변수 번호를 가지며  『 ? 』 는 매개변수의 저장 위치로 나타낸다.

형식 및 구조
CallableStatement를 활용하여 JDBC에서 저장 프로시저를 호출하는 문법은 다음과 같다.
- 매개변수가 없는 저장 프로시저 호출
{call procedure_name}
- IN 매개변수를 리턴하는 프로시저 호출
{call procedure_name[ ( ?, ?, ... ) ]}
- OUT 매개변수를 리턴하는 프로시저 호출
{? = call procedure_name[ ( ?, ?, ... ) ]}

CallableStatement 객체 생성
CallableStatement 객체는 Connection의 『 prepareCall() 』 메소드에 의해 생성된다.
 
예를 들어 두 개의 인자값을 가지고 있으며 결과 매개변수가 없는 저장 프로시저 procData를 호출하는 방법은 다음과 같다.

CallableStatement cstmt = conn.preparedCall(" {call procData( ?, ? )}");
// 물음표(『 ? 』)의 위치가 IN, OUT, INOUT 매개변수 중 어떤 것인가 하는 것은 
// 저장 프로시저 procData에 의존한다


IN, OUT 매개변수
CallableStatement 객체로 IN 매개변수를 넘겨주는 것은 PreparedStatement로 부터 상속받은 『 setXxx() 』 메소드이다. 예를 들면, setFloat() 메소드는 float 값을 넘겨주게 되는 것이다.
 
만약, 저장 프로시저가 OUT 매개변수를 리턴한다면 각 OUT 매개변수의 SQL형(Type)은 CallableStatement 객체를 실행할 수 있는 상태가 되기 전에 등록되어져야 한다. 이는 몇몇 DBMS들이 SQL 형(Type)을 필요로 하기 때문이다. 이 때, SQL 형(Type)을 등록하는 것은 『 registerOutParameter() 』 메소드를 사용하게 된다. 
그리고, SQL 구문이 실행된 다음에 CallableStatement의 『 getXxx() 』메소드는 매개변수의 값을 검색하며, 사용되는 『 getXxx() 』메소드는 그 매개변수를 위해 등록되어진 SQL에 상승하는 자바 형(Type)이다. 즉, 『 registerOutParameter() 』 메소드는 SQL 타입을 사용하고 『 getXxx() 』 메소드는 이것을 자바 타입으로 형변황(cast) 하는 것이다.
 
예를 들어 다음과 같이 커서를 반환하는 프로시저가 있다고 가정하자.

CREATE OR REPLACE PROCEDURE PRC_MEMBERSELECT 
(  VRESULT OUT SYS_REFCURSOR ) 
IS 
BEGIN     
OPEN VRESULT FOR     
SELECT SID, NAME, TEL     
FROM TBL_MEMBER     
ORDER BY SID;
     --CLOSE VRESULT;  --> 외부로부터 커서를 받아올때는 커서를 닫으면 안된다. END;
출처: https://lipcoder.tistory.com/452 [기록공간:티스토리]
```




- [JDBC [JAVA] : Statement,PreparedStatement and CallableStatement](https://www.linkedin.com/pulse/jdbc-java-statementpreparedstatement-youssef-najeh)
![image](https://media.licdn.com/dms/image/v2/C4D12AQHC384iTcMcjg/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1520083735879?e=2147483647&v=beta&t=-unnTU76VA6sFHAGR_Eq1Z2ty71LYA_uLS5byZ3EgYA)
- [Interface PreparedStatement](https://docs.oracle.com/javase/8/docs/api/java/sql/PreparedStatement.html)
```


-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/