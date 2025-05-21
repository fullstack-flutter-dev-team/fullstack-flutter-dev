/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- 반복문(while문) 실습
===================================================================*/

/*
	1 + (1+2) + (1+2+3) + ... + (1+2+3+ ...+10)
	의 연산 처리 결과를 출력하는 프로그램을 구현한다.
	
	
	실행 예)
	연산 결과 : xxx
	계속하려면 아무 키나 누르세요...
*/


public class Test049
{
	public static void main(String[] args)
	{
			// 변수 선언 및 초기화
		int nFinalNum = 10;
		int nNum = 0, nSum = 0, nCumulSum = 0;
		
		
		// 연산
		while (nNum < nFinalNum)
		{
			nNum += 1;				//-- 1씩 증가
			
			// 확인(테스트)
			//System.out.println("nNum : " + nNum);
			
			// 정수 누적합 계산
			nSum += nNum;
			
			// 누적합의 누적합 계산
			nCumulSum += nSum;
			
			// 확인(테스트)
			//System.out.printf("nNum=%d, nSum=%d, nCumulSum= %d\n",nNum, nSum, nCumulSum);
		}
		
		// 결과 출력
		System.out.println("연산 결과 : " + nCumulSum);
		//--실행 결과
		// 연산 결과 : 220
		// 계속하려면 아무 키나 누르십시오 . . .
	
	
	
	}
}