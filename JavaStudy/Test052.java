/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- 반복문(while문) 실습
===================================================================*/

/*
	사용자로부터 임의의 정수를 입력받아(BufferedReader)
	해당 값의 자릿수를 출력하는 프로그램을 구현한다.
	
	
	실행 예)
	임의의 정수 입력 : 34567
	>> 34567의 자릿수는 6
	계속하려면 아무 키나 누르세요...
	
	임의의 정수 입력 : 9
	>> 9의 자릿수는 1
	계속하려면 아무 키나 누르세요...
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test052
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		int nInNum, nTemp, nDigits = 0;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 사용자 입력 안내문구 출력
		System.out.print("임의의 정수 입력 : ");
		nInNum = Integer.parseInt(br.readLine());
		nTemp = nInNum;
		
		// 연산
		while (nTemp > 0)
		{
			nDigits += 1;
			nTemp /= 10;
		}
		
		
		// 결과 출력
		System.out.printf(">> %d의 자릿수는 %d\n", nInNum, nDigits);
		//--실행 결과
		// 임의의 정수 입력 : 397624
		// >> 397624의 자릿수는 6
		// 계속하려면 아무 키나 누르십시오 . . .
		// 	
		// 임의의 정수 입력 : 9
		// >> 9의 자릿수는 1
		// 계속하려면 아무 키나 누르십시오 . . .
		*/
		
		// 주요 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n;			//-- 사용자의 입력값을 담아낼 변수
		int len;		//-- 입력받은 정수의 자릿수(길이)를 담아낼 변수
		int temp;		//-- 사용자의 입력값을 임시로 담아둘 변수
		
		
		// 연산 및 처리
		System.out.print("임의의 정수 입력 : ");
		n = Integer.parseInt(br.readLine());
		
		// 변수 초기화
		temp = n;
		len = 1;
		
		while (temp >= 10)
		{
			len++;		//-- 자릿수 증가
			temp /= 10;	//-- 몫을 취한다.
		}
		
		// 결과 출력
		System.out.println(">> " + n + "의 자릿수는 " + len);
		//--실행 결과
		//임의의 정수 입력 : 123
		//>> 123의 자릿수는 3
		//계속하려면 아무 키나 누르십시오 . . .		
	}
}