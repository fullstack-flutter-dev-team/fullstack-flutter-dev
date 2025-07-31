### ▣▣▣ PreparedStatement ▣▣▣
- [JDBC [JAVA] : Statement,PreparedStatement and CallableStatement](https://www.linkedin.com/pulse/jdbc-java-statementpreparedstatement-youssef-najeh)
![image](https://media.licdn.com/dms/image/v2/C4D12AQHC384iTcMcjg/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1520083735879?e=2147483647&v=beta&t=-unnTU76VA6sFHAGR_Eq1Z2ty71LYA_uLS5byZ3EgYA)
- [Interface PreparedStatement](https://docs.oracle.com/javase/8/docs/api/java/sql/PreparedStatement.html)
```
1. JDBC에서 Statement의 execute 메소드는 
   문자열로 구성된 SQL 구문을 DBMS로 전달하는 역할을 수행하며, 
   내부적으로 SQL 구문을 JDBC 드라이버가 읽을 수 있는 형식으로 전처리(precompile)하게 된다.
   
   이후 드라이버는 DBMS에 전처리된 요구사항을 전송하게 된다. 
   SQL 구문을 매번 전처리 과정을 거쳐서 전송하게 되기 때문에 
   반복적인 작업에서 속도가 느려질 수 있는 한계를 가지고 있다.

   이에 반해, PreparedStatement는 전처리된 Statement로 주어진 SQL문을 미리 전처리 과정을 
   거친 상태로 보관해 두기 때문에 반복적인 작업을 수행하는데 있어 매우 유리하다.

   Statement의 하위 객체인 PreparedStatement는
   Statement의 모든 기능을 상속받으며 
   IN 매개변수의 위치에 데이터베이스로 전송되어질 값을 지정하기 위해서
   필요한 전체 모든 메소드들의 집합을 포함시킨다. 
   
   또한 세 개의 메소드 [execute(), executeUpdate(), executeQuery()] 는
   아무런 파라미터도 가지지 않는다.
   이러한 메소드들의 Statement 형태 (즉, SQL문 매개변수를 가지는 형태)는
   PreparedStatement 객체에서 사용되지 않는다.

   매개변수로 넘겨주는 과정과 메소드 호출시 SQL 쿼리문을 매개변수로 받지 않는다는 차이점을 제외하면 PreparedStatement는 기본적으로 Statement의 사용법과 동일하다.

2. IN 매개변수 넘겨주기
   PreparedStatement 객체를 실행하기 전에 
   각 『?』 매개변수의 값이 설정되어 있어야 한다.
   이것은 『setXxx()』 메소드를 호출하여 이루어지게 되며
   『Xxx』는 매개변수에 대한 알맞은 형(Type)이다. 
   『setXxx()』 메소드의 첫 번째 인자는 설정된 매개변수의 순번이고,
   두 번째 인자는 매개변수가 설정될 값이다. 
```

- 출처: https://lipcoder.tistory.com/451 [기록공간:티스토리] 

-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/