/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장. 반복문 실습 및 관찰
===================================================================*/
/*
○ 반복문의 개요
	주어진 조건이 참(true) 인 경우
	일정한 영역의 문장을 반복 수행하다가
	조건식이 거짓(false) 이 되는 순간이 오면,
	반복 수행을 중단하는 문장이다.

	이러한 반복문에는 『while』 , 『do ~ while』, 『for』 문 등이 있으며
	반복의 제어를 위해 『break』, 『continue』문을
	사용하는 경우가 있다.

○ while 문
	조건식을 먼저 비교하여
	조건식의 처리 결과가 참(true)인 경우, 특정 영역을 반복 수행하는 문장으로
	반복의 횟수가 정해져 있지 않은 경우나
	반복 횟수가 많은 경우
	반복은 커녕 한 번도 실행되지 않을 수 있다.

○ while 문의 형식 및 구조

	while (조건식)
	{
		실행문;
	}

*/

public class Test044
{
	public static void main(String[] args)
	{
		/*
		int n=0;
		
		while (n<=10)
		{
			System.out.println("n=" + n);
			n++;
		}
		
		*/
		//--결과 출력
		//n=0
		//n=1
		//n=2
		//n=3
		//n=4
		//n=5
		//n=6
		//n=7
		//n=8
		//n=9
		//n=10
		//계속하려면 아무 키나 누르십시오 . . .
		
		/*
		int n=0;
		
		while (n<=10)
		{
			n++;
			System.out.println("n=" + n);
		}
		
		//--결과출력
		//n=1
		//n=2
		//n=3
		//n=4
		//n=5
		//n=6
		//n=7
		//n=8
		//n=9
		//n=10
		//n=11
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		/*
		int n=0;
		
		while (n++<=10)
		{
			System.out.println("n=" + n);
		}
		
		//--결과 출력
		//n=1
		//n=2
		//n=3
		//n=4
		//n=5
		//n=6
		//n=7
		//n=8
		//n=9
		//n=10
		//n=11
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		/*
		int n=0;
		
		while (++n<=10)
		{
			System.out.println("n=" + n);
		}
		
		//--결과 출력
		//n=1
		//n=2
		//n=3
		//n=4
		//n=5
		//n=6
		//n=7
		//n=8
		//n=9
		//n=10
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		/*
		int n=0;
		
		while (n++<=10)
		{
			System.out.println("n=" + ++n);
		}
		
		//-- 결과 출력
		//n=2
		//n=4
		//n=6
		//n=8
		//n=10
		//n=12
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		/*
		int n=1;
		
		while (n<10)
		{
			System.out.println("n=" + n);
			n++;
		}
		
		//-- 결과 출력
		//n=1
		//n=2
		//n=3
		//n=4
		//n=5
		//n=6
		//n=7
		//n=8
		//n=9
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		/*
		1 부터 100까지의 합을 계산하여
		결과를 출력하는 프로그램을 구현한다.
		단, while 반목분을 활용한다.
		
		실행 예)
		1부터 100까지의 합 : xxx
		계속하려면 아무 키나 누르세요...
		
		※ 문제 인식 및 분석
			1. 출력 구문이 반복문의 영역 밖에 위치해야 한다.
			2. 1부터 1씩 증가할 변수와 누적합을 담을 변수
				이렇게 두 개의 변수가 필요하다.
		*/
		
		/*
		// 변수 선언 및 초기화
		int nNum = 1, nSum = 0;
		
		// while 반복문으로 100까지 합산 처리
		while (nNum <= 100)
		{
			nSum += nNum;
			nNum++;
		}
		
		// 결과 출력
		System.out.println("1부터 100까지의 합 : " + nSum);
		
		//--실행 결과
		//1부터 100까지의 합 : 5050
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		// 1부터 차례로 담아 1씩 증가하는 변수 선언 및 초기화
		//int n = 1;
		int n = 0;
		
		// 누적합을 계산하여 담아낼 변수 선언 및 초기화
		int sum = 0;
		
		// 연산 및 처리 → 반복 연산 → 반복문 구성
		while (n<100)	// 0 1 2 3 4 ... 99
		{
			// n을 1만큼 증가
			n++;		// 1 2 3 4 ... 100
			
			// sum을 n만큼 증가
			sum += n;	// ??? += 1; → sum(0) += 1; → sum += n; → sum += 1 ... sum += 100;
		}
		
		// 결과 출력
		System.out.println("1부터 100까지의 합 : " + sum);
		// 실행 결과
		//1부터 100까지의 합 : 5050
		//계속하려면 아무 키나 누르십시오 . . .
		
	}
}
