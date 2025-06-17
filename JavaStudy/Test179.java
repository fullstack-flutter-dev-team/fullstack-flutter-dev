/*========================================================================
	■■■ 자바의 기본 입출력(I/O) ■■■
	-  OutputStream 실습
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


/// @see [Class System](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html)
/// @see [err](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html#err)
/// @see [in](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html#in)
/// @see [out](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html#out)

/// @see [out](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html#out)
/// @see [close()](https://docs.oracle.com/javase/8/docs/api/java/io/OutputStreamWriter.html#close--)
/// @see [flush()](https://docs.oracle.com/javase/8/docs/api/java/io/OutputStreamWriter.html#flush--)
/// @see [write(int c)](https://docs.oracle.com/javase/8/docs/api/java/io/OutputStreamWriter.html#write-int-)
/// @see []()


/*

java.lang.Object
  ㄴjava.lang.System

java.lang.Object
  ㄴjava.io.InputStream

java.lang.Object
  ㄴjava.io.OutputStream
      ㄴjava.io.FilterOutputStream
          ㄴjava.io.PrintStream

*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.OutputStream;
import java.io.IOException;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test179  // extends Object
{
	
	
	public static void main(String[] args) throws IOException
	{
		// ※ System.in  : 자바의 표준 입력 스트림
		//    System.out : 자바의 표준 출력 스트림
		OutputStream out = System.out;
		
		// 바이트 배열 구성
		byte[] ch = new byte[3];
		
		ch[0] = 65;   //-- 'A'
		ch[1] = 97;   //-- 'a'
		ch[2] = 122;  //-- 'z'
		
		/*
		   out.write(65);
		   out.write(97);
		   out.write(122);
		*/
		out.write(ch); //-- 밖으로 내보낼 데이터(변수)를 스트림(물줄기)에 기록
		//--==>> Aaz
		
		out.flush();   //-- 기록된 스트림을 내보내는(밀어내는) 기능을 수행
		              //   지금은 Buffer를 활용하지 않고 있는 상황이기 때문에
		              //   생략이 가능한 코드
		              //   (즉, Buffered되어 있는 스트림(stream)일 경우 생략 불가)
		
		//out.close();  //-- 리소스 반납
		                //  출력 스트림(stream)에 대한 리소스 반납
		                //  ( → out 스트림(stream)을 잠가버린 상황)
		
		System.out.println("절대적인 신뢰를 갖고 있는 구문");
		
	}
}