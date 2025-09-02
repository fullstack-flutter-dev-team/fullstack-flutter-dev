/**
 * ==============================
 *  DBCPConn.java
 *   - 
 * ==============================
 */
package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
    
    // 주요 속성 구성
    //-- 싱글톤 패턴 디자인으로 구성
    private static Connection conn = null;
            
    public static Connection getConnection() {
        if (conn == null) {
            try {
                // ○ 컨텍스트(Context) 얻어내기
                //-- → 이름과 객체를 바인딩 하는 형태로
                //      컨텍스트를 얻어내기 위한 객체 생성 
                //      컨텍스트를 얻어내는 가장 쉬운 방법은
                //     『javax.naming.InitialContext()』 클래스의
                //     인스턴스를 생성하는 것이다. → new InitialContext()
                //--  javax.naming.Context 인지 확인!
                //  등록한 context 를 사용할 수 있도록 등록하는 과정
                //   이렇게 얻어낸 컨텍스트(Context)를 활용하여        
                //   이름과 객체를 바인딩하게 된다.
                Context ctx = new InitialContext();
                
                //   ※ javax.naming.InitialContext 의 주요 메소드
                //      - bind(String str, Object obj)
                //        : 서비스할 객체를 특정 이름으로 등록한다.
                //      - rebind(String str, Object obj)
                //        : 서비스할 객체를 특정 이름으로 다시 등록한다.
                //      - list(String str)
                //        : 특정 이름으로 서비스하는 객체 정보를 반환한다.
                //      - unbinding(String str)
                //        : 등록된 객체를 메모리에서 해제(제거)한다.
                //      - Object lookup(String str)
                //        : 서비스 중인 객체 정보를 얻어온다.

                
                //-- 컨텍스트의 범위를 점점 좁혀나가는 구문
                // 『web.xml』로부터 환경 설정을 얻어올 수 있도록 하겠다는 의미의 코딩
                //-- 현재의 설정에서는 다른 형태로 변경 불가!!!!!!!!
                
                //-- 환경 설정에대한 부분은 context.xml 이 아닌 
                //   web.xml 을 통해 사용가능한지 서버 시작 시 확인하기 때문에
                //-- Context evt = (Context)ctx.lookup("web.xml 로 부터 서비스중인 객체 정보를 얻어와");
                //-- comp (컴포넌트) env(environment 환경) 
                Context evt = (Context)ctx.lookup("java:/comp/env");
                
                // 『web.xml』 내에서 『"jdbc/myOracle"』으로 등록된 
                //  객체 정보를 얻어오겠다는 의미
                DataSource ds = (DataSource)evt.lookup("jdbc/myOracle");

                // DataSource 로 부터 Connection 을 얻어오겠다는 의미
                conn = ds.getConnection();
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }
        
        return conn;
    }
    
    public static void close() {
        if (conn != null) {
            try {
                if (!conn.isClosed()) {
                    conn.close();
                }
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }
        
        conn = null;
    }

}

//--※ url 보다 조금 더 큰 개념 uri 
//--※ 컨텐츠 보다 조금 더 크고 깊이 있는 개념 Context(컨텍스트)
