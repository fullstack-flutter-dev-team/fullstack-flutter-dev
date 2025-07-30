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
    String sid, name, kor, eng, mat, tot, avg;

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
    public String getKor()
    {
        return kor;
    }

    /**
     * @param kor the kor to set
     */
    public void setKor(String kor)
    {
        this.kor = kor;
    }

    /**
     * @return the eng
     */
    public String getEng()
    {
        return eng;
    }

    /**
     * @param eng the eng to set
     */
    public void setEng(String eng)
    {
        this.eng = eng;
    }

    /**
     * @return the mat
     */
    public String getMat()
    {
        return mat;
    }

    /**
     * @param mat the mat to set
     */
    public void setMat(String mat)
    {
        this.mat = mat;
    }

    /**
     * @return the tot
     */
    public String getTot()
    {
        return tot;
    }

    /**
     * @param tot the tot to set
     */
    public void setTot(String tot)
    {
        this.tot = tot;
    }

    /**
     * @return the avg
     */
    public String getAvg()
    {
        return avg;
    }

    /**
     * @param avg the avg to set
     */
    public void setAvg(String avg)
    {
        this.avg = avg;
    }

	@Override
	public String toString()
	{
		return "ScoreDTO [sid=" + sid + ", name=" + name + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat + ", tot="
				+ tot + ", avg=" + avg + "]";
	}

}
