/*========================================================================
	■■■ 자바의 기본 입출력(I/O) ■■■
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

// Test180.java 파일과 비교~!!!
/// @see [Test180.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test180.java)

/// @see []()
/// @see []()
/// @see [System.in.read()](https://docs.oracle.com/javase/8/docs/api/java/io/InputStream.html#read--)
/// @see [System.out.write(int b)](https://docs.oracle.com/javase/8/docs/api/java/io/PrintStream.html#write-int-)
/// @see [System.out.println(char[] x)](https://docs.oracle.com/javase/8/docs/api/java/io/PrintStream.html#println-char:A-)


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

/*
    ○ 자바의 기본 입출력 개요
       - 자바에서의 모든 데이터 입출력은 『스트림(Stream)』 이라는 개념에 의해
         이루어지는데 『스트림(Stream)』 이라는 단어의 사전적 의미는
         "흐르는 물"의 개념이며, 이는 연속된 일련의 데이터를 일컫는다.
       
       - 데이터 입출력 시 모든 데이터를 형태와 관계없이 일련의 흐름으로
         전송하는 것이 스트림 입출력 모델이 기본 개념이다.
          
       - 기본적으로 스트림(stream)에는
         바이트 기반 스트림과 문자 기반 스트림이 있다.
       
     ○ 바이트 스트림(byte-stream) 입출력
       - InputStream 클래스와 OutputStream 클래스, 그리고 이들의 하위 클래스를
         통해서 제공되는 바이트 스트림(byte-stream)을 위한 표준 입출력으로
         8비트 크기를 갖는 바이트들이 입출력된다.
         (바이트, 바이트배열, 정수 등)
         
    
    ○ 문자 스트림(character-stream) 입출력
       - Reader 클래스와 Write 클래스, 그리고 이들의 하위 클래스에 의해
         구현되었으며, 8비트 크기를 갖는 바이트들의 스트림이 아닌
         16비트 크기를 갖는 유니코드 문자들의 스트림이라는 점에서 차이가 있다.
         (문자, 문자배열, 문자열 등)
      
      ※  스트림(stream)의 특징
          
       - 스트림은 FIFO 구조이다.(Queue 구조와 유사)
          FIFO 구조란, 먼저 들어간 것이 먼저 나오는 형태로
          스트림의 데이터는 순차적으로 흘러가며 순차적 접근 밖에는 허용되지 않는다.
          
       - 스트림은 단방향이다.
          자바에서 스트림은 읽기 쓰기가 동시에 이루어지지 않는다.
          따라서 읽기 쓰기가 필요하다면 읽는 스트림과 쓰는 스트림을
          하나씩 열어서 사용해야 한다.
          
       - 스트림은 지연될 수 있다.
          스트림에 넣어진 데이터는 처리되기 전에는 스트림에 사용하는 스레드가
          지연(blocking) 상태에 빠진다.
          네트워크 상에서 데이터가 모두 전송되기 전까지 스레드는 지연(blocking)
          상태가 된다.
          
       ※  자바는 단일 입력 / 단일 출력이다.
      
*/

// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.IOException;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test178  // extends Object
{
	
	public static void main(String[] args) throws IOException
	{
		int data;
		char ch;
		
		System.out.println("문자열 입력(종료: Ctrl+z)");
		
		// read() : InputStream 클래스의 대표적인 메서드 (→ 바이트 스트림)
		while ((data = System.in.read()) != -1)
		{
			ch = (char)data;
			
			//System.out.print(ch);   //  ( → 문자 스트림)
			//
			/*
			문자열 입력(종료: Ctrl+z)
			abcd
			abcd
			1234
			1234
			가나다라
			°¡³ª´?¶?
			*/
			
			// write() : OutputStream 클래스이 대표적인 메서드  (→ 바이트 스트림)
			System.out.write(ch);
			//--
			/*
			  문자열 입력(종료: Ctrl+z)
			  abcd
			  abcd
			  11234
			  11234
			  가나다라
			  가나다라
			*/
			
		}
		
		
	}
}