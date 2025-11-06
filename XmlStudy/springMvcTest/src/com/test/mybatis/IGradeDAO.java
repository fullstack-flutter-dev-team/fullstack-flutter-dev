/**
 *  =======================================
 *   IGradeDAO.java
 *    - 인터페이스
 *    - 성적 데이터 액션 처리 메소드 선언
 *  =======================================
 */


package com.test.mybatis;

import java.util.ArrayList;

public interface IGradeDAO
{
    /**
     *  insert 
     *  성적 등록
     *  */
    public int add(GradeDTO grade);
    
    
    /**
     *  select 
     *  성적 정보 조회
     *  */
    public ArrayList<GradeDTO> list();
    
    /*
     * select
     * 성적 레코드 수 조회
     * */
    public int count();
    
}
