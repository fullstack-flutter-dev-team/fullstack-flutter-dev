/*========================================================================
	■■■ 자바의 기본 입출력(I/O) ■■■
	-  Reader Write 실습
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


// Reader Write 실습

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
  
  
java.lang.Object
  ㄴjava.io.Reader
      ㄴjava.io.InputStreamReader

java.lang.Object
  ㄴjava.io.OutputStream
      ㄴjava.io.FilterOutputStream
          ㄴjava.io.PrintStream

java.lang.Object
  ㄴjava.io.Writer

java.lang.Object
  ㄴjava.io.Writer
      ㄴjava.io.OutputStreamWriter
*/

/*
          
*/

/*

*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.Writer;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.IOException;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test182  // extends Object
{
	
	public void process(InputStream is)  // System.in 전달~!!!(  → 자바의 표준 입력 스트림  → 바이트 기반 스트림)
	{
		int data;
		
		System.out.println("문자열 입력(종료:Ctrl+z)");
		
		try
		{
			//  매개변수 is 라는 바이트 기반 객체()를
			//  문자 기반 스트림으로 변환하여
			//  ( → InputStreamReader 가 수행)
			// Reader 타입의 『rd』 에서 참조할 수 있도록 처리
			Reader rd = new InputStreamReader(is);      // System.in  → [ InputStream  → Reader ]
			//-- 문자 기반 입력 스트림 [rd]~!!
			
			// 바이트 기반 스트림인 자바의 표준 출력 스트림(System.out)을
			// 문자 기반 스트림으로 변환하여
			//  (→ OutputStreamWriter 가 수행)
			// Writer 타입의 wt에서 참조할 수 있도록 처리
			Writer wt = new OutputStreamWriter(System.out);
			//-- 문자 기반 입력 스트림 [wt]~!!
			
			while ((data = rd.read()) != -1)   //-- 『 rd.read()』
			{                                  //   문자 기반 입력 스트림으로 읽어들이기 → 반복
				wt.write(data);                //-- 문자 기반 출력 스트림에 data 기록    → 반복
				wt.flush();                    //-- 기록한 스트림()을 밀어내어 내보냄    → 반복
			}
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}
	
	public static void main(String[] args)
	{
		Test182 ob = new Test182();
		ob.process(System.in);
	}
}

//-- 실행 결과
/*
 문자열 입력(종료:Ctrl+z)
abcdefghijklmn
abcdefghijklmn
12345678
12345678
가나다라마바사
가나다라마바사
동해물과 백두산이마르고 닳도록
동해물과 백두산이마르고 닳도록
^Z
계속하려면 아무 키나 누르십시오 . . .
*/
