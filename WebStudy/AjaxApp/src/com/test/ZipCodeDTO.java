/**
 * =====================================
 *  ZipCodeDTO.java
 * 
 * =====================================
 * 
 */



package com.test;

public class ZipCodeDTO
{
    // 주요 속성 구성
    private String zipCode; //-- 우편번호
    private String address; //-- 주소

    // 생성자 →기본 생성자 추가 구성
    public ZipCodeDTO() {
        this("", "");
    }
    
    // 생성자 → 사용자 정의 생성자
    public ZipCodeDTO(String zipCode, String address) {
        this.zipCode = zipCode;
        this.address = address;
    }

    /**
     * @return the zipCode
     */
    public String getZipCode()
    {
        return zipCode;
    }

    /**
     * @param zipCode the zipCode to set
     */
    public void setZipCode(String zipCode)
    {
        this.zipCode = zipCode;
    }

    /**
     * @return the address
     */
    public String getAddress()
    {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address)
    {
        this.address = address;
    }
    
    
}
