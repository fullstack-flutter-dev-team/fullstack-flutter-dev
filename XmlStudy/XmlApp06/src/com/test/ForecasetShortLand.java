/**
 * ======================================
 *   ForecasetShortLand.java
 *     - 육상예보조회
 * 
 * ======================================
 */
package com.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

public class ForecasetShortLand
{
    public static String COLOR_RED      = "\u001B[31m" ;
    public static String COLOR_GREEN    = "\u001B[32m" ;
    public static String COLOR_YELLOW   = "\u001B[33m" ;
    public static String COLOR_BLUE     = "\u001B[34m" ;

    public static void main(String[] args) throws IOException {
        System.out.println("육상예보조회");

        // URL , 기타 필수 파라미터 구성
        String targetUrl = "https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstMsgService/getLandFcst";
        String dataType = "XML";
        String regId = "11B10101";
        String authKey = "xxx";

        StringBuilder sbRequestURL = new StringBuilder();
        sbRequestURL.append(targetUrl);
        sbRequestURL.append("?" + URLEncoder.encode("authKey", "UTF-8") + "=" + URLEncoder.encode(authKey, "UTF-8"));
        sbRequestURL.append("&" + URLEncoder.encode("regId", "UTF-8") + "=" + URLEncoder.encode(regId, "UTF-8"));
        sbRequestURL.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode(dataType, "UTF-8"));

        // HTTP 연결
        try
        {
            URL url = new URL(sbRequestURL.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/xml");
            
            System.out.println(">>> resp: " +  conn.getResponseCode());
            
            StringBuilder sb = new StringBuilder();
            BufferedReader br;
            
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            }
            
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
            
            System.out.println(">>> url : " + sbRequestURL.toString());
            System.out.println("---------------------------------------------------");
            System.out.println("--------------[       육상예보조회       ]------------");
            // System.out.println(">>> 응답 : " + sb.toString());
            System.out.println(sb.toString());
            System.out.println("---------------------------------------------------");
            
            br.close();
            conn.connect();
            
        } catch (MalformedURLException e)
        {
            System.out.println(e.toString());
            e.printStackTrace();
        }

    }

}
