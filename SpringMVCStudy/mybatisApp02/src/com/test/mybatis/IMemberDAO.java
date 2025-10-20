package com.test.mybatis;

import java.util.ArrayList;

/**
 * =====================================
 *   ISampleDAO.java
 *    - 인터페이스
 * =====================================
 */
public interface IMemberDAO
{
    /* insert */
    public int add(MemberDTO m);
    
    /*select*/
    public int count();
    
    /* select */
    public ArrayList<MemberDTO> list();

}
