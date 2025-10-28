/**
 * =================================================
 *   XmlDomTest04.java
 *     - 콘솔 기반 자바 프로그램
 *     - XML DOM활용 → 로컬(local) XML 읽어내기
 *       (VEHICLE.xml)
 * =================================================
 */

// VEHICLES.xml 파일을 대상으로
// 다음과 같은 데이터를 획득하여 출력할 수 있도록 처리한다.

/*
    ---------------------------------------------------------------- 
    NO  MAKE    MODEL       YEAR    STYLE               PRICE
    ----------------------------------------------------------------
    1   Dodge   Durango     1998    Sport Utility       18000
    Options--------------------------------------- 
        Power_Locks : Yes
        Power_Window : Yes
        Stereo : Radio/Cassette/CD
        Air_Conditioning : Yes
        Automatic : Yes
        Four_Wheel_Drive : Full/Partial
        Note: Very clean
    ----------------------------------------------------------------
    2   Honda   Civic       1997    Sedan               8000
    Options--------------------------------------- 
                                :
                                 :
                                 :
    이와 같이 결과 출력이 이루어질 수 있도록 프로그램을 작성한다.
*/


package com.test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlDomTest04
{
    static String COLOR_RED      = "\u001B[31m" ;
    static String COLOR_GREEN    = "\u001B[32m" ;
    static String COLOR_YELLOW   = "\u001B[33m" ;
    static String COLOR_BLUE     = "\u001B[34m" ;

    // 프로그램 구현
    // --==>> 구현 완료
    //          XmlDomTest01.java 파일 내용 복사
    //          → VEHICLES.xml 파일을 대상으로
    //          → 출력 내용에 맞게 수정
    //          → 출력 형식에 맞게 수정
    //          → 데이터 항목에 맞게 수정
    //          → 등등...
    //          → main() 메소드 내부 내용 수정
    //          → getText() 메소드 활용
    //          → 등등...
    //          → 완료
    //          → XmlDomTest04.java 파일로 저장
    //          → 결과 확인
    //          → 최종 완료

    public static void main(String[] args)
    {
        System.out.println(COLOR_RED + "---*** [XML DOM TEST 04] ***---");
        System.out.println(COLOR_BLUE + "-------------------------------------------------------------------");

        // test
        test();
  
    }

    // 특정 엘리먼트의 자식노드(TextNode)의 값(NodeValue)를 얻어오는 메소드
    public static String getText(Element parent, String tagName) {
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

    public static void test() 
    {
        // 테스트 코드
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        String url = "VEHICLES.XML";
        // 구현 계속...
        DocumentBuilder builder = null;
        Document xmlObj = null;
        try
        {
            builder = factory.newDocumentBuilder();
            xmlObj = builder.parse(url);

            Element root = xmlObj.getDocumentElement();
            //           ------ |-------------------
            //        문서객체 ← | → XML DOM의 최상위 엘리먼트

            NodeList vehicleNodeList = root.getElementsByTagName("VEHICLE");
            int vehicleCount = vehicleNodeList.getLength();
            System.out.println(COLOR_BLUE + "VEHICLES COUNT : " + vehicleCount);
            System.out.println(COLOR_GREEN + "-------------------------------------------------------------------");
            System.out.printf(COLOR_GREEN + "%-4s %-8s %-12s %-6s %-18s %s\n",
                                            "NO", "MAKE", "MODEL", "YEAR", "STYLE", "PRICE"
            );
            System.out.println(COLOR_GREEN + "-------------------------------------------------------------------");


            for (int i = 0; i < vehicleCount; i++)
            {
                Node vehicleNode = vehicleNodeList.item(i);
                Element vehicleElement = (Element) vehicleNode;

                System.out.printf(COLOR_GREEN + "%-4s %-8s %-12s %-6s %-18s %s\n"
                        , getText(vehicleElement, "INVENTORY_NUMBER")
                        , getText(vehicleElement, "MAKE")
                        , getText(vehicleElement, "MODEL")
                        , getText(vehicleElement, "YEAR")
                        , getText(vehicleElement, "STYLE")
                        , getText(vehicleElement, "PRICE")
                );
                System.out.println(COLOR_YELLOW + "Options------------------------------------------------------");
 
                NodeList optionNodeList = vehicleElement.getElementsByTagName("OPTIONS");
                int optionCount = optionNodeList.getLength();
                //System.out.println(COLOR_RED + "optionCount : " + optionCount);

                for (int j = 0; j < optionCount; j++)
                {
                    Node optionNode = optionNodeList.item(j);
                    NodeList optionList = optionNode.getChildNodes();
                    int optionCount2 = optionList.getLength();
                    System.out.println(COLOR_RED + "optionCount2 : " + optionCount2);

                    for (int k=0; k < optionCount2; k++) {
                        Node optNode = optionList.item(k);
                        if (optNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element optElement = (Element) optNode;
                            System.out.printf("    %s : %s\n",
                                    optElement.getNodeName(),
                                    optElement.getChildNodes().item(0).getNodeValue()
                            );
                        }
                    }
                      
                }
                System.out.println(COLOR_BLUE + "-------------------------------------------------------------------");
            }

        } catch (Exception e) {
            System.err.println("XML 파일 로드 및 파싱 실패~!!!");
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }//test()

}
