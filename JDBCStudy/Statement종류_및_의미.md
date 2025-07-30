### ▣▣▣ Statement 종류 및 의미 ▣▣▣

- ▣ Statement 의 종류
    - Statement : 하나의 쿼리를 사용하고나면 더 이상 사용할 수 없다.
    - PreparedStatement : 하나의 PreparedStatement로 쿼리를 여러 번 처리할 수 있다.
    - CallableStatement : 데이터베이스 내의 스토어드 프로시저를 호출할 수 있는 Statement 이다.
  
- ▣ Statement 의 의미
    - 자바에서 사용되는 3가지 종류의 Statement들은 데이터베이스로 쿼리를 담아서 보내는 그릇 정도로 상상할 수 있다.
    - 즉, Statement에 쿼리를 실어 데이터베이스로 보내면 DB에서 처리되는 것이다.
    - 이 때, 한 번 사용하고 버리는 그릇은 Statement 이며,
    재사용이 가능한 그릇은 PreparedStatement이다.

