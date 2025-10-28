/**
 * =================================================
 *   XmlDomTest02.java
 *     - 콘솔 기반 자바 프로그램
 *     - XML DOM활용 → 로컬(local) XML 읽어내기
 *       (memberList.xml)
 * =================================================
 */

package com.test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlDomTest02
{
    static String COLOR_RED      = "\u001B[31m" ;
    static String COLOR_GREEN    = "\u001B[32m" ;
    static String COLOR_YELLOW   = "\u001B[33m" ;
    static String COLOR_BLUE     = "\u001B[34m" ;
    
    public static void main(String[] args)
    {
        System.out.println("XML DOM TEST 02");
        // XML 파일을 메모리에 로드
        //    → XML DOM 형성(구축)
        // 루트 엘리먼트 접근
        // 특정 하위 엘리먼트 접근
        //    → 위치, 이름 등을 기준으로 접근
        // 텍스트 노드(속성 노드) 접근
        // 데이터 획득
        // 결과 처리(출력)
        
        /* 
        김한국 010-1231-1231
        이영희 010-2342-2342
        ...
        */

        // 풀이
        //test();
        
        try {
            // 1. XML 파일을 메모리에 로드시킬 수 있도록 준비
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document xmlObj = null;

            // 2. XML 파일을 메모리에 로드(적재) → XML DOM 형성(구축)
            String url = "memberList.xml";
            xmlObj = builder.parse(url);

            // 3. 루트 엘리먼트 접근
            Element root = xmlObj.getDocumentElement();
            //             ------ |-------------------
            //          문서객체 ← | → XML DOM의 최상위 엘리먼트
            System.out.println("루트 엘리먼트 : " + root.getNodeName());
            //-- 문서의 대표 엘리먼트(루트 엘리먼트)를 얻어내는 과정
            //     → memberList
            //--==>> 루트 엘리먼트 : memberList

            // 4. 루트 엘리먼트를 통해 특정 하위 엘리먼트 접근(memberInfo)
            NodeList memberNodeList = root.getElementsByTagName("memberInfo");
            //-- 이 때, getElementsByTagName() 메소드는
            //    태그의 이름을 가지고 자식이나 자손 노드에 접근할 수 있도록 해주는 메서드
            // memberInfo 엘리먼트에 접근
            // → 여러 개 존재하기 때문에 NodeList 객체로 반환

            // ※ check~!!!
            // XML의 모든 노드는 루트 엘리먼트 하위에 존재~!!!

            for (int i = 0; i < memberNodeList.getLength(); i++)  // memberInfo 엘리먼트의 갯수만큼 반복(i → 0 ~ n-1)
            {
                Node memberNode = (Element)memberNodeList.item(i);
                //-- getElementsByTagName() 메소드로 얻어낸 NodeList 객체에서
                //   특정 인덱스(i)에 해당하는 엘리먼트를 얻어내는 과정

                // 캐스팅
                // memberNode → memberInfo 엘리먼트
                Element memberElement = (Element)memberNode;
                // 특정 엘리먼트의 자식노드(TextNode)의 값(NodeValue)를 얻어올 수 있도록 처리
                //-- 엘리먼트가 노드의 하위 개념이기 때문에 가능한 구문

                System.out.printf(COLOR_GREEN + "%s %s\n", 
                                    getText(memberElement, "name"), 
                                    getText(memberElement, "telephone")
                                );

                // [커리큘럼에 대한 처리 추가]--------------------------------------
                
                // memberElement → memberInfo 엘리먼트
                // ※ memberInfo 엘리먼트의 자식 엘리먼트 → name, telephone, curriculum
                //    → curriculum 엘리먼트는 다시 자식 엘리먼트(과목들)를 가짐
                // memberInfo 엘리먼트의 하위 엘리먼트 curriculum 접근
                NodeList curriculumNodeList = memberElement.getElementsByTagName("curriculum");

                // check~!!!
                if (curriculumNodeList.getLength() > 0) {
                    // curriculum 엘리먼트는 1개이므로 첫 번째(0번째) 엘리먼트 접근
                    Node curriculumNode = curriculumNodeList.item(0);
                    Element curriculumElement = (Element)curriculumNode;

                    // 방법 1.
                    // curriculum 엘리먼트의 자식 엘리먼트(subject)에 접근
                    NodeList subNodeList = curriculumElement.getElementsByTagName("sub");
                    System.out.print(COLOR_YELLOW + "  수강과목 : ");

                    for (int j = 0; j < subNodeList.getLength(); j++)
                    {
                        Node subjectNode = subNodeList.item(j);
                        Element subjectElement = (Element)subjectNode;

                        System.out.printf(" - %s\n", subjectElement.getTextContent());

                        if (j < subNodeList.getLength() - 1)
                        {
                            System.out.print(", ");
                        }
                    }
                    System.out.println();
                }
                
                System.out.println();
                // 방법 2
                /* 
                    Node Type                Named Constant
                    ---------------------------------------
                    Element                 ELEMENT_NODE                 1
                    Attribute               ATTRIBUTE_NODE               2
                    Text                    TEXT_NODE                    3
                    CDATA Section           CDATA_SECTION_NODE           4
                    Entity Reference        ENTITY_REFERENCE_NODE        5
                    Entity                  ENTITY_NODE                  6
                    Processing Instruction  PROCESSING_INSTRUCTION_NODE  7
                    Comment                 COMMENT_NODE                 8
                    Document                DOCUMENT_NODE                9
                    Document Type           DOCUMENT_TYPE_NODE          10
                    Document Fragment       DOCUMENT_FRAGMENT_NODE      11
                    Notation                NOTATION_NODE               12
                */
                Element curriculumElement = (Element)memberElement.getElementsByTagName("curriculum");

                curriculumElement.getChildNodes();

                
                // --------------------------------------[커리큘럼에 대한 처리 추가]
            }


        } catch (Exception e) {
            System.err.println("XML 파일 로드 및 파싱 실패~!!!");
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }

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

    public static void test() {
        System.out.println(COLOR_RED + "-----------------------------------");
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try
        {
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document xmlObj = builder.parse("memberList.xml");
            /* 
               memberList.xml
               --------------------------------------------
               <memberList>
                   <memberInfo>
                       <name>김한국</name>
                       <telephone>010-1231-1231</telephone>
                   </memberInfo>
                   <memberInfo>
                       <name>이영희</name>
                       <telephone>010-2342-2342</telephone>
                   </memberInfo>
                   ...
            */

            Element rootElement = (Element) xmlObj.getDocumentElement();
            // 루트 엘리먼트 → memberList

            NodeList memberNodeList = rootElement.getElementsByTagName("memberInfo");
            // memberInfo 엘리먼트에 접근
            // → 여러 개 존재하기 때문에 NodeList 객체로 반환

            for (int i = 0; i < memberNodeList.getLength(); i++)
            {
                Node memberElement = (Element)memberNodeList.item(i);

                String name = ((Element) memberElement).getElementsByTagName("name").item(0).getTextContent();
                String phone = ((Element) memberElement).getElementsByTagName("telephone").item(0).getTextContent();

                System.out.printf(COLOR_GREEN + "%s %s\n", name, phone);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        System.out.println(COLOR_RED + "-----------------------------------");
    }

}
