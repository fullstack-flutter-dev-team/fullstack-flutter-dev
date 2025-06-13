/*========================================================================
	■■■ 예외 처리(Exception Handling) ■■■
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

// Test157.java 파일과 비교
/// @see [Test157.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test157.java) 

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
	
	public void setValue(int value)
	{
		if (value <= 0)           //-- 넘겨받는 valu 가 0보다 작거나 같을 경우...
		{
			return;                //-- 종료 메서드 종료
		}
		
		this.value = value;
	}
	
	public int getValue()
	{
		return this.value;
	}
}


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test156  // extends Object
{
	
	public static void main(String[] args)
	{
		Demo obj = new Demo();
		//obj.setValue(-7);
		//obj.setValue(5);
		obj.setValue(-7);
		
		int result = obj.getValue();
		System.out.println(result);
	}
	
}