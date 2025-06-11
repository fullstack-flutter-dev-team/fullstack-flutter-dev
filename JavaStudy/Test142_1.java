/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- String 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯


/*
	사용자로부터 사칙연사수식을 입력받아
	해당 연산의 처리 결과를 출력하는 프로그램을 구현한다.
	
	실행 예)
	연산수식 입력(num1+num2) : 15+13
	>> 15 + 13 = 28
	계속하려면 아무 키나 누르십시오 . . .

	연산수식 입력(num1+num2) : 15-13
	>> 15 - 13 = 2
	계속하려면 아무 키나 누르십시오 . . .
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test142_1  // extends Object
{
	private String[] arrStrOp = {"+", "-", "*", "/"};
	private String strInput, s1, s2, strOp;  // 입력 문자열, 피연산자-1, 피연산자-2, 연산자
	private int nOpIdx, num1, num2;  // 연산자 인덱스, 피연산자-1, 피연산자-2
	private int nCountOp; // 연산자 계수(+ -)
	
	public void input() throws IOException
	{
		// 변수 선언 & 초기화 및 BufferedReader 인스턴스 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 사용자 입력문구 출력
		System.out.print("연산수식 입력(num1+num2)  : ");
		
		// 입력 문자열에서 공백제거
		strInput  = br.readLine().replaceAll(" ", "");
		
		// 연산자 인덱스
		nOpIdx = indexOfOperator(strInput);
		
		// 4칙연산 이외의 경우 프로그램 종료
		if (nOpIdx < 0)
		{
			System.exit(0);
		}
		
		strOp = strInput.substring(nOpIdx, nOpIdx+1);  // 연산자 확인
		s1 = strInput.substring(0, nOpIdx);  // 피연산자-1 (문자열)
		s2 = strInput.substring(nOpIdx+1);   // 피연산자-2 (문자열)
		num1 = Integer.parseInt(s1); // 피연산자-1 (정수)
		num2 = Integer.parseInt(s2); // 피연산자-2 (정수)
	}
		
	public static void main(String[] args) throws IOException
	{
		Test142 obj = new Test142();
		obj.input();
		obj.calcAndPrint();
	}
	

	public void calcAndPrint()
	{
		int result = 0;
		
		switch (strOp)
		{
			case "+": result = num1 + num2; break;
			case "-": result = num1 - num2; break;
			case "*": result = num1 * num2; break;
			case "/": result = num1 / num2; break;
		}
		
		// 결과 출력
		System.out.printf(">> %d  %s  %d = %d \n",  num1, strOp, num2, result);
	}
	
	public int indexOfOperator(String str)
	{
		int id;
		
		for (String strOp : arrStrOp)
		{
			id = str.indexOf(strOp);
			if (id > 0)
			{
				return id;
			}
		}
		
		//id = str.indexOf("+");
		//	
		//if (id > 0)
		//{
		//	return id;
		//}
		
		//id = str.indexOf("-");
		//	
		//if (id > 0)
		//{
		//	return id;
		//}
		
		//id = str.indexOf("*");
		//	
		//if (id > 0)
		//{
		//	return id;
		//}
		
		//id = str.indexOf("/");
		//	
		//if (id > 0)
		//{
		//	return id;
		//}
		
		return -1;
	}
	
}