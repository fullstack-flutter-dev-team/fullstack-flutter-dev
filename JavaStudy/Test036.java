/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장. 실행흐름의 컨트롤
		- if문
		- if ~ else문 실습
===================================================================*/


//사용자로부터 임의의 정수 세 개를 입력받아
//작은 수에서 큰 수 순으로 출력하는 프로그램을 구현한다.


//실행 예)
//첫 번째 정수 입력 : 10
//두 번째 정수 입력 : 2700
//세 번째 정수 입력 : 36

//>> 정렬 결과 : 10 36 2700
//계속하려면 아무 키나 누르세요...


//	①첫 번째 정수 vs 두 번째 정수 크기 비교
//		→ 첫 번째 정수가 두 번째 정수보다 클 경우... 자리 바꿈


//	②두 번째 정수 vs 세 번재 정수 크기 비교
//		→ 첫 번째 정수가 세 번째 정수보다 클 경우... 자리 바꿈


//	③세 번째 정수 vs 세 번째 정수 크기 비교
//		→ 두 번째 정수가 세 번째 정수보다 클 경우... 자리 바꿈

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test036
{
	public static void main(String[] args) throws IOException
	{
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int a, b, c;			//-- 사용자가 입력하는 임의의 정수를 담아둘 변수
		int temp;				//-- 임의 저장 변수
		
		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());
		
		System.out.print("세 번째 정수 입력 : ");
		c = Integer.parseInt(br.readLine());
		
		
		// 테스트(확인)
		//System.out.printf("\n>> 입력 확인 : %d, %d, %d\n", a, b, c);
		
		//	① 첫 번째 정수가 두 번째 정수보다 클 경우... 자리 바꿈
		if (a > b)
		{
			// 자리 바꿈
			/*
			temp = a;
			a = b;
			b = temp;
			*/
			a=a^b;
			b=b^a;
			a=a^b;
		}
		
		//	② 첫 번째 정수가 세 번째 정수보다 클 경우... 자리 바꿈
		if (a > c)
		{
			// 자리 바꿈
			/*
			temp = a;
			a = c;
			c = temp;
			*/
			a=a^c;
			c=c^a;
			a=a^c;
		}
		
		//	③ 두 번째 정수가 세 번째 정수보다 클 경우... 자리 바꿈
		if (b > c)
		{
			// 자리 바꿈
			/*
			temp = b;
			b = c;
			c = temp;
			*/
			
			b=b^c;
			c=c^b;
			b=b^c;
		}
		
		// 최종 결과 출력
		System.out.printf("\n>> 정렬 결과 : %d, %d, %d\n", a, b, c);
		// 실행 결과
		//첫 번째 정수 입력 : 320
		//두 번째 정수 입력 : 84
		//세 번째 정수 입력 : 61

		//>> 정렬 결과 : 61, 84, 320
		//계속하려면 아무 키나 누르십시오 . . .		
		
		// 두번째 방법
		//첫 번째 정수 입력 : 320
		//두 번째 정수 입력 : 84
		//세 번째 정수 입력 : 61

		//>> 정렬 결과 : 61, 84, 320
		//계속하려면 아무 키나 누르십시오 . . .		

	}
}