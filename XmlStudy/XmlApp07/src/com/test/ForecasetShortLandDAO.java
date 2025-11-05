/**
 * ==========================================
 *   ForecasetShortLandDAO.java
 *    - DAO 구성
 *    - XML DOM 활용 → 원격 XML 읽어내기
 *       (https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstMsgService/getLandFcst)
 * ==========================================
 */
package com.test;

import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.xml.sax.InputSource;

public class ForecasetShortLandDAO
{
    // 주요 속성 구성 (공통 멤버)
    private Document xmlObj;
    private XPath xPath;
    private HashMap<String, String> map; // 이미지 전용

    //----------------------------------------------
    // 육상    서울·인천·경기도      서울    11B10101
    // 육상    서울·인천·경기도      인천    11B20201
    // 육상    부산.울산.경상남도    부산    11H20201
    // 육상    대구.경상북도         대구    11H10701
    // 육상    광주.전라남도         광주    11F20501
    // 육상    전북자치도            전주    11F10201
    // 육상    대전.세종.충청남도    대전    11C20401
    // 육상    충청북도             청주    11C10301
    // 육상    강원도               철원    11D10101
    // 육상    제주도               제주    11G00201
    //----------------------------------------------

    // 생성자 정의 -> 기본생성자 형태
    public ForecasetShortLandDAO() {
        this("11B10101");
    }



    // 생성자 정의 -> 매개변수 있는 생성자 형태
    public ForecasetShortLandDAO(String regId)
    {
        map = new HashMap<String, String>();
        map.put("맑음","DB01.png");
        map.put("구름조금","DB02.png");
        map.put("구름많음","DB03.png");
        map.put("흐림","DB04.png");
        map.put("비","DB05-Q1.png");
        map.put("흐리고 비","DB05-Q1.png");
        map.put("흐리고 한때 비","DB05-Q1.png");
        map.put("흐리고 가끔 비","DB05-Q1.png");
        map.put("구름많고 비","DB05-Q1.png");
        map.put("구름많고 한때 비","DB05-Q1.png");
        map.put("구름많고 가끔 비","DB05-Q1.png");

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        String target = "https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstMsgService/getWthrSituation";
        String authKey = "tBTUglJySVGU1IJSctlR_Q";//-- 기상청 API Hub 에서 발급받은 키
        String dataType = "XML";// JSON
        
        StringBuilder urlBuilder = new StringBuilder(target);
        urlBuilder.append("?" + URLEncoder.encode("authKey", "UTF-8")  + "=" + URLEncoder.encode(authKey, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("regId", "UTF-8")    + "=" + URLEncoder.encode(regId, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode(dataType, "UTF-8"));

        System.out.println(">>>> url : " + urlBuilder.toString());
        URL url = new URL(urlBuilder.toString());
        InputSource is = new InputSource(url.openStream());
        xmlObj = builder.parse(is);

        System.out.println(">>> xmlObj : " + xmlObj.toString());

        // CHECK~!!!
        xPath = XPathFactory.newInstance().newXPath();
        //-- XPathFactory xFactory = XPathFactory.newInstance();
        //   xPath = xFactory.newPath();
        //   와 동일한 구문

        
    }
}
