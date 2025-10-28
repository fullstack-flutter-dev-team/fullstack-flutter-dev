/**
 * =================================================
 *   XmlDomTest01.java
 *     - 콘솔 기반 자바 프로그램
 *     - XML DOM활용 → 로컬(local) XML 읽어내기
 *       (VEHICLE.xml)
 * =================================================
 */

package com.test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlDomTest01
{
  static String COLOR_RED      = "\u001B[31m" ;
  static String COLOR_GREEN    = "\u001B[32m" ;
  static String COLOR_YELLOW   = "\u001B[33m" ;
  static String COLOR_BLUE     = "\u001B[34m" ;
  
  public static void main(String[] args)
  {
      System.out.println("XML DOM TEST 01");

    // 1. XML 파일을 메모리에 로드
    //    → XML DOM 형성(구축)
    // 2. 루트 엘리먼트 접근
    // 3. 특정 하위 엘리먼트 접근
    //    → 위치, 이름 등을 기준으로 접근
    // 4. 텍스트 노드(속성 노드) 접근
    // 5. 데이터 획득
    // 6. 결과 처리(출력)
    
    try {
      // XML 파일을 메모리에 로드시킬 수 있도록 준비
      // → XML DOM 형성을 위해 필요한 준비
      //       (이를 위해 필요한 리소스 구성)
      // XmlDomBuilder builder = new XmlDomBuilder();
      DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
      DocumentBuilder builder = factory.newDocumentBuilder();
      Document xmlObj = null;

      // XML 파일을 메모리에 로드(적재) → XML DOM 형성(구축)
      String url = "VEHICLES.XML";
      xmlObj = builder.parse(url);

      // 루트 엘리먼트 접근
      Element root = xmlObj.getDocumentElement();
      //             ------ |-------------------
      //          문서객체 ← | → XML DOM의 최상위 엘리먼트
      System.out.println("루트 엘리먼트 : " + root.getNodeName());
      //--==>> 루트 엘리먼트 : VEHICLES

      // 루트 엘리먼트를 통해 특정 하위 엘리먼트 접근(VEHICLE)
      // → 위치, 이름 등을 기준으로 접근
      // 『getElementsByTagName()』 메소드는 태그의 이름을 가지고
      //  자식(자손) 노드에 접근할 수 있도록 해주는 메서드
      NodeList vehicleNodeList = root.getElementsByTagName("VEHICLE");
      //-- XML 의 구조상 같은 태그 이름을 가진 것이 다수 있을 수 있기 때문에 
 
      // ※ NodeList 객체에 들어있는 Node 의 갯수를
      //    『getLength()』 메소드를 통해 확인할 수 있다.
      //    → 이를 활용하여 반복문을 구성할 수 있다.
      //    → 여러 개의 동일한 이름의 엘리먼트에 접근 가능
      int vehicleCount = root.getElementsByTagName("VEHICLE").getLength();
      System.out.println("VEHICLE 엘리먼트의 갯수 : " + vehicleCount);
      //--==>> VEHICLE 엘리먼트의 갯수 : 10
      System.out.println(COLOR_GREEN + "-----------------------------------");
      
      for (int i = 0; i < vehicleCount; i++)
      {
        // NodeList 의 『item()』 메소드는
        // 파라미터에 해당하는 인덱스에 위치한 노드 접근 메소드
        Node vehicleNode = vehicleNodeList.item(i);    //-- i → 0 ~ 9
        Element v = (Element)root.getElementsByTagName("VEHICLE").item(i);
        System.out.println(COLOR_GREEN + (i+1) + "번째 VEHICLE 엘리먼트 : " + v.getNodeName());
        // 1번째 VEHICLE 엘리먼트 : VEHICLE
        // ...
        // 10번째 VEHICLE 엘리먼트 : VEHICLE
      }

      System.out.println(COLOR_BLUE + "-----------------------------------");
      System.out.printf(COLOR_BLUE + "%s %s %s %s %s %n", "MAKE", "MODEL", "YEAR", "PICTURE", "STYLE");
      System.out.println(COLOR_BLUE + "-----------------------------------");
      for (int i = 0; i < vehicleCount; i++)
      {
        // NodeList 의 『item()』 메소드는
                // 파라미터에 해당하는 인덱스에 위치한 노드 접근 메소드
                Node vehicleNode = vehicleNodeList.item(i);    //-- i → 0 ~ 9
                
                // 캐스트 연산자를 이용하면 
                // Node 객체를 Element 객체로 변환하는 것이 가능하다.
                // Node 는 상위 자료형, Element 는 하위 자료형으로 다루고 있기 때문이다.
                Element vehicleElement = (Element)vehicleNode;
                
                /*
                NodeList makeNodeList = vehicleElement.getElementsByTagName("MAKE");
                Node makeNode = makeNodeList.item(0);
                Element makeElement = (Element)makeNode;
                System.out.printf("%s : %s%n"
                        , makeElement.getNodeName()
                        , makeElement.getTextContent());
                
                NodeList modelNodeList = vehicleElement.getElementsByTagName("MODEL");
                Node modelNode = modelNodeList.item(0);
                Element modelElement = (Element)modelNode;
                System.out.printf("%s : %s%n"
                        , modelElement.getNodeName()
                        , modelElement.getTextContent());
                //-- 사용자 정의 메소드로 재구성
                */
                
                // 특정 엘리먼트의 텍스트 데이터를 얻는
                // 사용자 정의 메소드(→ 『getText()』) 메소드 호출
                System.out.printf(COLOR_BLUE + "%s %s %s %s %s %n"
                        , getText(vehicleElement, "MAKE")
                        , getText(vehicleElement, "MODEL")
                        , getText(vehicleElement, "YEAR")
                        , getText(vehicleElement, "PICTURE")
                        , getText(vehicleElement, "STYLE"));
                // Dodge Durango 1998 DodgeDurango.jpg Sport Utility 
                // ...
                // Ford Explorer 1996 FordExplorer.jpg Sport Utility 
      }

      System.out.println(COLOR_GREEN + "-----------------------------------");
      // 특정 하위 엘리먼트 접근(VEHICLE)
      Node vehicleNode = vehicleNodeList.item(0);    //-- 0 → 첫 번째
      Element vehicle = (Element)vehicleNode;
      System.out.println("첫 번째 VEHICLE 엘리먼트 : " + vehicle.getNodeName());
      //--==>>

      // 특정 하위 엘리먼트 내의 텍스트 노드(속성 노드) 접근
      Element model = (Element)vehicle.getElementsByTagName("MODEL").item(0);
      Element price = (Element)vehicle.getElementsByTagName("PRICE").item(0);
      System.out.println("MODEL 엘리먼트 : " + model.getNodeName());
      //--==>> MODEL 엘리먼트 : MODEL
      System.out.println("PRICE 엘리먼트 : " + price.getNodeName());
      //--==>> PRICE 엘리먼트 : PRICE

      // 텍스트 노드(속성 노드) 접근 → 데이터 획득
      String modelData = model.getFirstChild().getNodeValue();
      String priceData = price.getFirstChild().getNodeValue();
      System.out.println("MODEL 데이터 : " + modelData);
      //--==>> MODEL 데이터 : Durango
      System.out.println("PRICE 데이터 : " + priceData);
      //--==>> PRICE 데이터 : 18000
      
    } catch (Exception e) {
      System.out.println(e.toString());
      e.printStackTrace();
    }
  }//-- main()
  
  // 특정 엘리먼트의 텍스트 데이터를 얻어오는 사용자 정의 메소드
  private static String getText(Element parent, String tagName)
    {
        // 반환할 결과 값
        String result = "";
        
        // 특정 태그 이름을 가진 객체의 첫 번째 자식 노드를 얻어온 다음
        Node node = parent.getElementsByTagName(tagName).item(0);
        Element element = (Element)node;
        
        // 특정 엘리먼트의 자식노드(TextNode)의 값(NodeValue)를 얻어올 수 있도록 처리
        result = element.getChildNodes().item(0).getNodeValue();
        // 결과 값 반환
        return result;
    }

}
