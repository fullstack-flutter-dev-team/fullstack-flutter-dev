/**
 * 
 */
package com.test;

/**
 * @author sist
 *
 */
public class ScoreDTO
{
    // 주요 속성 구성
    private String sid, name;  //-- 번호(학번), 이름
    private int kor, eng, mat; //-- 국어, 영어, 수학점수
    private int tot, rank;     //-- 총점, 석차
    private double avg;        //-- 평균

    // getter / setter 구성
	/**
	 * @return the sid
	 */
	public String getSid()
	{
		return sid;
	}
	/**
	 * @param sid the sid to set
	 */
	public void setSid(String sid)
	{
		this.sid = sid;
	}
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
	 * @return the kor
	 */
	public int getKor()
	{
		return kor;
	}
	/**
	 * @param kor the kor to set
	 */
	public void setKor(int kor)
	{
		this.kor = kor;
	}
	/**
	 * @return the eng
	 */
	public int getEng()
	{
		return eng;
	}
	/**
	 * @param eng the eng to set
	 */
	public void setEng(int eng)
	{
		this.eng = eng;
	}
	/**
	 * @return the mat
	 */
	public int getMat()
	{
		return mat;
	}
	/**
	 * @param mat the mat to set
	 */
	public void setMat(int mat)
	{
		this.mat = mat;
	}
	/**
	 * @return the tot
	 */
	public int getTot()
	{
		return tot;
	}
	/**
	 * @param tot the tot to set
	 */
	public void setTot(int tot)
	{
		this.tot = tot;
	}
	/**
	 * @return the rank
	 */
	public int getRank()
	{
		return rank;
	}
	/**
	 * @param rank the rank to set
	 */
	public void setRank(int rank)
	{
		this.rank = rank;
	}
	/**
	 * @return the avg
	 */
	public double getAvg()
	{
		return avg;
	}
	/**
	 * @param avg the avg to set
	 */
	public void setAvg(double avg)
	{
		this.avg = avg;
	}

}
