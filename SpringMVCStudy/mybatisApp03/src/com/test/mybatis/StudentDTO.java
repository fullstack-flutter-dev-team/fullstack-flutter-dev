package com.test.mybatis;

public class StudentDTO
{
    // 주요 속성 구성 → STUDENTVIEW 레코드
    String sid, name, tel, sub;

	// setter / getter 구성
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	
	@Override
	public String toString() {
		return "StudentDTO [name=" + name + ", tel=" + tel + ", sub=" + sub + "]";
	}
  
}
