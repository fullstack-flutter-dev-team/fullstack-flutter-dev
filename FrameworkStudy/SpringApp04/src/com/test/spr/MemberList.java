/**
 * =============================================================
 *  MemberList.java
 *   - DAO 를 참조하는 클래스
 *   - 의존관계 설정을 위한 준비.
 *   - 리스트 출력 메서드(→ print()) 구현.
 * =============================================================
 */

package com.test.spr;

public class MemberList
{
    // check~!!!
    // 주요 속성 구성 → 인터페이스 형태의 자료형
    private IDAO dao;

    // check~!!!
    // setter 구성
    public void setDao(IDAO dao)
    {
        this.dao = dao;
    }
    
    // 리스트 출력 메서드 구현
    public void print() {
        try {
            for (MemberDTO dto : dao.list()) {
                System.out.printf("%10s %4s %15s %15s\n"
                                    , dto.getId()
                                    , dto.getName()
                                    , dto.getTel()
                                    , dto.getEmail());
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

}
