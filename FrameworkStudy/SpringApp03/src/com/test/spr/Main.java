/**
 * =============================================================
 *  Main.java
 *   - main() 메서드를 포함하는 테스트 클래스
 * =============================================================
 */

package com.test.spr;

public class Main
{
    public static void main(String[] args) {
        // 업케스팅
//        IDAO dao = new OracleDAO();
        IDAO dao = new MssqlDAO();
        
        MemberList member = new MemberList();
        member.setDao(dao);
        
        member.print();
    }

}
