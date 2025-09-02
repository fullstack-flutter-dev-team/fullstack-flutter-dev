/**
 * ====================================
 *   MyData.java
 *    - 사용자 정의 데이터 타입 활용
 * ====================================
 */


package com.test;

public class MyData
{
    // 주요 속성 구성
    private String name;
    private int age;
    
    // 생성자 -> default 생성자 형태의 사용자 정의 생성자
    public MyData() {
        
    }
    
    //-> 생성자 -> 매개변수 2개인 사용자 정의 생성자
    public MyData(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    // getter / setter
    /**
     * @return the name
     */
    public String getName()
    {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name)
    {
        this.name = name;
    }

    /**
     * @return the age
     */
    public int getAge()
    {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(int age)
    {
        this.age = age;
    }
    
    
}
