/**
 * =================================================
 *   XMLDOM.java
 *     -  자바 프로그램
 * =================================================
 */

package com.test;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class XMLDOM
{
    public static String getText(Element parent, String tagName)
    {
        // 반환할 결과값
        String result = "";
        
        // 대산 태그() 객체의 첫 번째 자식 노드 얻어오기
        NodeList nodeList = parent.getElementsByTagName(tagName);
        Element element = (Element) nodeList.item(0);
        
        // 대상 엘리먼트()의 자식 노드(텍스트 노드)의 값 얻어오기
        NodeList childNodeList = element.getChildNodes();

//        result = childNodeList.item(0).getNodeValue();
        // result = childNodeList.item(0).getTextContent();
        result = childNodeList.item(0).getNodeValue();
        
        // 최종 결과값 반환
        return result;
    }

}
