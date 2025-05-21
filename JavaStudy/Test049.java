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
	
			1 + (1+2) + (1+2+3) + (1+2+3+4) +... + (1+2+3+ ...+10)
		
	n	→	1	2		3			4	...				10
	s1	→		3		6			10	...				55
	s2	→	1	4		10			20	...				220
*/


public class Test049
{
	public static void main(String[] args)
	{
		/*
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
		*/
		
		/*
		int n=0;
		int s1=0, s2=0;
		
		while (n < 10)		//-- n	→	0	1	2	3	4		5		6		7		8		9
		{
			n++;			//-- n	→	1	2	3	4	5		6		7		8		9		10
			s1 += n;		//-- s1	→	1	3	6	10	15		21		28		36		45		55
			s2 += s1;		//-- s2	→	1	4	10	20	35		56		84		120		165		220
		}
		
		System.out.println("연산 결과 : " + s2);
		*/
		
		int n=0;
		int sum=0;
		
		while (n < 10)
		{
			n++;
			sum += n;
			
			// 변수값 출력으로 로직 확인
			System.out.println("sum:" + sum);
		}
		
		//System.out.println("sum : " + sum);
		//--실행결과
		//sum : 55
		//계속하려면 아무 키나 누르십시오 . . .		
		
	}
}

// 실행 결과
// 연산 결과 : 220
// 계속하려면 아무 키나 누르십시오 . . .


// 변수값 출력으로 로직 확인
//--실행결과
//sum:1
//sum:3
//sum:6
//sum:10
//sum:15
//sum:21
//sum:28
//sum:36
//sum:45
//sum:55
//계속하려면 아무 키나 누르십시오 . . .