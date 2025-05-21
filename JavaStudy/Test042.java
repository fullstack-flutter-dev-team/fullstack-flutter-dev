/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장. 실행흐름의 컨트롤
		- switch 구문
===================================================================*/

//사용자로부터 임의의 두 정수와 연산자를 입력받아
//해당 연산자의 연산 처리 결과를 출력하는 프로그램을 구현한다.
//단, switch문을 활용하여 처리할 수 있도록 하며,
//연산 결과는 편의상 정수 형태로 처리할 수 있도록 한다.

//실행 예)
//첫 번째 정수 입력 : 3
//두 번째 정수 입력 : 12
//연산자 입력(+ - * /) : -

//>> 3 - 12 = -9
//계속하려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test042
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nNum1, nNum2, nResult = 0;
		String strOp;
		
		// 사용자 입력 안내문구 출력
		System.out.print("첫 번째 정수 입력 : ");
		nNum1 = Integer.parseInt(br.readLine());
		
		System.out.print("두 번쩨 정수 입력 : ");
		nNum2 = Integer.parseInt(br.readLine());
		
		System.out.print("연산자 입력(+ - * /) : ");
		strOp = br.readLine();
		
		switch (strOp)
		{
			case "+": 
				nResult = nNum1 + nNum2;
				break;
			case "-":
				nResult = nNum1 - nNum2;
				break;
			case "*":
				nResult = nNum1 * nNum2;
				break;
			case "/":
				nResult = nNum1 / nNum2;
		}
		
		// 결과 출력
		System.out.printf("\n>> %d %s %d = %d\n", nNum1, strOp, nNum2, nResult);
		// 결과 출력
		//첫 번째 정수 입력 : 10
		//두 번쩨 정수 입력 : 2
		//연산자 입력(+ - * /) : +

		//>> 10 + 2 = 12
		//계속하려면 아무 키나 누르십시오 . . .		
		*/
		
		/*
		// ①
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int a, b, result;
		int op;
		
		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());
		
		System.out.print("연산자 입력 ( + - * /) : ");
		op = System.in.read();
		
		// '+' → op:43
		// '-' → op:45
		// '*' → op:42
		// '/' → op:47
		
		switch (op)
		{
			case 43: result = a + b; break;
			case 45: result = a - b; break;
			case 43: result = a * b; break;
			case 47: result = a / b; break;
			default: return; // 1. 값을 반환, 
							//2. 메서드 종료 → main() 메서드 종료 → 프로그램 종료
		}
		
		System.out.println();
		System.out.printf(">> %d %c %d = %d\n", a, op, b, reasult);
		*/
		
		//	switch문의 『수식』과 case의 『상수』는
		//		byte, short, int, long 이어야 한다.
		//			+ 『문자 타입(char)』 <-- java 버전 업그레드 후
		//			+ 『문자열 타입(String)』
		
		/*
		// ②
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int a, b, result;
		char op;
		
		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());
		
		System.out.print("연산자 입력 ( + - * /) : ");
		//op = System.in.read();
		op = (char)System.in.read();
		
		// '+' → op:43
		// '-' → op:45
		// '*' → op:42
		// '/' → op:47
		
		switch (op)
		{
			case '+': result = a + b; break;
			case '-': result = a - b; break;
			case '*': result = a * b; break;
			case '/': result = a / b; break;
			default: return; // 1. 값을 반환, 
							//2. 메서드 종료 → main() 메서드 종료 → 프로그램 종료
		}
		
		System.out.println();
		System.out.printf(">> %d %c %d = %d\n", a, op, b, reasult);
		
		*/
		
		// ③
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int a, b, result;
		//char op;
		String op;
		
		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());
		
		System.out.print("연산자 입력 ( + - * /) : ");
		//op = System.in.read();
		//op = (char)System.in.read();
		op = br.readLine();
		
		// '+' → op:43
		// '-' → op:45
		// '*' → op:42
		// '/' → op:47
		
		switch (op)
		{
			//case '+': result = a + b; break;
			case "+": result = a + b; break;
			//case '-': result = a - b; break;
			case "-": result = a - b; break;
			//case '*': result = a * b; break;
			case "*": result = a * b; break;
			//case '/': result = a / b; break;
			case "/": result = a / b; break;
			default: return; // 1. 값을 반환, 
							//2. 메서드 종료 → main() 메서드 종료 → 프로그램 종료
		}
		
		System.out.println();
		//System.out.printf(">> %d %c %d = %d\n", a, op, b, result);
		System.out.printf(">> %d %s %d = %d\n", a, op, b, result);
		//결과 출력
		//첫 번째 정수 입력 : 30
		//두 번째 정수 입력 : 20
		//연산자 입력 ( + - * /) : -

		//>> 30 - 20 = 10
		//계속하려면 아무 키나 누르십시오 . . .
	}
}