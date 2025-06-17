/*========================================================================
	■■■ 자바의 기본 입출력(I/O) ■■■
	-  출력 Buffer 와 flush()
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


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

/// @see [Class OutputStreamWriter](https://docs.oracle.com/javase/8/docs/api/java/io/OutputStreamWriter.html)
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
  ㄴjava.io.OutputStream
      ㄴjava.io.FilterOutputStream
          ㄴjava.io.PrintStream

*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.InputStreamReader;
import java.io.Reader;
import java.io.OutputStream;
import java.io.IOException;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test181  // extends Object
{

	public static void main(String[] args)
	{
		//  ※ System.out : 자바 표준 출력 스트림
		// write()  : 바이트 기반 스트림
		System.out.write(65);     //-- 'A'
		System.out.write(66);     //-- 'B'
		
		
		// 180 + 235  → '대'
		System.out.write(180);┐
		System.out.write(235);┛  //  180 + 235 → '대'
		
		//----- 여기까지 수행하면 아무것도 출력되지 않는 상황임을 확인 할 수 있음~!!!
		
		System.out.flush();    // check~!!!
		//--==>> AB대
		
		// ※ 출력 버퍼가 채워지지 않으면
		//    출력할 데이터(자료)를 출력 디바이스(장치)로 보내지 않기 때문에
		//    flush() 메서드를 통해 아직 다 채워지지 않은 출력 버퍼의 내용을
		//    출력 장치로 밀어내어 보낼 수 있도록 처리해야 한다.
		//   
		//   즉, 앞에서 본 내용(Test179.java)과 달리
		//   현재 실습 내용에서는 『System.out.flush();』 구문을 생략할 수 없다.
		
	}
}