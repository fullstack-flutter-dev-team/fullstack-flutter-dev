package com.test.mybatis;

import java.util.ArrayList;

public interface IStudentDAO
{
    
    /** 
     * insert
     * 학생 등록 
     * */
    public int add(StudentDTO student);
    
    /** 
     * select
     * 학생 정보 조회 
     * */
    public ArrayList<StudentDTO> list();
    
    /** 
     * select
     * 학생 수 조회 
     * */
    /*select*/
    public int count();
    

}
