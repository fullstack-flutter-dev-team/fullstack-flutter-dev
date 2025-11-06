/**
 *  =======================================
 *   GradeDTO.java
 *    - 데이터 전송 객체 자료형 클래스(DTO)
 *    - 성적 데이터 저장 및 전송 역할
 *  =======================================
 */

package com.test.mybatis;

public class GradeDTO
{
    // 주요 속성 구성 → scott.GRADEVIEW 뷰 레코드
    // 총점(TOT), 평균(AVG), 등급(CH)(합격, 과락, 불합격)
    String sid, name, sub1, sub2, sub3;
    String tot, avg, ch;

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
    public String getSub1() {
        return sub1;
    }
    public void setSub1(String sub1) {
        this.sub1 = sub1;
    }
    public String getSub2() {
        return sub2;
    }
    public void setSub2(String sub2) {
        this.sub2 = sub2;
    }
    public String getSub3() {
        return sub3;
    }
    public void setSub3(String sub3) {
        this.sub3 = sub3;
    }
    public String getTot() {
        return tot;
    }
    public void setTot(String tot) {
        this.tot = tot;
    }
    public String getAvg() {
        return avg;
    }
    public void setAvg(String avg) {
        this.avg = avg;
    }
    public String getCh() {
        return ch;
    }
    public void setCh(String ch) {
        this.ch = ch;
    }

    @Override
    public String toString() {
        return "GradeDTO [sub1=" + sub1 + ", sub2=" + sub2 + ", sub3=" + sub3 + "]";
    }
    
}
