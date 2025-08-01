/**
 * 
 */
package com.test;

/**
 * @author sist
 *
 */
public class EmpDTO
{

	private int empId;
	private String empName;
	private String ssn;
	private String ibsaDate;
	private int cityId;
	private String tel;
	private int buseoId;
	private int jikwiId;
	private int basicpay;
	private int sudang;
	
	//---- setter / getter -----
	
	/**
	 * @return the empId
	 */
	public int getEmpId()
	{
		return empId;
	}
	/**
	 * @param empId the empId to set
	 */
	public void setEmpId(int empId)
	{
		this.empId = empId;
	}
	/**
	 * @return the empName
	 */
	public String getEmpName()
	{
		return empName;
	}
	/**
	 * @param empName the empName to set
	 */
	public void setEmpName(String empName)
	{
		this.empName = empName;
	}
	/**
	 * @return the ssn
	 */
	public String getSsn()
	{
		return ssn;
	}
	/**
	 * @param ssn the ssn to set
	 */
	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}
	/**
	 * @return the ibsaDate
	 */
	public String getIbsaDate()
	{
		return ibsaDate;
	}
	/**
	 * @param ibsaDate the ibsaDate to set
	 */
	public void setIbsaDate(String ibsaDate)
	{
		this.ibsaDate = ibsaDate;
	}
	/**
	 * @return the cityId
	 */
	public int getCityId()
	{
		return cityId;
	}
	/**
	 * @param cityId the cityId to set
	 */
	public void setCityId(int cityId)
	{
		this.cityId = cityId;
	}
	/**
	 * @return the tel
	 */
	public String getTel()
	{
		return tel;
	}
	/**
	 * @param tel the tel to set
	 */
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	/**
	 * @return the buseoId
	 */
	public int getBuseoId()
	{
		return buseoId;
	}
	/**
	 * @param buseoId the buseoId to set
	 */
	public void setBuseoId(int buseoId)
	{
		this.buseoId = buseoId;
	}
	/**
	 * @return the jikwiId
	 */
	public int getJikwiId()
	{
		return jikwiId;
	}
	/**
	 * @param jikwiId the jikwiId to set
	 */
	public void setJikwiId(int jikwiId)
	{
		this.jikwiId = jikwiId;
	}
	/**
	 * @return the basicpay
	 */
	public int getBasicpay()
	{
		return basicpay;
	}
	/**
	 * @param basicpay the basicpay to set
	 */
	public void setBasicpay(int basicpay)
	{
		this.basicpay = basicpay;
	}
	/**
	 * @return the sudang
	 */
	public int getSudang()
	{
		return sudang;
	}
	/**
	 * @param sudang the sudang to set
	 */
	public void setSudang(int sudang)
	{
		this.sudang = sudang;
	}
	
	@Override
	public String toString()
	{
		return "EmpDTO [empId=" + empId + ", empName=" + empName + ", ssn=" + ssn + ", ibsaDate=" + ibsaDate
				+ ", cityId=" + cityId + ", tel=" + tel + ", buseoId=" + buseoId + ", jikwiId=" + jikwiId
				+ ", basicpay=" + basicpay + ", sudang=" + sudang + "]";
	}
}
