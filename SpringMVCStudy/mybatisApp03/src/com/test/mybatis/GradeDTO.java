package com.test.mybatis;

public class GradeDTO
{
    // 주요 속성 구성 → TBL_GRADE 테이블 레코드
    String sid, sub1, sub2, sub3;

    // setter / getter 구성
    public String getSid()
    {
        return sid;
    }

    public void setSid(String sid)
    {
        this.sid = sid;
    }

    public String getSub1()
    {
        return sub1;
    }

    public void setSub1(String sub1)
    {
        this.sub1 = sub1;
    }

    public String getSub2()
    {
        return sub2;
    }

    public void setSub2(String sub2)
    {
        this.sub2 = sub2;
    }

    public String getSub3()
    {
        return sub3;
    }

    public void setSub3(String sub3)
    {
        this.sub3 = sub3;
    }

    @Override
    public String toString()
    {
        return "GradeDTO [sid=" + sid + ", sub1=" + sub1 + ", sub2=" + sub2 + ", sub3=" + sub3 + "]";
    }
    
}
