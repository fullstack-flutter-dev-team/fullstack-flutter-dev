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
     * 성적 조회
     * */
    public int count();
    
}
