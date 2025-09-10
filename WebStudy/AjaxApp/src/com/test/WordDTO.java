/**
 * ===================================
 *   WordDTO.java
 * ===================================
 * 
 */


package com.test;

public class WordDTO
{

    // 주요 속성 구성
    private String word;
    
    // 기본 생성자
    public WordDTO() {
        this("");
    }
    
    
    // 사용자 정의 생성자
    public WordDTO(String word) {
        this.word = word;
    }

    /**
     * @return the word
     */
    public String getWord()
    {
        return word;
    }

    /**
     * @param word the word to set
     */
    public void setWord(String word)
    {
        this.word = word;
    }
    
    
}
