/*========================================================================
	■■■ 클래스 고급 ■■■
	-  상속(Inheritance)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ㄷ

/* 

*/

/*
	다음과 같은 프로그램을 구현한다.
	단, 상속의 개념을 적용하여 작성할 수 있도록 한다.
	
	실행 예)
	임의의 두 정수 입력(공백 구분) : 20 25
	연산자 입력( + - * /)          : -
	>> 20 - 15  = 5
	계속하려면 아무키나 누르세요...
	
/*
 ▣ 힌트: 
      ※ 
 
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Scanner;


/*
// Bclass의 부모클래스
class Aclass
{
	protected int x, y;
	protected char op;
	
	Aclass()
	{
		
	}
	
	void write(double result)
	{
		System.out.printf(">> %d %c %d = %.2f\n", x, op, y, result);
	}
}


// Aclass를 상속받는 클래스로 설계
class Bclass extends Aclass
{
	// 속성 정의
	private double result;
	
	// 메서드 정의
	public void input() throws IOException
	{
		//임의의 두 정수 입력(공백 구분) : 20 25
		//연산자 입력( + - * /)          : -
		
		// 변수선언 및 인스턴스 생성
		Scanner sc = new Scanner(System.in);
		
		System.out.print("임의의 두 정수 입력(공백 구분) : ");
		x = sc.nextInt();
		y = sc.nextInt();

		System.out.print("연산자 입력( + - * /)          : ");
		op = (sc.next()).charAt(0);
	}
	
	public double calc()
	{
		result = 0.0;
		
		switch (op)
		{
			case '+':
				result = x + y; break;
			case '-':
				result = x - y; break;
			case '*':
				result = x * y; break;
			case '/':
				result = (double)x / y; break;
		}
		
		return result;
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test117
{
	
	public static void main(String[] args) throws IOException
	{
		// Bclass(하위 클래스) 인스턴스 생성
		Bclass obj = new Bclass();
		
		// 사용자 입력 - 피 연산자(x,y)와 연산자(op)
		obj.input();
		
		// 연산 및 결과값을 변수에 저장
		double ret = obj.calc();
		
		// 연산 결과를 출력
		obj.write(ret);
		//-- 실행결과
		// 임의의 두 정수 입력(공백 구분) : 20 25
		// 연산자 입력( + - * /)          : -
		// >> 20 - 25 = -5.00
		
	}
}

*/

// Bclass의 부모클래스
class Aclass
{
	protected int x, y;
	protected char op;
	
	Aclass()
	{
		
	}
	
	void write(double result)
	{
		System.out.printf(">> %d %c %d = %.2f\n", x, op, y, result);
	}
}


// Aclass를 상속받는 클래스로 설계
class Bclass extends Aclass
{
	/*
	protected int x, y;
	protected char op;
	
	// 생성자는 상속에서 제외.
	//Aclass()
	//{
	//	
	//}
	
	void write(double result)
	{
		System.out.printf(">> %d %c %d = %.2f\n", x, op, y, result);
	}
	*/
	
	Bclass()
	{
		//super(); // 자동 삽입
	}
	
	boolean input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("임의의 두 정수 입력(공백 구분)  :  ");  // "20 15"
		String temp = br.readLine();
		
		// ※ 『문자열.split("구분자");』
		//     문자열.split("공백문자"); → 공백 문자를 구분자로 활용
		//     문자열.split("\\s"); → 공백 문자를 구분자로 활용
		//       ex) "10 20 30 40 50".split("\\s");
		//              → 반환 → {"10", "20", "30", "40", "50"}
		//       ex) "010-1234-5678".split("-");
		//              → 반환 → {"010", "1234", "5678"}
		
		String[] strArr = temp.split("\\s");
		
		// 확인(테스트)
		//System.out.println("x: " + strArr[0]);
		//System.out.println("y: " + strArr[1]);
		
		if (strArr.length != 2)
		{
			return false;
		}
		//-- false를 반환하며 input() 메서드 종료
		//    즉, 이 조건을 만족하여 if 구문을 수행하게 될 경우
		//    아래 수행해야 할 코드가 남아있더라도
		//    결과값(false)을 반환하면 메소드는 종료된다.
		//    
		
		x = Integer.parseInt(strArr[0]);
		y = Integer.parseInt(strArr[1]);
		
		System.out.print("연사자 입력(+ - * /)\t  : ");
		op = (char)System.in.read();
		
		/*
		if (op != '+' && op != '-' && op != '*' && op != '/')	// 유효하지 않은 연산자일 경우
		{
			return false;										// false 를 반환하며 메소드 종료
		}
		*/
		
		if (op == '+' || op == '-' || op == '*' && op == '/')	// 유효한 연산자일 경우
		{
			return true;										// true 를 반환하며 메소드 종료
		}
		
		return false;
	}
	
	double calc()
	{
		double result = 0; //-- 지역변수는 자동 초기화 안됨
		
		switch (op)
		{
			case '+': result = x + y; break;
			case '-': result = x - y; break;
			case '*': result = x * y; break;
			case '/': result = (double)x / y; break;
		}
		
		return result;
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test117
{
	
	public static void main(String[] args) throws IOException
	{
		// Bclass(하위 클래스) 인스턴스 생성
		Bclass ob = new Bclass();
		
		/*
		// 사용자 입력
		boolean flag = ob.input();
		
		if (flag)
		{
			
		}
		*/
		if (!ob.input())
		{
			System.out.println("Error...");
			return;
		}
		
		// 연산
		double result = ob.calc();
		
		// 출력
		ob.write(result);
		
	}
}