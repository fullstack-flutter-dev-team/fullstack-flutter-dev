/*========================================================================
	■■■ 예외 처리(Exception Handling) ■■■
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

// Test155.java 파일과 비교
/// @see [Test155.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test155.java) 

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


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test154  // extends Object
{
	private String[] data = new String[3];
	
	public void proc() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		String str;
		int n = 0;
		
		// ★ br.readLine()    →  Ctrl+z → null
		System.out.print("이름 입력(종료:Ctrl+z) : ");
		while ((str = br.readLine()) != null)
		{
			data[n++] = str;
			System.out.print("이름 입력(종료:Ctrl+z) : ");
		}
		
		System.out.println("입력된 내용..............");
		
		for (String s : data)
		{
			if (s != null)
			{
				System.out.println(s);
			}
		}
	}
	
	public static void main(String[] args) throws IOException
	{
		Test154 obj  = new Test154();
		obj.proc();
	}
	
}

//-- 실행 결과
/*

이름 입력(종료:Ctrl+z) : 김한국-1
이름 입력(종료:Ctrl+z) : 김한국-2
이름 입력(종료:Ctrl+z) : 김한국-3
이름 입력(종료:Ctrl+z) : ^Z
입력된 내용..............
김한국-1
김한국-2
김한국-3
계속하려면 아무 키나 누르십시오 . . .



*/