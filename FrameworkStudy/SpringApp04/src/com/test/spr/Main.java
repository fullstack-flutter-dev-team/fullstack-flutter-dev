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
        /* -------------------------------------
        // 업케스팅
        // IDAO dao = new OracleDAO();
        IDAO dao = new MssqlDAO();
        
        MemberList member = new MemberList();
        member.setDao(dao);
        ---------------------------------------- */
        
        // ※ 객체 생성 과정을 스프링(스프링 컨테이너, IoC컨테이너)이 담당하게 되므로
        //    인스턴스 생성 구문 및 객체 전달 과정을 모두 삭제한다.

        // 스프링 환경 설정 파일로 구성한 『applicationContext.xml』 로 부터
        // member(→ MemberList) 객체를 얻어올 수 있도록 처리한다.
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        
        // MemberList member = (MemberList)context.getBean("member");
        MemberList member = context.getBean("member", MemberList.class);
        member.print();
    }

}
