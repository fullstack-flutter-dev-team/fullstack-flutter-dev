/**
 * ======================================
 *   ForecastShortSummary.java
 *     - 단기예보개황
 * 
 * ======================================
 */
package com.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class ForecastShortSummary
{
    public static String COLOR_RED      = "\u001B[31m" ;
    public static String COLOR_GREEN    = "\u001B[32m" ;
    public static String COLOR_YELLOW   = "\u001B[33m" ;
    public static String COLOR_BLUE     = "\u001B[34m" ;

    public static void main(String[] args) {
        System.out.println("단기예보개황");

        try {

            // ▣ 기상청 API 허브 → [기상청API허브](https://apihub.kma.go.kr/)
            //   단기예보개황 조회서비스
            //   https://apihub.kma.go.kr/
            //    - User Key 발급(회원가입)
            //    - Open API 메뉴 확인

            // 1. 요청 URL 구성
            // 단기예보 > 3.1 기상개황조회
            // https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstMsgService/getWthrSituation?pageNo=1&numOfRows=10&dataType=XML&stnId=108&authKey=xxx
            String targetUrl = "https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstMsgService/getWthrSituation";
            
            //-----------------------------------------------------------------------------
            // 구분  |  지역              |   통보문 지점명   | 관서코드(개황) 또는 예보구역코드
            //-----------------------------------------------------------------------------
            // 개황    전국                 기상청               108
            // 개황    서울·인천·경기도      수도권(서울)         109
            // 개황    부산.울산.경상남도    부산                 159
            // 개황    대구.경상북도         대구                 143
            // 개황    광주.전라남도         광주                 156
            // 개황    전북자치도            전주                 146
            // 개황    대전.세종.충청남도    대전                  133
            // 개황    충청북도             청주                  131
            // 개황    강원도               강원                  105
            // 개황    제주도               제주                  184

            // 2. 필수 파라미터 설정
            //-- 1. pageNo=1
            //-- 2. numOfRows=10
            //-- 3. dataType=XML  (/JSON)
            //-- 4. stnId=108
            //-- 5. authKey=xxxx
            String authKey = "xxx";  //-- 기상청 API Hub에서 발급받은 인증키
            String stnId = "108";                       //-- 지역코드(개황) 또는 예보구역코드
            String dataType = "XML";                    //-- 요청자료형식(XML, JSON) Default: XML

            // 3. 쿼리스트링 구성(URL Encoding 처리)
            StringBuilder urlBuilder = new StringBuilder();
            urlBuilder.append(targetUrl); //URL
            // urlBuilder.append("?" + URLEncoder.encode("authKey", "UTF-8")  + "=" + authKey); //URLEncoder.encode(authKey, "UTF-8")); //-- Service Key
            urlBuilder.append("?" + URLEncoder.encode("authKey", "UTF-8")  + "=" +  URLEncoder.encode(authKey, "UTF-8")); //-- Service Key
            urlBuilder.append("&" + URLEncoder.encode("stnId", "UTF-8")    + "=" +  URLEncoder.encode(stnId, "UTF-8") );    //-- 지역코드(개황) 또는 예보구역코드
            urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" +  URLEncoder.encode(dataType, "UTF-8") ); //-- 요청자료형식(XML, JSON) Default: XML

            // 4. HTTP 연결 생성
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/xml");

            // 확인
            System.out.println(">>> 요청 url : " + urlBuilder.toString());
            System.out.println(">>> 응답 코드(Response code) : " + conn.getResponseCode());
            
            // 5. 응답 데이터 읽기(응답수신 및 처리0
            BufferedReader br;
            if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            }

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }

            // 6. 리소스 반납
            br.close();
            conn.disconnect();

            // 7. 결과 출력
            System.out.println("");
            System.out.println(COLOR_BLUE + "===============[ 기상청 단기개황 XML 응답 ]===============");
            System.out.println(sb.toString());
            System.out.println(COLOR_BLUE + "-------------------------------------------------------------");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(COLOR_RED + "예외발생 : " + e.toString());
        }
    }// main

}
