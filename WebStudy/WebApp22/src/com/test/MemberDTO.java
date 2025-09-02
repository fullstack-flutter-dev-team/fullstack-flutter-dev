package com.test;

public class MemberDTO
{
    // 주요 속성
    private String name, tel, addr;

    public MemberDTO() {
        
    }
    
    public MemberDTO(String name, String tel, String addr) {
        this.name = name;
        this.tel = tel;
        this.addr = addr;
    }
    
    // setter / getter
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
     * @return the addr
     */
    public String getAddr()
    {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr)
    {
        this.addr = addr;
    }
    
    

    
    
    

}
