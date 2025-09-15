
/**
 * ==============================
 *  RecordView.java
 *   - 인터페이스
 * ==============================
 */
package com.test.spr;

public interface RecordView
{
    // setter 메서드 구성(선언)
    // → Record 인터페이스 타입의 객체를 넘겨받을 수 있도록 처리
    public void setRecord(Record record);
    
    // 입력 액션 전용 메서드 선언
    public void input();
    
    // 출력 액션 전용 메서드 선언
    public void output();
}
