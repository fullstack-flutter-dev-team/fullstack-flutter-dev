/**
 * ================================
 *  GuestDTO.java
 *   - Java Bean
 * ================================
 */
package com.test;

/**
 * @author sist
 *
 */
public class GuestDTO
{
    // 주요 속성 구성
    String userName; //-- 작성자
    String subject;  //-- 게시물 제목
    String content;  //-- 게시물 내용
    
    // 이러한 방식으로 프로퍼티를 구성하면 비효율적 -- 이름, 값 다 지정 해줘야함
    //String name;  //-- 작성자 
    //String title; //-- 게시물 제목
    //String str;   //-- 게시물 내용

    // check~!!!
    // ※ 여기서 사용하는(선언하는) 변수명(속성명)의
    //    앞 두 글자는 가급적 소문자로 작성할 것~!!!
    
    //  단, 이 내용은 문법적인 제한 사항은 아니고 실무적인 권장사항
    //    ex) numScore → getNumScore() / setNumScore()
    //        nScore   → getNScore() / setNScore()
    //                 → getnScore() / setnScore()
    //  와 같이 getter 나 setter 가 속성명을 불러오는 과정에서
    //  인식이 어긋나거나 하는 경우가 발생할 수 있기 때문에...
    
    
    // ※ 여기서 사용하는(선언하는) 변수명(속성명)은
    //    HTML(JSP) Document 의 form 태그에서 name 속성으로 지정하여 사용할 것.
    //    단, 이 내용 또한 문법적인 제한 사항은 아니지만
    //    그렇게 사용해야 속성 데이터 수신 및 속성 매핑을
    //    액션 태그를 활용하여 자동으로 처리해줄 수 있기 때문...
    
    // getter/setter 구성
    public String getUserName()
    {
        return userName;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    public String getSubject()
    {
        return subject;
    }
    public void setSubject(String subject)
    {
        this.subject = subject;
    }
    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    
    
    

}
