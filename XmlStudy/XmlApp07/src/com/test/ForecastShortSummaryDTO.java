/**
 * ==========================================
 *   ForecasetShortSummaryDTO.java
 *    - 
 * ==========================================
 */


package com.test;

public class ForecastShortSummaryDTO
{
    // 주요 속성 구성
    private String tmFc, sfSv1, wn;
    //-- tmFc → 날짜와 시간 태그
    //            202511050500 → 2025년 11월 5일 05:00 발표
    //-- sfSv1 → 날씨 개황 태그
    //              □ (종합) 오늘 오전까지 내륙 중심 짙은 안개 유의, 내일까지 낮과 밤의 기온차 크겠음<br>
    //              ○ (오늘, 5일) 전국 대체로 맑겠으나, 제주도 구름많음<br>
    //              ○ (내일, 6일) 전국 대체로 맑겠으나, 밤부터 차차 구름많아짐<br>
    //              ○ (모레, 7일) 전국 가끔 구름많겠으나, 강원도와 경상권, 제주도 대체로 흐림,<br>
    //                   밤(18~24시)에 강원영동 곳에 따라 비<br>
    //              ○ (글피, 8일) 전국 대체로 흐림,<br>
    //
    //-- wn → 안내

    public String getTmFc()
    {
        return tmFc;
    }

    public void setTmFc(String tmFc)
    {
        this.tmFc = tmFc;
    }

    public String getSfSv1()
    {
        return sfSv1;
    }

    public void setSfSv1(String sfSv1)
    {
        this.sfSv1 = sfSv1;
    }

    public String getWn()
    {
        return wn;
    }

    public void setWn(String wn)
    {
        this.wn = wn;
    }

    @Override
    public String toString()
    {
        return "ForecasetShortSummaryDTO [tmFc=" + tmFc + ", sfSv1=" + sfSv1 + ", wn=" + wn + "]";
    }

    
    

}
