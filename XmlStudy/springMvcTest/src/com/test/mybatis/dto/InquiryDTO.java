package com.test.mybatis.dto;

import java.util.Date;

public class InquiryDTO {
    private String inquiryNo;      // 문의 번호
    private String type;           // 문의 유형
    private String title;          // 제목
    private String userId;         // 작성자 ID
    private String content;        // 내용
    private Date regDate;          // 등록일
    private String status;         // 답변 상태

    // 아래는 답변 관련 필드 추가
    private int answerNo;          // 답변 번호
    private String adminId;        // 관리자 ID
    private String answerContent;  // 답변 내용
    private Date answerDate;       // 답변일

    // Getters and Setters
    public String getInquiryNo() {
        return inquiryNo;
    }
    public void setInquiryNo(String inquiryNo) {
        this.inquiryNo = inquiryNo;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public Date getRegDate() {
        return regDate;
    }
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    // 답변 관련 Getters & Setters
    public int getAnswerNo() {
        return answerNo;
    }
    public void setAnswerNo(int answerNo) {
        this.answerNo = answerNo;
    }
    public String getAdminId() {
        return adminId;
    }
    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }
    public String getAnswerContent() {
        return answerContent;
    }
    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }
    public Date getAnswerDate() {
        return answerDate;
    }
    public void setAnswerDate(Date answerDate) {
        this.answerDate = answerDate;
    }
}
