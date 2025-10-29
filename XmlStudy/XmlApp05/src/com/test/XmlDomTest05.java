/**
 * =================================================
 *   XmlDomTest05.java
 *     - 콘솔 기반 자바 프로그램
 *     - XML DOM활용 → 로컬(local) XML 읽어내기
 *       (rss.xml)
 *      - * 기상청 날씨누리로부터 얻어낸 데이터
 *          (https://www.weather.go.kr/w/index.do)
 *          - (https://www.kma.go.kr/repositary/xml/fct/mon/img/fct_mon1rss_108_20251023.xml)
 * =================================================
 */
// XML RSS 문서 예제
// 기상청 RSS 서비스 제공 문서
//   - [오늘의 전국 날씨](https://www.weather.go.kr/w/pop/rss-guide.do)
//   - [주간예보](https://www.weather.go.kr/w/pop/rss-guide.do)
//   - [10일기상예보](https://www.weather.go.kr/w/pop/rss-guide.do)
//   - [강수예보](https://www.weather.go.kr/w/pop/rss-guide.do)
//   - [단기예보](https://www.weather.go.kr/w/pop/rss-guide.do)
//   - [단기예보(동네예보)](https://www.weather.go.kr/w/pop/rss-guide.do)
//   - [중기예보(3~4일전망)](https://www.weather.go.kr/w/pop/rss-guide.do)
// [1개월전망](https://www.weather.go.kr/w/pop/rss-guide.do)
//

package com.test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlDomTest05
{
    public static void main(String[] args) {
        try {
           // 1. XML 파일 메모리에 로드
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            String url = "rss.xml";
            Document xmlObj = builder.parse(url);
            
            // 2. 루트 엘리먼트 접근
            Element root = xmlObj.getDocumentElement();
            
            // 3-1. 타이틀 추출하기 
            Node itemNode = root.getElementsByTagName("item").item(0);
            Element itemElement = (Element)itemNode;
            
            System.out.printf("%s%n%n", XMLDOM.getText(itemElement, "title"));
            
            // 3-2. 기상전망 추출하기
            Node summaryNode = root.getElementsByTagName("summary").item(0);
            Element summaryElement = (Element)summaryNode;
            
            System.out.println("[기상전망]-------------------------------------------------------");
            System.out.printf("%s%n%n", summaryElement.getTextContent().replaceAll("<br />", "\n"));
            
            // 3-3. 주차별 기상전망 추출하기
            NodeList weekNodeList = root.getElementsByTagName("weather_forecast");
            for (int i=0; i < weekNodeList.getLength(); i++)
            {
                Node weekNode = weekNodeList.item(i);
                Element weekElement = (Element)weekNode;
                
                NodeList weekChildNodeList = root.getElementsByTagName("week");
                for (int j=0; j<weekChildNodeList.getLength(); j++)
                {
                    Node dataNode = weekChildNodeList.item(j);
                    Element dataElement = (Element)dataNode;
                    
                    System.out.printf("%d주차 기간 : %s%n", (j+1), XMLDOM.getText(dataElement, "week" + (j+1) + "_period").replaceAll(" ", "").replaceAll("\n", ""));
                    System.out.printf("%d주차 기상전망 : %s%n", (j+1)
                            , XMLDOM.getText(dataElement, "week"+ (j+1) +"_weather_review").replaceAll(" ", "").replaceAll("\n", ""));
                }
            }


            // 3-4. 지역별 날씨 예보 추출하기
            System.out.println("[육상날씨]-------------------------------------------------------");
            NodeList locationNodeList = root.getElementsByTagName("local_ta");
            
            for (int i=0; i<locationNodeList.getLength(); i++)
            {
                Node locationNode = locationNodeList.item(i);
                Element locationElement = (Element)locationNode;
                
                System.out.printf("지역 : %s%n", XMLDOM.getText(locationElement, "local_ta_name"));
                System.out.println("-----------------------------------------------------------");
                
                NodeList weekLocalTaNodeList = locationElement.getElementsByTagName("week_local_ta");
                for (int j=0; j<weekLocalTaNodeList.getLength(); j++)
                {
                    Node dataNode = weekLocalTaNodeList.item(j);
                    Element weekLocalTaElement = (Element)dataNode;
                    
                    System.out.printf("  \n - %d주차 평년: %s", (j+1)
                            , XMLDOM.getText(weekLocalTaElement, "week" + (j+1)
                               +   "_local_ta_normalYear").replaceAll(" ", "").replaceAll("\n", ""));

                    System.out.printf("  \n - %d주차 평년: %s", (j+1)
                            , XMLDOM.getText(weekLocalTaElement, "week" + (j+1)
                               +   "_local_ta_similarRange").replaceAll(" ", "").replaceAll("\n", ""));

                    System.out.printf("  \n - %d주차 평년: %s", (j+1)
                            , XMLDOM.getText(weekLocalTaElement, "week" + (j+1)
                               +   "_local_ta_minVal").replaceAll(" ", "").replaceAll("\n", ""));

                    System.out.printf("  \n - %d주차 평년: %s", (j+1)
                            , XMLDOM.getText(weekLocalTaElement, "week" + (j+1)
                               +   "_local_ta_similarVal").replaceAll(" ", "").replaceAll("\n", ""));

                    System.out.printf("  \n - %d주차 평년: %s", (j+1)
                            , XMLDOM.getText(weekLocalTaElement, "week" + (j+1)
                               +   "_local_ta_maxVal").replaceAll(" ", "").replaceAll("\n", ""));
                }
                
                System.out.println("-----------------------------------------------------------");
                
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
