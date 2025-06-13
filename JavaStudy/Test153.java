/*========================================================================
	■■■ 예외 처리(Exception Handling) ■■■
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class Throwable](https://docs.oracle.com/javase/8/docs/api/java/lang/Throwable.html) 
/// @see [Class Exception](https://docs.oracle.com/javase/8/docs/api/java/lang/Exception.html) 

/*

java.lang.Object
 ㄴjava.lang.Throwable

java.lang.Object
  ㄴjava.lang.Throwable
      ㄴjava.lang.Exception 

   ○ 프로그램에서 발생하는 오류는
    
     ① 잘못된 문법을 사용하거나 변수 등을 정의하지 않는 상태에서
        사용함으로써 컴파일 단계에서 발생하는 문법적인 오류와
    
     ② 프로그램을 실행하는 과정에서 발생되는 런타임 오류로 나눌 수 있다.
    
       - 개발자가 문제 분석을 잘못하거나 실수에 의해
         엉뚱한 결과를 가져오게 되는 논리적인 오류와 
    
       - 시스템 이상에서 발생되는 시스템 오류, 그리고
      
       - 프로그램 실행 중 발생되는 비정상적인 상황을 의미하는
         예외상항(Exception)이 있다.
      
      ==>> 개발자가 이런 예외 상황이 발생할 경우를 미리 예측해서
           적절히 대응하기 위한 절차를 구현하도록 문법을 정리해 놓은 것.
          → 예외처리
    
※ 정리해 놓은 문법~!!! (→ Exception 클래스)       
    - 예외는 프로그램 실행 중에 발생할 수 있는
      명령어의 정상적인 프름을 방해하는 이벤트로 
      자바에서 예외는 하나의 오브젝트(Object, 객체)이다.
         
    - 프로그램 실행 중에 메서드 안에서 오류가 발생하게 될 경우,
      메서드는 그 오류에 해다하는 예외 오브젝트를 만들고
      그것을 자바 런타임 시스템(Runtime System)에 전달해준다.
       
    - 자바에서의 모든 예외 클래스는 Throwable 클래스나
      Throwable 클래스의 하위 클래스를 상속받아 사용한다.
         
    - Throwable 클래스는 예외를 설명하는 문장이나
      예외가 발생할 때의 프로그램의 상태에 관한 정보를 포함하고 있다.
    
    - Throwable 클래스에서 파생된 클래스
       ① Exception 클래스
          Exception 예외 클래스는 일반적으로 프로그래머에 의해
          복원될 수 있는 예외 상황으로
          메서드가 실행 중에 던지는 예외를 가리킨다.
      
       ② Error 클래스
          심각한 예외의 형태로 개발자가 복원할 수 없는 형태의 오류이다.

※ 예외의 종류   
      - checked excepton
         메서드 내에서 예외가 발생하는 경우
         메서드를 정의할 때 『throws』문에 메서드 내에서 발생할 수 있는
         예외들을 명시해 주거나 또는 그 예외를 『try~catch』해서
         처리해 주어야 하는 예외이다.
         컴파일러가 커파일 하는 과정에서  『checked exception』이
         『throws』 되는가의 여부 혹은 『try~catch』 되는지의 여부를 판단하여
         프로그램에서 예외를 어떤 방식으로든 처리하지 않으면
         컴파일 자체가 불가능하다.
         
       - unchecked exception  
         사전에 처리하지 않아도 컴파일러가 체크하지 않는
         런타임 시에 발생할 수 있는 예외이다.

○  java.lang.Throwable 클래스의 주요 메서드
      -  String toString()
         : Throesable 각각에 대한 설명을 문자열 형태로 반환한다.
      - void printStackTrace(PrintStream s)
      - void printStackTrace(PrintWriter w)
         : 표준 출력 스트림에 스택 호울 목록을 마지말 메서드부터 출력한다.

○ 주요 런타임 예외 클래스      
      - ArithmeticException
        : 수치 계산상의 오류
      - ArrayStoreException 
        : 배열에 잘못된 데이터 형을 저장하려 했을 경우 발생하는 오류
      - IndexOutOfBoundsException 
        : 배열, 문자열, 벡터 등에서 인덱스 범위가 벗어난 경우 발생하는 오류
      - ClassCastException
        : 클래스 변환을 잘못 수행한 경우 발생하는 오류
      - NullPointerException
        : 빈 객체를 참조하는 경우 발생하는 오류
      - SecurityException
        : 자바의 내부 보안 사항을 위반하였을 경우 발생하는 오류
                             :
                             :
*/
 
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
public class Test153  // extends Object
{

