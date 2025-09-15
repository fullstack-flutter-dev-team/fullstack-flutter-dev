/**
 * ========================================================
 *   RecordViewImpl.java
 *    - 클래스
 *    - RecordView 인터페이스를 구현하는 클래스로 설계
 * ========================================================
 */
package com.test.spr;

import java.util.Scanner;

public class RecordViewImpl implements RecordView
{
    // check~!!!
    // 속성 구성 → 인터페이스 형태의 자료형 구성
     private Record record;

    @Override
    public void setRecord(Record record)
    {
        this.record = record;
    }

    @Override
    public void input()
    {
        Scanner sc = new Scanner(System.in);
        System.out.println(">> 국어 영어 수학 점수 입력(공백 구분) : ");
        String kor = sc.next();
        String eng = sc.next();
        String mat = sc.next();
        
        record.setKor(Integer.parseInt(kor));
        record.setEng(Integer.parseInt(eng));
        record.setMat(Integer.parseInt(mat));
        
        sc.close();
    }

    @Override
    public void output()
    {
        // TODO Auto-generated method stub
        System.out.println(" 국어 영어 수학 총점 평균");
        System.out.printf("%6d %5d %5d %6d %6.1f"
                        , record.getKor()
                        , record.getEng()
                        , record.getMat()
                        , record.getTot()
                        , record.getAvg());
    }

    @Override
    protected Object clone() throws CloneNotSupportedException
    {
        // TODO Auto-generated method stub
        return super.clone();
    }

    @Override
    public boolean equals(Object obj)
    {
        // TODO Auto-generated method stub
        return super.equals(obj);
    }

    @Override
    protected void finalize() throws Throwable
    {
        // TODO Auto-generated method stub
        super.finalize();
    }

    @Override
    public int hashCode()
    {
        // TODO Auto-generated method stub
        return super.hashCode();
    }

    @Override
    public String toString()
    {
        // TODO Auto-generated method stub
        return super.toString();
    }
     
     
}
