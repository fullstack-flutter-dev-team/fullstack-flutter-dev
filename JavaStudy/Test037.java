/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장. 실행흐름의 컨트롤
		- if문
		- if ~ else문 실습
===================================================================*/

//사용자로부터 임의의 정수 5개를 입력받아
//짝수별, 홀수별 합계를 출력하는 프로그램을 구현한다.
//단, Scanner를 활용하여 데이터를 입력받을 수 있도록 한다.


//실행 예)
//임의의 정수 5개 입력(공백 구분) : 11 22 33 44 555


//>> 짝수의 합은 66, 홀수의 합은 99 입니다.
//계속하려면 아무 키나 누르세요...

import java.util.Scanner;

public class Test037
{
	public static void main(String[] args)
	{
		/*
		// 변수 선언 및 초기화
		int a, b, c, d, e;
		int nOddSum = 0, nEvenSum = 0;
		Scanner sc = new Scanner(System.in);
		sc.useDelimiter(" ");
		
		// 사용자 입력 안내문구 출력
		System.out.print("임의의 정수 5개 입력(공백구분) : ");
		// 연산
		a = sc.nextInt();
		b = sc.nextInt();
		c = sc.nextInt();
		d = sc.nextInt();
		e = sc.nextInt();

		if (a % 2 == 0)
		{
			nEvenSum += a;
		} else {
			nOddSum += a;
		}
		
		if (b % 2 == 0)
		{
			nEvenSum += b;
		} else {
			nOddSum += b;
		}
		
		if ( c % 2 == 0)
		{
			nEvenSum += c;
		} else {
			nOddSum += c;
		}
		
		if (d % 2 == 0)
		{
			nEvenSum += d;
		} else {
			nOddSum += d;
		}
		
		if (e % 2 == 0)
		{
			nEvenSum += e;
		} else {
			nOddSum += e;
		}
	
		
		// 결과 출력
		System.out.printf("\n a(%d), b(%d), c(%d), d(%d), e(%d)\n", a, b, c, d, e);
		System.out.printf("\n>> 짝수의 합은 %d, 홀수의 합은 %d 입니다.\n", nEvenSum, nOddSum);
		
		*/
		
		
		// 주요 변수 선언
		Scanner sc = new Scanner(System.in);
		int num1, num2, num3, num4, num5;		//--사용자로부터 입력받은 다섯 개의 정수를 담아둘 변수
		
		// 누적 합의 변수는 0으로 초기화
		int even = 0;								//--짝수의 누적 합을 담아낼 변수
		int odd = 0;								//--홀수의 누적 합을 담아낼 변수
		
		// ※ 누적합을 담아낼 변수에 대한 초기화 check~!!!!
		
		// 연산 및 처리
		System.out.print("임의의 정수 5개 입력(공백 구분) : "); // 1 2 3 4 5
		//num1 = Integer.parseInt(br.readLine());
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		num3 = sc.nextInt();
		num4 = sc.nextInt();
		num5 = sc.nextInt();
		
		if (num1 %2 ==0) //-- num1 이 짝수일 때
		{
			// even을 num1 만큼 증가
			even += num1;
		}
		else			//-- num1이 짝수가 아닐 때 → num1이 홀수일 때
		{
			// odd를 num1 만큼 증가
			odd += num1;
		}
		
		if (num2 %2 == 0)
			even += num2;
		else
			odd += num2;
		
		if (num3%2 == 0)
			even += num3;
		else
			odd += num3;
		
		if (num4%2 == 0)
			even += num4;
		
		if (num5%2 ==0)
			even += num5;
		else
			odd += num5;
		
		// 결과 출력
		System.out.printf("\n>> 짝수의 합은 %d, 홀수의 합은 %d 입니다.\n", even, odd);
		//--결과 출력
		//임의의 정수 5개 입력(공백 구분) : 23 31 42 17 60

		//>> 짝수의 합은 102, 홀수의 합은 54 입니다.
		//계속하려면 아무 키나 누르십시오 . . .
		
	}
}