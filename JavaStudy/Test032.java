/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장. 실행흐름의 컨트롤
		- if문
		- if ~ else문 실습
===================================================================*/

//1. 프로그램을 작성할 때 주어진 조건에 따라
//	분기 방향을 정하기 위해 사용되는 제어문에는
//	if문, if - else문, 조건 연산자, 복합 if문(if문 중첩)
//	, switch문 등이 있다.
	
//2. if 문은 if 다음의 조건이 참(true)일 경우
//	특정 문장을 수행하고자 할 때 사용하는 구문이다.
	
	
//	Test031 → 홀수, 짝수 구분 → 단일 if구문 활용
	
//	홀수, 짝수, 영 → if ~ else구문 중첩

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test032
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		int nInput;
		String strResult = "짝수";
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		
		// 사용자 입력 안내문 출력
		System.out.print("임의의 정수 입력 : ");
		nInput = Integer.parseInt(br.readLine());
		
		// 연산
		
		if (nInput == 0)
		{
			strResult = "영";
		} else if (nInput % 2 == 0)
		{
			strResult = "짝수";
		} 
		else 
		{
			strResult = "홀수";
			
		}
		
		// 결과 출력
		System.out.println();
		System.out.printf("%d 은(는) %s입니다.\n", nInput, strResult);
		//결과 출력
		//임의의 정수 입력 : 45

		//45 은(는) 홀수입니다.
		//계속하려면 아무 키나 누르십시오 . . .
	
		//임의의 정수 입력 : 0

		//0 은(는) 영입니다.
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n;
		
		System.out.print("임의의 정수 입력 : ");
		n = Integer.parseInt(br.readLine());
		
		//if (n%2 == 0)
		//{
		//	System.out.println(n + "→ 짝수");
		//}
		//else if (n%2 != 0)
		//{
		//	System.out.println(n + "→ 홀수");
		//}
		//else
		//{
		//	System.out.println(n + "→ 영");
		//}
		
		/*
		if (n%2 != 0)
		{
			System.out.println(n + "→ 홀수");
		}
		else if (n == 0)
		{
			System.out.println(n + "→ 영");
		}
		else if (n%2 == 0)
		{
			System.out.println(n + "→ 짝수");
		}
		*/
		
		String strResult = "판정 불가";
		
		if (n%2 != 0)
		{
			strResult = "홀수";
		}
		else if (n == 0)
		{
			strResult = "영";
		}
		else if (n%2 == 0)
		{
			strResult = "짝수";
		}
		
		System.out.println(n + " → " + strResult);
		//결과 출력
		//임의의 정수 입력 : 0
		//0 → 영
		//계속하려면 아무 키나 누르십시오 . . .
		
		//임의의 정수 입력 : 12
		//12 → 짝수
		//계속하려면 아무 키나 누르십시오 . . .
		//		
		//임의의 정수 입력 : 15
		//15 → 홀수
		//계속하려면 아무 키나 누르십시오 . . .
	}
}