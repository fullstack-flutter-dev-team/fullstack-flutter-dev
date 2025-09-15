/**
 * =================================
 *  RecordImpl1.java
 *   - 클래스
 *   - Record 인터페이스를 구현하는 클래스
 *   - 
 * =================================
 */
package com.test.spr;

public class RecordImpl2 implements Record
{
    // 주요 속성 구성
    private int kor, eng, mat;

    @Override
    public void setKor(int kor)
    {
        this.kor = kor;
        
    }

    @Override
    public int getKor()
    {
        return kor;
    }

    @Override
    public void setEng(int eng)
    {
        this.eng = eng;
        
    }

    @Override
    public int getEng()
    {
        return eng;
    }

    @Override
    public void setMat(int mat)
    {
        this.mat = mat;
    }

    @Override
    public int getMat()
    {
        return mat;
    }

    @Override
    public int getTot()
    {
        int result = 0;
        
        // 기본 점수(태도) 추가 → RecordImpl1의 업무와 차별화
//        result = this.getKor() + this.getEng() + this.getMat();
        result = 100 + this.getKor() + this.getEng() + this.getMat();
        
        return result;
    }

    @Override
    public double getAvg()
    {
        double result = 0;
        
        // 기본 점수(태도) 추가된 상태에서의 평균 처리 → RecordImpl1의 업무와 차별화
//        result = this.getTot() / 3.0;
        result = this.getTot() / 4.0;
        return result;
    }

    @Override
    protected Object clone() throws CloneNotSupportedException
    {
        // TODO Auto-generated method stub
        return super.clone();
    }

    @Override
    public boolean equals(Object arg0)
    {
        // TODO Auto-generated method stub
        return super.equals(arg0);
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
