/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ /* */

/*
사용자로부터 임의의 두 정수와 연산자를 입력받아
해당 연산을 수행하는 프로그램을 구현한다.
단, 클래스와 인스턴스의 개념을 활용하여 작성할 수 있도록 한다.
(→ Calculate 클래스 설계)
나눗셈 연산은 편의상 정수 형태로 처리한다.


실행 예)
	임의의 두 정수 입력(공백 구분) : 10 5
	임의의 연산자 입력( + - * /)   : +
	>> 10 + 5 = 15
	계속하려면 아무 키나 누르세요...
*/

import java.util.Scanner;
import java.io.IOException;

/*
class Calculate
{
	int nNumA, nNumB;
	char cOp;
	
	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);
		//sc.useDelimiter(" ");
		System.out.print("임의의 두 정수 입력(공백 구분) : ");
		//sc.skip(2);
		nNumA = sc.nextInt();
		nNumB = sc.nextInt();
		
		
		System.out.print("임의의 연산자 입력(+ - * /) : ");
		cOp = (char)System.in.read();
		
		//확인(테스트)
		//System.out.printf("a : %d, b : %d, op: %c\n", nNumA, nNumB, cOp);
	}
	
	int calculate()
	{
		int result = 0; 
		
		switch (cOp)
		{
			case '+': result = calcSum(); break;
			case '-': result = calcMinus(); break;
			case '*': result = calcProduct(); break;
			case '/': result = clacDiv(); break;
		}
		
		return result;
	}
	
	int calcSum()
	{
		return (nNumA + nNumB);
	}
	
	int calcMinus()
	{
		return (nNumA - nNumB);
	}
	
	int calcProduct()
	{
		return (nNumA * nNumB);
	}
	
	int clacDiv()
	{
		return (nNumA / nNumB);
	}
	
	void print(int result)
	{
		System.out.printf(">> %d %c %d = %d\n", nNumA, cOp, nNumB, result);
	}
}

public class Test077
{
	public static void main(String[] args) throws IOException
	{
		Calculate ob = new Calculate();
		
		ob.input();
		
		int result = ob.calculate();
		
		ob.print(result);
	}
}
*/

class Calculate
{
	//주요 속성 구성(→ 주요 변수 선언) → Calculate 객체의 속성 구성
	int su1, su2;	//-- 사용자로부터 입력받은 두 정수를 담아낼 변수
	char op;		//-- 사용자로부터 입력받은 연산자를 담아낼 변수
	
	
	//메서드 정의(기능 : 입력)
	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.print("임의의 두 정수 입력(공백 구분) : ");
		su1 = sc.nextInt();
		su2 = sc.nextInt();
		
		System.out.print("임의의 연산자 입력(+ - * /) : ");
		op = (char)System.in.read();
	}
	
	//메서드 정의(기능 : 연산) → ★★ 나눗셈 연산도 정수 기반으로 처리
	// → 반환 자료형 int check~!!!
	int cal()
	{
		int result  = 0;
		
		switch (op)
		{
			case '+': result = su1 + su2; break;
			case '-': result = su1 - su2; break;
			case '*': result = su1 * su2; break;
			case '/': result = su1 / su2; break;
			default: result = -1; // ★★★
		}
		
		return result;
	}
	
	//메서드 정의(기능 : 출력)
	void print(int s)
	{
		// >> 10 + 5 = 15
		System.out.printf(">> %d %c %d = %d\n", su1, op, su2, s);
	}
	
}//class Calculate

//main() 메서드를 포함하는 외부의 다른 클래스
public class Test077
{
	public static void main(String[] args) throws IOException
	{
		// Calculate 클래스 기반 인스턴스(객체) 생성
		Calculate ob = new Calculate();
		
		// 생성한 인스턴스를 통해 입력 메서드 호출
		ob.input();
		
		// 생성한 인스턴스를 통해 연산 메서드 호출
		int r = ob.cal();
		
		// 생성한 인스턴스를 통해 출력 메서드 호출
		ob.print(r);
	}
}

//--결과 출력
/*
임의의 두 정수 입력(공백 구분) : 10 5
임의의 연산자 입력(+ - * /) : *
>> 10 * 5 = 50
계속하려면 아무 키나 누르십시오 . . .

임의의 두 정수 입력(공백 구분) : 10 5
임의의 연산자 입력(+ - * /) : -
>> 10 - 5 = 5
계속하려면 아무 키나 누르십시오 . . .

*/