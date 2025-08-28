/**
 * 
 */
package com.test;

/**
 * @author sist
 *
 */
public class FriendDTO
{
	// 주요 속성 구성 : 
	//-- 이름은 각 name 속성값과 동일하게 구성하여야 useBean태그 사용이 쉽다
	String userName; //-- 테스트 용도
	String[] star;   //-- 테스트 용도
	String name;        //-- 이름
	int age;            //-- 나이
	String gender;      //-- 성별
	String[] idealType; //-- 이상형
	//-- 이상형은 여러 개의 데이터가 동시에 전달될 수 있는 구조이므로
	//-- (즉, 다중 선택이 가능하도록 구성하였기 때문에)
	//   배열로 처리할 수 있다.
	
	// getter/setter 구성
	/**
	 * @return the userName
	 */
	public String getUserName()
	{
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	/**
	 * @return the star
	 */
	public String[] getStar()
	{
		return star;
	}
	/**
	 * @param star the star to set
	 */
	public void setStar(String[] star)
	{
		this.star = star;
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
	/**
	 * @return the gender
	 */
	public String getGender()
	{
		return gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	/**
	 * @return the idealType
	 */
	public String[] getIdealType()
	{
		return idealType;
	}
	/**
	 * @param idealType the idealType to set
	 */
	public void setIdealType(String[] idealType)
	{
		this.idealType = idealType;
	}

	
	// 메서드 추가
	public String getStarList() {
		StringBuilder sb = new StringBuilder();
		
		if (this.getStar() != null) {
			for (String star: this.getStar()) {
				sb.append("[" + star + "] ");
			}
		} else {
			sb.append("");
		}
		
		return sb.toString();
	}

	// 메서드 추가
	public String getIdealTypeList() {
		StringBuilder sb = new StringBuilder();
		
		if (this.getStar() != null) {
			for (String idealType: this.getIdealType()) {
				sb.append("[" + idealType + "] ");
			}
		} else {
			sb.append("");
		}
		
		return sb.toString();
	}


}
