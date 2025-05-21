/*===================================================================
	■■■ 자바와 익수해지기 ■■■
		- 5장. 실행흐름의 컨트롤
		- if문
		- if ~ else문 실습
===================================================================*/

//실행 예)
//임의의 정수 입력 : 24
//>> 24은(는) 짝수입니다.
//계속하려면 아무 키나 누르세요....


//임의의 정수 입력 : 37
//>> 37은(는) 홀수입니다.
//계속하려면 아무 키나 누르세요....

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;



public class Test031
{
	public static void main(String[] args) throws IOException
	{
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int num;
		String strResult = "짝수입니다.";
		
		System.out.print("임의의 정수 입력 : ");
		num  = Integer.parseInt(br.readLine());
		
		if (num % 2 != 0)
		{
			//System.out.printf(">> %d은(는) 홀수입니다.\n", num);
			strResult ="홀수입니다.";
		}
		
		//if (num % 2 == 0)
		//{
		//	System.out.printf(">> %d은(는) 짝수입니다.\n", num);
		//	strResult ="홀수입니다.";
		//}
		
		System.out.println(num + "은(는) " + strResult);
		//--실행 결과
		//임의의 정수 입력 : 56
		//56은(는) 짝수입니다.
		//계속하려면 아무 키나 누르십시오 . . .
	}
}