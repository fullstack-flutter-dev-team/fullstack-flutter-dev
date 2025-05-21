/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			-반복문 실습 및 관찰
===================================================================*/

/*
	1부터 100까지의 정수 중에서
	짝수들의 합과 홀수들의 합을 따로 구분하여 계산한다.
	그리고, 결과값을 출력하는 프로그램을 구현한다.
	단, 반복문은 while문을 사용할 수 있도록 하며,
	조건 구문은 if 조건문을 사용하여 처리할 수 있도록 한다.
	
	실행 예)
	1부터 100까지 정수의 합 : 5050
	1부터 100까지 짝수의 합 : 2550
	1부터 100까지 홀수의 합 : 2500
	계속하려면 아무 키나 누르세요...
*/

public class Test047
{
	public static void main(String[] args)
	{
		/*
		int nFinalNum = 100;
		int nNum = 0, nEvenSum = 0, nOddSum = 0, nTotalSum = 0;
		
		
		while (nNum < nFinalNum)
		{
			nNum += 1;
			
			// 누적합 계산
			nTotalSum += nNum;
			
			if (nNum % 2 == 0)
			{
				// 짝수 누적합
				nEvenSum += nNum;
			} else if (nNum % 2 != 0)
			{
				// 홀수 누적합
				nOddSum += nNum;
			} else {
				// 프로그램 종료
				return;
			}
		}
		
		// 결과 출력
		System.out.println("1부터 100까지 정수의 합 : " + nTotalSum);
		System.out.println("1부터 100까지 짝수의 합 : " + nEvenSum);
		System.out.println("1부터 100까지 홀수의 합 : " + nOddSum);
		
		//--실행 결과
		// 1부터 100까지 정수의 합 : 5050
		// 1부터 100까지 짝수의 합 : 2550
		// 1부터 100까지 홀수의 합 : 2500
		// 계속하려면 아무 키나 누르십시오 . . .
		*/
		
		
		// 주요 변수 선언 및 초기화
		//int n=1, sum=0, even=0, odd=0;
		int n=1, sum, even, odd;
		sum=even=odd=0;
		
		// 연산 및 처리
		while (n <= 100)		// n → 1		→2				→ 3
		{
			sum += n;			// sum += 1		→ sum += 2
			
			if (n%2 == 0) {		//				→ even += 2
				even += n;
			} else if (n%2 != 0) {
				odd += n;		// odd += 1						→ odd += 3
			} else {
				System.out.println("처리 불가 데이터~!!!");
				return; // 메서드의 반한값 리턴, 해당 메서드 종료 → main()메서드 종료 → 프로그램 종료 
			}
			
			n++;				// n → 2 → 3 → 4
		}
		
		
		// 결과 출력
		System.out.println("1부터 100까지 정수의 합 : " + sum);
		System.out.println("1부터 100까지 짝수의 합 : " + even);
		System.out.println("1부터 100까지 홀수의 합 : " + odd);
		//--실행결과
		//1부터 100까지 정수의 합 : 5050
		//1부터 100까지 짝수의 합 : 2550
		//1부터 100까지 홀수의 합 : 2500
		//계속하려면 아무 키나 누르십시오 . . .		
	}
}