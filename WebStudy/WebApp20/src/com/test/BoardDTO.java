/**
 * ======================================
 *   BoardDTO.java
 * 
 * ======================================
 */
package com.test;


//CREATE TABLE TBL_BOARD
//( NUM       NUMBER(9)                   NOT NULL    -- 게시물 번호
//, NAME      VARCHAR2(30)                NOT NULL    -- 게시물 작성자  // 회원가입 연동시 - ID 로 식별
//, PWD       VARCHAR2(20)                NOT NULL    -- 게시물 암호    // 회원가입 연동시 - 암호 필요X
//, EMAIL     VARCHAR2(50)                            -- 게시물 이메일
//, SUBJECT   VARCHAR2(100)               NOT NULL    -- 게시물 제목
//, CONTENT   VARCHAR2(4000)              NOT NULL    -- 게시물 내용   // 첨부파일, 스마트에디터 구성 시 별도로 테이블 생성하는 경우도 많다.
//, IPADDR    VARCHAR2(20)                            -- 접속한 클라이언트 IP 주소  // 작성자의 IP
//, HITCOUNT  NUMBER      DEFAULT 0       NOT NULL    -- 게시물 조회수  // 최근에는 로그 기록(별도의 로그 테이블 생성하여)으로 확인, 별도 관리하는 경우도 많다. 
//, CREATED   DATE        DEFAULT SYSDATE NOT NULL    -- 게시물 작성일  //-- 업무정책상 : 최초 입력일, 최총수정일 등...
//, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)          -- 게시물 번호에 PK 제약조건 설정
//);

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
