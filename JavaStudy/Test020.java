/*===================================================================
	■■■ 자바 기본 프로그래밍 ■■■
		- 산술 연산자
		- BufferedReader
		- printf()
===================================================================*/

// ○ 사용자로부터 임의의 정수를 두 번 입력받아
//		사칙 연산 및 나머지 연산을 수행하여
//		그 결과를 출력하는 프로그램을 구현한다.
//		단, 입력받는 과정은 BufferedReader 를 활용할 수 있도록 하고,
//		출력하는 과정은 printf() 메소드를 활용할 수 있도록 한다.
//		또한, 나눗셈 연산은 편의상 정수 기반(몫은 취하는 형태)으로 처리한다.


//실행 예)
//첫 번째 정수 입력 : 10
//두 번째 정수 입역 : 2

//====[결과]====
//10 + 2 = 12
//10 - 2 = 8
//10 * 2 = 10
//10 / 2 = 5
//10 % 2 = 5
//===============
//계속하려면 아무 키나 누르세요...


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test020
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nFirst, nSecond, nSum, nMin, nMul, nDiv, nMod;
		
		
		// - 사용자 입력 안내
		System.out.print("첫 번째 정수 입력 : ");
		nFirst = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		nSecond = Integer.parseInt(br.readLine());
		
		
		// 연산
		nSum = nFirst + nSecond;
		nMin = nFirst - nSecond;
		nMul = nFirst * nSecond;
		nDiv = nFirst / nSecond;
		nMod = nFirst % nSecond;
		
		
		// 결과 출력
		System.out.println();
		System.out.println("======[결과]========");
		System.out.printf("%d + %d = %d\n", nFirst, nSecond, nSum);
		System.out.printf("%d - %d = %d\n", nFirst, nSecond, nMin);
		System.out.printf("%d * %d = %d\n", nFirst, nSecond, nMul);
		System.out.printf("%d / %d = %d\n", nFirst, nSecond, nDiv);
		System.out.printf("%d %% %d = %d\n", nFirst, nSecond, nMod);
		System.out.println("===================");
		//--최종 출력
		//첫 번째 정수 입력 : 10
		//두 번째 정수 입력 : 2

		//======[결과]========
		//10 + 2 = 12
		//10 - 2 = 8
		//10 * 2 = 20
		//10 / 2 = 5
		//10 % 2 = 0
		//===================
		//계속하려면 아무 키나 누르십시오 . . .		
		
		// 
		br.close();
		*/
		
		// 주요 변수 선언
		int num1, num2;			//-- 사용자 입력값을 담을 변수
		int res1, res2, res3, res4, res5;	//-- 각각의 연산 결과를 담을 변수
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		
		// 연산 및 처리
		System.out.print("첫 번째 정수 입력 : ");
		num1  = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		num2 = Integer.parseInt(br.readLine());
		
		
		// 연산
		res1 = num1 + num2;
		res2 = num1 - num2;
		res3 = num1 * num2;
		res4 = num1 / num2;
		res5 = num1 % num2;
		
		// 결과 출력
		//System.out.println("\n====[결과]=====");
		//System.out.printf("\n====[결과]=====\n");
		System.out.printf("%n====[결과]=====%n");
		//System.out.printf("○ + ○ = ○%n", num1, num2, res1);
		System.out.printf("%d + %d = %d%n", num1, num2, res1);
		System.out.printf("%d - %d = %d%n", num1, num2, res2);
		System.out.printf("%d * %d = %d%n", num1, num2, res3);
		System.out.printf("%d / %d = %d%n", num1, num2, res4);
		System.out.printf("%d % %d = %d%n", num1, num2, res5);
		//--- 런타임 에러 발생
		//첫 번째 정수 입력 : 10
		//두 번째 정수 입력 : 2

		//====[결과]=====
		//10 + 2 = 12
		//10 - 2 = 8
		//10 * 2 = 20
		//10 / 2 = 5
		//Exception in thread "main" java.util.IllegalFormatFlagsException: Flags = ' '
		//		at java.util.Formatter$FormatSpecifier.checkText(Formatter.java:3037)
		//		at java.util.Formatter$FormatSpecifier.<init>(Formatter.java:2733)
		//		at java.util.Formatter.parse(Formatter.java:2560)
		//		at java.util.Formatter.format(Formatter.java:2501)
		//		at java.io.PrintStream.format(PrintStream.java:970)
		//		at java.io.PrintStream.printf(PrintStream.java:871)
		//		at Test020.main(Test020.java:117)
		//계속하려면 아무 키나 누르십시오 . . .
		
		// %% → 퍼센트(%) 기호 출력
		System.out.printf("%d %% %d = %d%n", num1, num2, res5);
		System.out.printf("%n=============%n");
		
	}
}