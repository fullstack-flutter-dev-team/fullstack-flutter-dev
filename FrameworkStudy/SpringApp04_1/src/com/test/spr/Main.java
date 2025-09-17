/**
 * =============================================================
 *  Main.java
 *   - main() 메서드를 포함하는 테스트 클래스
 * =============================================================
 */

package com.test.spr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main
{
    public static void main(String[] args) {
        /*
        // 업케스팅
        //IDAO dao = new OracleDAO();
        IDAO dao = new MssqlDAO();
        
        MemberList member = new MemberList();
        member.setDao(dao);
        */
        
     // create and configure beans
        ApplicationContext context =
            new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});
        
     // retrieve configured instance
        MemberList member = context.getBean("memberList", MemberList.class);

        member.print();
    }

}
