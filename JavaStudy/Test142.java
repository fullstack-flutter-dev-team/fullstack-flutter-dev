/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- String 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

// 실습

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
public class Test142  // extends Object
{
	
	public static void main(String[] args) throws IOException
	{
		// 변수 선언 & 초기화 및 BufferedReader 인스턴스 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 사용자 입력문구 출력
		System.out.print("연산수식 입력(num1+num2)  : ");
		String str = br.readLine();
		str = str.replaceAll(" ", "");  //-- 입력 데이터 공백 제거
		
		String[] opArr = {"+", "-", "*", "/"};
		
		for (String op: opArr)
		{
			int pos = str.indexOf(op); // 연산자의 인덱스(0 ~ x)
			
			// 연산자 위치가 확인 된 경우 처리
			if (pos > -1)
			{
				int num1 = Integer.parseInt(str.substring(0, pos));
				int num2 = Integer.parseInt(str.substring(pos+1));
				
				int result = 0;
				char operator = str.charAt(pos);
				
				switch (operator)
				{
					case '+' : result = num1+num2; break; 
					case '-' : result = num1-num2; break; 
					case '*' : result = num1*num2; break; 
					case '/' : result = num1/num2; break; 
				}
				
				String s = String.format(">> %d %c %d = %d", num1, operator, num2, result);
				System.out.println(s);
				break;
			}
		}
	}
	
}

//-- 실행 결과
/*=====================================

연산수식 입력(num1+num2)  : 220   +  800
>> 220 + 800 = 1020
계속하려면 아무 키나 누르십시오 . . .

---------------------------------------

연산수식 입력(num1+num2)  : 250-50
>> 250 - 50 = 200
계속하려면 아무 키나 누르십시오 . . .

=======================================*/
