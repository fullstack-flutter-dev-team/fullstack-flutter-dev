/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- 반복문(while문) 실습
===================================================================*/

/*
	1 - 2 + 3 - 4 + 5 - 6 + 7 - 8 + 9 - 10
	의 연산 처리 결과를 출력하는 프로그램을 구현한다.
	
	실행 예)
	연산 결과 : xxx
	계속하려면 아무 키나 누르세요....
*/

public class Test051
{
	public static void main(String[] args)
	{
		/*
		// 변수 선언 및 초기화
		int nNum = 1, nResult = 0;
		
		
		// 연산
		while (nNum <= 10)
		{
			if (nNum % 2 == 0)
			{
				// 짝수 정수 (-)연산
				nResult -= nNum;
			} else {
				// 홀수 정수 (+)연산
				nResult += nNum;
			}
			
			// 확인(테스트)
			System.out.println("nNum : " + nNum + ", nResult : " + nResult);
			//--실행 결과
			// nNum : 1, nResult : 1
			// nNum : 2, nResult : -1
			// nNum : 3, nResult : 2
			// nNum : 4, nResult : -2
			// nNum : 5, nResult : 3
			// nNum : 6, nResult : -3
			// nNum : 7, nResult : 4
			// nNum : 8, nResult : -4
			// nNum : 9, nResult : 5
			// nNum : 10, nResult : -5
			
			nNum++;
		}
		
		// 결과 출력
		System.out.println("연산 결과 : " + nResult);
		//--실행 결과
		// 연산 결과 : -5
		// 계속하려면 아무 키나 누르십시오 . . .		
		*/
		
		// 주요 변수 선언 및 초기화
		int n = 0;		//-- 1부터 10까지 1씩 증가할 변수
		int sum = 0;	//-- 누적 연산 결과를 종합할 변수
		
		// 연산 및 처리
		while (n < 10)	//-- n → 0	2	4	6	8
		{
			n++;		//-- n → 1	3	5	7	9
			sum += n;	//-- sum을 n만큼 증가 → +1	+3	+5	+7	+9
			
			n++;		//-- n → 2	4	6	8	10
			sum -= n;	//-- sum을 n만큼 감소 → -2	-4	-6	-8	-10
		}
		
		// 결과 출력
		System.out.println("연산 결과 : " + sum);
		//실행 결과
		//연산 결과 : -5
		//계속하려면 아무 키나 누르십시오 . . .		
	}
}