package com.test.mybatis;

import java.util.ArrayList;
import com.test.mybatis.dto.InquiryDTO;

public interface IInquiryDAO {

    // 1. 문의 등록
    public int insertInquiry(InquiryDTO dto);

    // 2. 문의 상세 조회 (문의번호 기준)
    public InquiryDTO inquiryDetail(String inquiryNo);

    // 3. 사용자별 문의 내역 리스트 조회
    public ArrayList<InquiryDTO> userInquiryList(String userId);

    // 4. 관리자용 전체 문의 리스트 조회
    public ArrayList<InquiryDTO> allInquiryList();

    // 5. 답변 등록
    public int insertAnswer(InquiryDTO dto);

    // 6. 문의번호로 답변 조회
    public ArrayList<InquiryDTO> answerList(String inquiryNo);

}