/**
 * ==========================================
 *   ForecasetShortSummaryDAO.java
 *    - DAO 구성
 *    - XML DOM 활용 → 원격 XML 읽어내기
 *       (https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstMsgService/getWthrSituation)
 * ==========================================
 */

package com.test;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class ForecasetShortSummaryDAO
{
    // 주요 속성 구성 → 공통 멤버 구성 → 멥버 변수 → 초기화 → 생성자
    private Document xmlObj;
    private XPath xPath;

    // 생성자 정의 → 기본 생성자 형태
    public ForecasetShortSummaryDAO() throws ParserConfigurationException, IOException, SAXException {
        this("108");
        //-----------------------------------------------------------------------------
        // stnId=108    // 전국
        // stnId=109    // 서울,경기
        // stnId=105    // 강원
        // stnId=131    // 충북
        // stnId=133    // 충남
        // stnId=146    // 전북
        // stnId=156    // 전남
        // stnId=143    // 경북
        // stnId=159    // 경남
        // stnId=184    // 제주특별자치도
        //-----------------------------------------------------------------------------
    }

    // 생성자 정의 → 매개변수 있는 생성자 형태
    public ForecasetShortSummaryDAO(String stnId) throws ParserConfigurationException, IOException, SAXException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        // DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();

        String target = "https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstMsgService/getWthrSituation";
        String authKey = "tBTUglJySVGU1IJSctlR_Q";//-- 기상청 API Hub 에서 발급받은 키
        String dataType = "XML";// JSON
        
        StringBuilder urlBuilder = new StringBuilder(target);
        urlBuilder.append("?" + URLEncoder.encode("authKey", "UTF-8")  + "=" + URLEncoder.encode(authKey, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("stnId", "UTF-8")    + "=" + URLEncoder.encode(stnId, "UTF-8"));
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

        /*
        ○ XPath 생성                          ---- (1)
           - XPathFactory 의 정적 메소드(static) 『newInstance()』 호출을 통해
             XPath 의 생성을 지원하는 XPathFactory 를 생성하고
           - 이 XPathFactory 의 정적 메소드(static) 『newPath()』 호출을 통해
             XPath 객체를 생성한다.
             
        ○ 노드 선택 (Selecting Nodes)        ----- (2)
           - 브라우저마다 XPath 를 처리하는 방법에서 차이를 보인다.
           - Chrome, FireFox, Edge, Opera, Safari 등은
             『evaluation()』 메소드를 사용하여 노드를 처리한다.
             → xmlDoc.evaluation(xPath, xmlDoc, null, XPathResult.ANY_TYPE, null)
           - IE 는 『selectNodes()』 메소드를 사용하여 노드를 선택한다.
           
        ○ XPath 의 『compile(XPath 경로 표현식)』
           - XML 데이터 구문분석(파싱, Parsing)
             1. XML 이 제공되는 URL 로 접속하여 데이터를 수신한다.
             2. DocumentBuilderFactory ... newInstance() 로 factory 를 생성한다.
             3. DocumentBuilder ... newDocumentBuilder() 로 builder 를 생성한다.
             4. InputSource is ... new InputSource() 로 InputSource 를 생성한다.
                이 때, 파일로 수신한 경우라면 File 객체를 넘겨준다.
             5. Document xmlObj = builder.parse(is) 로 XML 을 파싱(Parsing)한다.
             6. XPath xPath = XPathFactory.newInstance().newXPath() 로
                XPath 객체를 생성하고
             7. XPathExpression expr = XPath.compile( XPath  경로 표현식 ) 으로
                가져올 Element 를 선택하게 된다.
             8. 해당 노드(Element) 에 접근하여 필요한 데이터를 추출한다.
        */
    }

    // <tmFc>202511030500</tmFc> → 발표
    public String getTmFc() throws XPathExpressionException {
        StringBuilder result = new StringBuilder();
        
        String resultStr = xPath.compile("/response/body/items/item/tmFc").evaluate(xmlObj);
        //-- "202511050500"
        
        resultStr = resultStr.substring(0, 4) + "년 "
                  + resultStr.substring(4, 6) + "월 "
                  + resultStr.substring(6, 8) + "일 "
                  + resultStr.substring(8, 10) + ":" 
                  + resultStr.substring(10) + " 발표";
        System.out.println(">>> resultStr : " + resultStr);
        
        result.append(resultStr);
        
        return result.toString();
    }
    
    
    // <wfSv1>
    public String getWfSv1() throws XPathExpressionException {
        StringBuilder result = new StringBuilder();
        String resultStr = xPath.compile("/response/body/items/item/wfSv1").evaluate(xmlObj);
        resultStr.replaceAll("○", "<br>○");
        
        result.append(resultStr);
        System.out.println(">>> resultStr : " + resultStr);
        
        return result.toString();
    }
    
    // <wn>
    public String getWn() throws XPathExpressionException {
        StringBuilder result = new StringBuilder();
        String resultStr = xPath.compile("/response/body/items/item/wn").evaluate(xmlObj);
        resultStr.replaceAll("-", "<br>-");

        result.append(resultStr);
        System.out.println(">>> resultStr : " + resultStr);
        
        return result.toString();
    }


}
