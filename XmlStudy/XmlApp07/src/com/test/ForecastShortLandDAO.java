/**
 * ==========================================
 *   ForecasetShortLandDAO.java
 *    - DAO 구성
 *    - XML DOM 활용 → 원격 XML 읽어내기
 *       (https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstMsgService/getLandFcst)
 * ==========================================
 */
package com.test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class ForecastShortLandDAO
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
    public ForecastShortLandDAO() throws ParserConfigurationException, IOException, SAXException {
        this("11B10101");
    }



    // 생성자 정의 -> 매개변수 있는 생성자 형태
    public ForecastShortLandDAO(String regId) throws ParserConfigurationException, IOException, SAXException
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

        String target = "https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstMsgService/getLandFcst";
        String authKey = "xxx";//-- 기상청 API Hub 에서 발급받은 키
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

    // 날씨 정보 리스트
    public ArrayList<ForecastShortLandDTO> shortLandList() throws XPathExpressionException {
      ArrayList<ForecastShortLandDTO> result = new ArrayList<ForecastShortLandDTO>();

      // check~!!!
      NodeList itemNodeList = (NodeList)xPath.compile("/response/body/items/item").evaluate(xmlObj, XPathConstants.NODESET);

      // ※ XPath 의 『evaluate()』 메소드 두 번째 파라미터 (리턴 타입)
      //    - XPathConstants.NODESET        -- NodeList
      //    - XPathConstants.NODE
      //    - XPathConstants.BOOLEAN
      //    - XPathConstants.NUMBER
      //    - XPathConstants.STRING

      // check~!!!
      Calendar now = Calendar.getInstance();
      String nowStr = String.valueOf(now.get(Calendar.YEAR))                      //-- 2025
                     + String.format("%02d", now.get(Calendar.MONTH)+1)    //-- 08
                     + String.format("%02d", now.get(Calendar.DATE));      //-- 01
      //-- 20250801

      int nowHour = now.get(Calendar.HOUR_OF_DAY);

      // check~!!!
      // NODESET → NodeList
      // 『i=1 ~ itemNodeList.getLength()』
      //-- W3C 의 권고에 따라 잘 만들어진 웹 페이지의 경우... 1부터 시작 
      // for (int i = 0; i < itemNodeList.getLength(); i++)  //-- (X)
      for (int i = 1; i <= itemNodeList.getLength(); i++)
      {
         // numEf, regId, rnSt, rnYn, ta, wd1, wf, (img, skyImg)
          // numEf(발표번호), regId(예보구역코드), rnSt(강수확률), rnYn(강수형태), ta(예상기온)
          // wd1(풍향), wf(날씨), wfCd(하늘상태)
          // img(날씨이미지), skyImg(하늘상태이미지);
          
         // check~!!!
         // announceTime
         String announceTime = xPath.compile(String.format("/response/body/items/item[%d]/announceTime", i)).evaluate(xmlObj);
         //-- "202511060500"
         announceTime = announceTime.substring(0, 8);
         //-- "20251106"
       
         // numEf
         String numEf = xPath.compile(String.format("/response/body/items/item[%d]/numEf", i)).evaluate(xmlObj);

         // regId
         String regId = xPath.compile(String.format("/response/body/items/item[%d]/regId", i)).evaluate(xmlObj);

         // rnSt
         String rnSt = xPath.compile(String.format("/response/body/items/item[%d]/rnSt", i)).evaluate(xmlObj);

         // rnYn
         String rnYn = xPath.compile(String.format("/response/body/items/item[%d]/rnYn", i)).evaluate(xmlObj);

         // ta
         String ta = xPath.compile(String.format("/response/body/items/item[%d]/ta", i)).evaluate(xmlObj);

         // wd1
         String wd1 = xPath.compile(String.format("/response/body/items/item[%d]/wd1", i)).evaluate(xmlObj);

         // wf
         String wf = xPath.compile(String.format("/response/body/items/item[%d]/wf", i)).evaluate(xmlObj);

         // wfCd
         String wfCd = xPath.compile(String.format("/response/body/items/item[%d]/wfCd", i)).evaluate(xmlObj);

         // numEf 에 대한 추가 확인 및 추가 처리
         if ((announceTime.equals(nowStr) && nowHour >= 17)
              || (Integer.parseInt(announceTime)+1 == Integer.parseInt(nowStr) && nowHour <5)) {
               switch (Integer.parseInt(numEf)) {
                   case 0: numEf = "오늘 오후"; break;
                   case 1: numEf = "내일 오전"; break;
                   case 2: numEf = "내일 오후"; break;
                   case 3: numEf = "모레 오전"; break;
                   case 4: numEf = "모레 오후"; break;
                   case 5: numEf = "글피 오전"; break;
                   case 6: numEf = "글피 오후"; break;
                   case 7: numEf = "그글피 오전"; break;
                   case 8: numEf = "그글피 오후"; break;
               }

         } else if ((announceTime.equals(nowStr) && nowHour >= 5)
              || (announceTime.equals(nowStr) && nowHour < 11)) {
             switch (Integer.parseInt(numEf)) {
                   case 0: numEf = "오늘 오전"; break;
                   case 1: numEf = "오늘 오후"; break;
                   case 2: numEf = "내일 오전"; break;
                   case 3: numEf = "내일 오후"; break;
                   case 4: numEf = "모레 오전"; break;
                   case 5: numEf = "모레 오후"; break;
                   case 6: numEf = "글피 오전"; break;
                   case 7: numEf = "글피 오후"; break;
               }
         // } else if (nowHour >= 11 || nowHour < 17) {
         } else {
               switch (Integer.parseInt(numEf)) {
                   case 0: numEf = "오늘 오후"; break;
                   case 1: numEf = "내일 오전"; break;
                   case 2: numEf = "내일 오후"; break;
                   case 3: numEf = "모레 오전"; break;
                   case 4: numEf = "모레 오후"; break;
                   case 5: numEf = "글피 오전"; break;
                   case 6: numEf = "글피 오후"; break;
               }
         }

         // rnYn에 대한 확인 및 추가 처리
         switch (Integer.parseInt(rnYn)) {
             case 0: rnYn = "강수없음"; break;
             case 1: rnYn = "비"; break;
             case 2: rnYn = "비/눈"; break;
             case 3: rnYn = "눈"; break;
             case 4: rnYn = "소나기"; break;
         }

         // ForcastShortLandDTO 객체 생성
         ForecastShortLandDTO dto = new ForecastShortLandDTO();
         dto.setNumEf(numEf);             //-- 발표번호
         dto.setRegId(regId);             //-- 예보구역코드
         dto.setRnSt(rnSt);               //-- 강수확률
         dto.setRnYn(rnYn);               //-- 강수형태
         dto.setTa(ta);                   //-- 예상기온
         dto.setWd1(wd1);                 //-- 풍향
         dto.setWfCd(wfCd);
         dto.setWf(wf);
         dto.setImg(map.get(wf));
         dto.setSkyImg(wfCd);

         System.out.println(">>> dto : " + dto.toString());

         result.add(dto);
      }
        
      return result;
    }
}
