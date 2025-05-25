/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- 반복문(while문) 실습 
===================================================================*/

/*
	○ 과제
	사용자로부터 임의의 정수를 입력받아
	1부터 입력받은 그 정수까지의
	전체 합과, 짝수의 합과, 홀수의 합을
	각각 결과값으로 출력하는 프로그램을 구현한다.
	
	실행 예)
	임의의 정수 입력 : 586
	>> 1 에서 586까지 정수의 합 : 
	>> 1 에서 586까지 짝수의 합 : 
	>> 1 에서 586까지 홀수의 합 :
	계속하려면 아무 키나 누르세요....
	
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test056
{
	public static void main(String[] args) throws IOException
	{
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nIndex, nInNum, nTotalSum, nEvenSum, nOddSum;	//-- while 반복문, 누적합, 짝수/홀수합 변수 선언
		nTotalSum = nEvenSum = nOddSum = 0;					//-- 누적합, 짝수/홀수합 변수 초기화
		nIndex = 1;											//-- while 반복문 변수 초기화
		
		// 사용자 입력 안내문구 출력
		System.out.print("임의의 정수 입력 : ");
		nInNum = Integer.parseInt(br.readLine());
		
		// 연산 처리
		if (nInNum > 0)
		{
			while (nIndex <= nInNum)
			{
				if (nIndex % 2 == 0)
				{
					// 짝수합
					nEvenSum += nIndex;
				} else {
					// 홀수합
					nOddSum += nIndex;
				}
				
				// 누적합
				nTotalSum += nIndex;
				
				// 테스트(확인)
				//System.out.printf("nIndex : %d, nInNum : %d\n", nIndex, nInNum);
				nIndex++;	//-- while 반복문 변수 +1 증가
			}
			
			// 결과 출력
			System.out.printf(">> 1에서 %d까지 정수의 합 : %d\n", nInNum, nTotalSum);
			System.out.printf(">> 1에서 %d까지 짝수의 합 : %d\n", nInNum, nEvenSum);
			System.out.printf(">> 1에서 %d까지 홀수의 합 : %d\n", nInNum, nOddSum);
		} else {
			System.out.println("입력오류~!! (1보다 큰 정수 입력)");
			return;		//-- 현재 메서드(main()) 종료 → 프로그램 종료
		}
	}
}

//--실행결과
/*

임의의 정수 입력 : 586
>> 1에서 586까지 정수의 합 : 171991
>> 1에서 586까지 짝수의 합 : 86142
>> 1에서 586까지 홀수의 합 : 85849
계속하려면 아무 키나 누르십시오 . . .


임의의 정수 입력 : -2
입력오류~!! (1보다 큰 정수 입력)
계속하려면 아무 키나 누르십시오 . . .

*/