	//public static void main(String[] args)
	//--- 에러 발생(컴파일 에러)
	// Test153.java:132: error: unreported exception IOException; must be caught or declared to be thrown
	//
	//                                       ①
	public static void main(String[] args) //throws IOException
	{
		// BufferedReader 인스턴스 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 주요 변수 선언
		int a, b, c;
		
		/*
		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());
		
		c = a + b;
	
		System.out.println("결과 : " + c);
		*/
		
		
		/*
		// ②
		try
		{
			System.out.print("첫 번째 정수 입력 : ");
			a = Integer.parseInt(br.readLine());
			
			System.out.print("두 번째 정수 입력 : ");
			b = Integer.parseInt(br.readLine());
			
			c = a + b;
		
			System.out.println("결과 : " + c);
		}
		catch (IOException e)
		{
			// IOException → checked exception
			//-- 메서드를 정의하는 광정에서 throws 한 예외.
			//   잡아내거나 던지지 않을 겨우 컴파일 에러 발생.
			System.out.println(e.toString());
		}
		*/
	
		/*
		// ③
		try
		{
			System.out.print("첫 번째 정수 입력 : ");
			a = Integer.parseInt(br.readLine());
			
			System.out.print("두 번째 정수 입력 : ");
			b = Integer.parseInt(br.readLine());
			
			c = a + b;
		
			System.out.println("결과 : " + c);
		}
		catch (IOException e)
		{
			// IOException → checked exception
			//-- 메서드를 정의하는 광정에서 throws 한 예외.
			//   잡아내거나 던지지 않을 겨우 컴파일 에러 발생.
			System.out.println(e.toString());
		}
		catch (NumberFormatException e)
		{
			// NumberFormatException →  unchecked exception
			//-- 런 타임 시 발생할 수 있는 예외로
			//   반드시 던질 필요도, 잡아낼 필요도 없다.
			//System.out.println(e.toString());
			//e.printStackTrace(); // throws IOException 과 동일한 결과 
			System.out.println(">> 숫자 형태의 데이터를 입력해야 합니다.~!!!");
		}
		*/
		
		/*
		// ④
		try
		{
			System.out.print("첫 번째 정수 입력 : ");
			a = Integer.parseInt(br.readLine());
			
			System.out.print("두 번째 정수 입력 : ");
			b = Integer.parseInt(br.readLine());
			
			c = a + b;
		
			System.out.println("결과 : " + c);
		}
		catch (Exception e)
		{
			//System.out.println(">> 예외 발생~!!!"
			System.out.println("-------e.toString()");
			System.out.println(e.toString());
			System.out.println("-------(e.getMessage()");
			System.out.println(e.getMessage());
			System.out.println("-------printStackTrace");
			e.printStackTrace();
			//-- 실행 결과
			//첫 번째 정수 입력 : 2
			//두 번째 정수 입력 : a
			//-------e.toString()
			//java.lang.NumberFormatException: For input string: "a"
			//-------(e.getMessage()
			//For input string: "a"
			//-------printStackTrace
			//java.lang.NumberFormatException: For input string: "a"
			//        at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
			//        at java.lang.Integer.parseInt(Integer.java:580)
			//        at java.lang.Integer.parseInt(Integer.java:615)
			//        at Test153.main(Test153.java:211)
		}
		*/
		
		// ⑤
		try
		{
			System.out.print("첫 번째 정수 입력 : ");
			a = Integer.parseInt(br.readLine());
			
			System.out.print("두 번째 정수 입력 : ");
			b = Integer.parseInt(br.readLine());
			
			c = a + b;
		
			System.out.println("결과 : " + c);
		}
		catch (Exception e)
		{
			//System.out.println(">> 예외 발생~!!!"
			System.out.println("-------e.toString()");
			System.out.println(e.toString());
			System.out.println("-------(e.getMessage()");
			System.out.println(e.getMessage());
			System.out.println("-------printStackTrace");
			e.printStackTrace();
		}
		finally
		{
			// 예외가 발생하거나 발생하지 않거나 언제나 실행되는 영역
			System.out.println("고생 많으셨습니다.~ 감사합니다.");
			//-- 실행 결과
			//첫 번째 정수 입력 : 10
			//두 번째 정수 입력 : 20
			//결과 : 30
			//고생 많으셨습니다.~ 감사합니다.
			//계속하려면 아무 키나 누르십시오 . . .
			//--------------------------------------------------
			//첫 번째 정수 입력 : 10
			//두 번째 정수 입력 : a
			//-------e.toString()
			//java.lang.NumberFormatException: For input string: "a"
			//-------(e.getMessage()
			//For input string: "a"
			//-------printStackTrace
			//java.lang.NumberFormatException: For input string: "a"
			//        at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
			//        at java.lang.Integer.parseInt(Integer.java:580)
			//        at java.lang.Integer.parseInt(Integer.java:615)
			//        at Test153.main(Test153.java:250)
			//고생 많으셨습니다.~ 감사합니다.
			//계속하려면 아무 키나 누르십시오 . . .
			
		}
	
	

 // ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
	}
	
	
	
}