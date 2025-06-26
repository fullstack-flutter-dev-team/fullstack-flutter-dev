package com.sist;


import java.util.Scanner;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        System.out.println("Hello World!");
        System.out.println("Hello World!");
        System.out.println("Hello World!");
        System.out.println("Hello World!");
        System.out.println("Hello World!");
        System.out.println("Hello World!");

         System.out.println("Hello World!");
        // 최종 완성될 JSONObject 선언(전체)
		JSONObject jsonFinalObject = new JSONObject();

		// JSON정보를 담을 Array 선언
		JSONArray jsonArray = new JSONArray();
		
		//실제 정보가 담기는 곳
		JSONObject info = new JSONObject();
		info.put("info1", "infoValue");
		info.put("info2", "info2Value");
		info.put("info3", 1.0);
		info.put("info4", "info4Value");
		info.put("info5", "info5Value");
		
		jsonArray.add(info);
		System.out.println("json Array data : "+ jsonArray.toString());
		/**
		 * [
				{
				"info1":"infoValue",
				"info5":"info5Value",
				"info4":"info4Value",
				"info3":1,
				"info2":"info2Value"
				}
		    ]
		 */
		//array데이터를  json에 넣기
		jsonFinalObject.put("arrayValue", jsonArray);
		System.out.println("json Final Object data: "+ jsonFinalObject.toString());
		/**
		 * {
			"addrValue":[
				{
				"info1":"infoValue",
				"info5":"info5Value",
				"info4":"info4Value",
				"info3":1.0,
				"info2":"info2Value"
				}
			  ]
			}
		 */
		//jsonString 데이터를 Parser로 JsonObject로 만들기
		String JsonString = "{\"arrayValue\":[{\"info1\":\"infoValue\",\"info5\":\"info5Value\",\"info4\":\"info4Value\",\"info3\":1.0,\"info2\":\"info2Value\"}]}";
		try {
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(JsonString);
			JSONObject object = (JSONObject) obj;
			System.out.println("Get Json Data From JsonString "+ object.toJSONString());
			/**
			 * {
				"addrValue":[
					{
					"info1":"infoValue",
					"info5":"info5Value",
					"info4":"info4Value",
					"info3":1.0,
					"info2":"info2Value"
					}
				  ]
				}
			 */
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Scanner 테스트
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter a string: ");
		String input = scanner.nextLine();
		System.out.println("You entered: " + input);
		scanner.close();
    }
}
