/**
 * =================================================
 *   XmlDomTest03.java
 *     - 콘솔 기반 자바 프로그램
 *     - XML DOM활용 → 로컬(local) XML 읽어내기
 *       (breakfast_menu.xml)
 * =================================================
 */

// breakfast_menu.xml 파일을 대상으로
// 다음과 같은 데이터를 획득하여 출력할 수 있도록 처리한다.

/*
    ■ [Belgian Waffles] $5.95   650칼로리
    - Two of our famous Belgian Waffles with plenty of real maple syrup
    -------------------------------------------------------------------------
    ■ [Strawberry Belgian Waffles]  $7.95   900칼로리
    - Light Belgian waffles covered with strawberries and whipped cream
    -------------------------------------------------------------------------
                                 :
                                 :
    이와 같이 결과 출력이 이루어질 수 있도록 프로그램을 작성한다.
*/

package com.test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlDomTest03
{
    static String COLOR_RED      = "\u001B[31m" ;
    static String COLOR_GREEN    = "\u001B[32m" ;
    static String COLOR_YELLOW   = "\u001B[33m" ;
    static String COLOR_BLUE     = "\u001B[34m" ;
    // 프로그램 구현
    // --==>> 구현 완료
    //          XmlDomTest02.java 파일 내용 복사
    //          → breakfast_menu.xml 파일을 대상으로
    //          → 출력 내용에 맞게 수정
    //          → 출력 형식에 맞게 수정
    //          → 데이터 항목에 맞게 수정
    //          → 등등...
    //          → main() 메소드 내부 내용 수정
    //          → getText() 메소드 활용
    //          → 등등...
    //          → 완료
    //          → XmlDomTest03.java 파일로 저장
    //          → 결과 확인
    //          → 최종 완료

    public static void main(String[] args) {
        System.out.println(COLOR_RED + "---*** [XML DOM TEST 03] ***---");
        System.out.println(COLOR_BLUE + "-------------------------------------------------------------------");

        // test
        // test();

        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            String url = "breakfast_menu.xml";
            DocumentBuilder builder = null;
            org.w3c.dom.Document xmlObj = null;
            builder = factory.newDocumentBuilder();
            xmlObj = builder.parse(url);
            Element root = xmlObj.getDocumentElement();
            //           ------ |-------------------
            //        문서객체 ← | → XML DOM의 최상위 엘리먼트
            
            NodeList foodNodeList = root.getElementsByTagName("food");
            int foodCount = foodNodeList.getLength();

            for (int i = 0; i < foodCount; i++) {
                Node foodNode = foodNodeList.item(i);
                Element foodElement = (Element) foodNode;

                System.out.printf(COLOR_GREEN + "■ [%s] %s   %s칼로리\n - %s\n" + //
                                        ""
                        , getText(foodElement, "name")
                        , getText(foodElement, "price")
                        , getText(foodElement, "calories")
                        , getText(foodElement, "description")
                );
                System.out.println(COLOR_BLUE + "-------------------------------------------------------------------");
            }

        } catch (Exception e) {
            System.err.println("XML 파일 로드 및 파싱 실패~!!!");
            System.err.println(e.getMessage());
            e.printStackTrace();
        } 
    }//-- main()

    // 특정 엘리먼트의 자식노드(TextNode)의 값(NodeValue)를 얻어올 수 있도록 처리
    public static String getText(Element parent, String tagName) {
        String result = "";

        NodeList nodeList = parent.getElementsByTagName(tagName);
        Node node = nodeList.item(0); // 첫 번째 항목

        result = node.getChildNodes().item(0).getNodeValue();

        return result;
    }

    public static void test() {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        String url = "breakfast_menu.xml";
        DocumentBuilder builder = null;
        org.w3c.dom.Document xmlObj = null;
        try {
            builder = factory.newDocumentBuilder();
            xmlObj = builder.parse(url);

            Element root = xmlObj.getDocumentElement();
            //           ------ |-------------------
            //        문서객체 ← | → XML DOM의 최상위 엘리먼트

            NodeList foodNodeList = root.getElementsByTagName("food");
            int foodCount = foodNodeList.getLength();

            for (int i = 0; i < foodCount; i++) {
                Node foodNode = foodNodeList.item(i);
                Element foodElement = (Element) foodNode;

                System.out.printf(COLOR_GREEN + "■ [%s] $%s   %s칼로리\n"
                        , getText(foodElement, "name")
                        , getText(foodElement, "price")
                        , getText(foodElement, "calories")
                );
                System.out.printf(COLOR_GREEN + "- %s\n", getText(foodElement, "description"));
                System.out.println(COLOR_BLUE + "-------------------------------------------------------------------");
            }

        } catch (Exception e) {
            System.err.println("XML 파일 로드 및 파싱 실패~!!!");
            System.err.println(e.getMessage());
            e.printStackTrace();
        }

    }

}
