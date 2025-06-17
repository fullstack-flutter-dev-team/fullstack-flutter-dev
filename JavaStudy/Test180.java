/*========================================================================
	■■■ 자바의 기본 입출력(I/O) ■■■
	-  OutputStream 실습
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

// Test178.java 파일과 비교~!!!
/// @see [Test178.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test178.java)

/// @see [Class System](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html)
/// @see [err](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html#err)
/// @see [in](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html#in)
/// @see [read()](https://docs.oracle.com/javase/8/docs/api/java/io/InputStream.html#read--)
/// @see []()
/// @see []()
/// @see []()

/// @see [out](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html#out)
/// @see [close()](https://docs.oracle.com/javase/8/docs/api/java/io/PrintStream.html#close--)
/// @see [flush()](https://docs.oracle.com/javase/8/docs/api/java/io/PrintStream.html#flush--)
/// @see [write(int b)](https://docs.oracle.com/javase/8/docs/api/java/io/PrintStream.html#write-int-)
/// @see []()
/// @see []()
/// @see []()
/// @see []()


/*

java.lang.Object
  ㄴjava.lang.System

java.lang.Object
  ㄴjava.io.InputStream

java.lang.Object
  ㄴjava.io.Reader
      ㄴjava.io.InputStreamReader

java.lang.Object
  ㄴjava.io.Reader

java.lang.Object
  ㄴjava.io.OutputStream
      ㄴjava.io.FilterOutputStream
          ㄴjava.io.PrintStream

*/

/*
          
*/

/*

*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.InputStreamReader;
import java.io.Reader;
import java.io.OutputStream;
import java.io.IOException;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test180  // extends Object
{
	
	public static void main(String[] args) throws IOException
	{
		int data;
		char ch;
		
		// System.in         : 자바의 표준 입력 스트림 → 바이트 기반 스트림
		// InputStreamReader : 바이트 기반 스트림을 문자 기반 스트림으로...(통역, 번역, 필터,...)
		// Reader            : 문자 기반 스트림 객체
		Reader rd = new InputStreamReader(System.in);
		
		System.out.println("문자열 입력(종료:Ctrl+z)");
		
		
		// 문자 기반 읽어들이는 처리
		while ((data = rd.read()) != -1)
		{
			ch = (char)data;
			
			// 문자 기반 출력 처리
			//System.out.print(ch);
			//-- 실행 결과
			/*
			   문자열 입력(종료:Ctrl+z)
			   abcd
			   abcd
			   1234
			   1234
			   가나다라
			   가나다라
			*/
			
			
			// 바이트 기반 출력
			System.out.write(ch);
			//-- 실행 결과
			/*
			   문자열 입력(종료:Ctrl+z)
			   abcd
			   abcd
			   1234
			   1234
			   가나다라
			   섆|
			*/
			
		}
	}
	
}