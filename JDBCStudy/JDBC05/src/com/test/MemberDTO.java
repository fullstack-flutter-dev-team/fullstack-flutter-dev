/** ==================================
 *    MemberDTO.java
 *     - 속성만 존재하는 클래스
 *     - MemberVO / MemberDTO
 *     - Bean 규약 -> 컴포넌트 구성
 *  ==================================
 */
package com.test;

/**
 * @author sist
 *
 */
public class MemberDTO
{
    // 주요 속성 구성
    private String sid, name, tel;

    // getter / setter 구성
    public String getSid()
    {
        return this.sid;
    }

    public void setSid(String sid)
    {
        this.sid = sid;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getTel()
    {
        return tel;
    }

    public void setTel(String tel)
    {
        this.tel = tel;
    }
    
    
}
