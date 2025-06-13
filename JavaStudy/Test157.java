/*========================================================================
	■■■ 예외 처리(Exception Handling) ■■■
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

// Test156.java 파일과 비교
/// @see [Test156.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test156.java) 

// ※ throws    / throw
//     ㄴ>예외처리   ㄴ>예외발생

/// @see [Class Throwable](https://docs.oracle.com/javase/8/docs/api/java/lang/Throwable.html) 
/// @see [Class Exception](https://docs.oracle.com/javase/8/docs/api/java/lang/Exception.html) 

/*


*/
 
 // ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;


class Demo
{
	private int value;
	
	                                // ★ check~!!!  
	public void setValue(int value) throws Exception
	{
		if (value <= 0)           //-- 넘겨받는 value 가 0보다 작거나 같을 경우...
		{
			//return;             //-- 종료 → 메서드 종료
			throw new Exception("Value는 0 보다 작거나 같을 수 없습니다.");
			//-- 예외 발생~!!!
		}
		
		this.value = value;
	}
	
	public int getValue()
	{
		return this.value;
	}
}


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test157  // extends Object
{
	                                        // ★ check~!!! 
	public static void main(String[] args) //throws Exception
	{
		Demo obj = new Demo();
		/*
		obj.setValue(5);
		//obj.setValue(-7);
		
		int result = obj.getValue();
		System.out.println(result);
		*/
		
		try
		{
			//obj.setValue(5);
			obj.setValue(-7);
			
			int result = obj.getValue();
			System.out.println(result);
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
			System.out.println("----");
			System.out.println(e.getMessage());
			//-- 실행 결과
			//java.lang.Exception: Value는 0 보다 작거나 같을 수 없습니다.
			//----
			//Value는 0 보다 작거나 같을 수 없습니다.
			//계속하려면 아무 키나 누르십시오 . . .

		}
	}
	
}