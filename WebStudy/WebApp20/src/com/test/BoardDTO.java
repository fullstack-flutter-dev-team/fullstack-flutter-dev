/**
 * ======================================
 *   BoardDTO.java
 * 
 * ======================================
 */
package com.test;

/**
 * @author sist
 *
 */
public class BoardDTO
{
    private int num;
    private String name, pwd, email, subject, content, ipAddr, created;
    private int hitCount;

    // getter / setter
    /**
     * @return the num
     */
    public int getNum()
    {
        return num;
    }
    /**
     * @param num the num to set
     */
    public void setNum(int num)
    {
        this.num = num;
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
     * @return the pwd
     */
    public String getPwd()
    {
        return pwd;
    }
    /**
     * @param pwd the pwd to set
     */
    public void setPwd(String pwd)
    {
        this.pwd = pwd;
    }
    /**
     * @return the email
     */
    public String getEmail()
    {
        return email;
    }
    /**
     * @param email the email to set
     */
    public void setEmail(String email)
    {
        this.email = email;
    }
    /**
     * @return the subject
     */
    public String getSubject()
    {
        return subject;
    }
    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject)
    {
        this.subject = subject;
    }
    /**
     * @return the content
     */
    public String getContent()
    {
        return content;
    }
    /**
     * @param content the content to set
     */
    public void setContent(String content)
    {
        this.content = content;
    }
    /**
     * @return the ipAddr
     */
    public String getIpAddr()
    {
        return ipAddr;
    }
    /**
     * @param ipAddr the ipAddr to set
     */
    public void setIpAddr(String ipAddr)
    {
        this.ipAddr = ipAddr;
    }
    /**
     * @return the created
     */
    public String getCreated()
    {
        return created;
    }
    /**
     * @param created the created to set
     */
    public void setCreated(String created)
    {
        this.created = created;
    }
    /**
     * @return the hitCount
     */
    public int getHitCount()
    {
        return hitCount;
    }
    /**
     * @param hitCount the hitCount to set
     */
    public void setHitCount(int hitCount)
    {
        this.hitCount = hitCount;
    }
    
    

}
