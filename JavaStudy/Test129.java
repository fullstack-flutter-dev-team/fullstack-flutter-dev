/*========================================================================
	■■■ 클래스 고급 ■■■
	- 중첩 클래스 ▶ Annonymous클래스(익명 클래스, 무명 클래스,, 이름없는 클래스)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ 🔹 ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/// @see [Test126.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test126.java)


/*
Test3.class
Test3$1.class
Test129.class

	○ Annonymous클래스(익명 클래스, 무명 클래스,, 이름없는 클래스)
	   - AWT, Swing이나 안드로이드 이벤트 처리에 일반적으로 사용
	   - 상위 클래스 메서드를 하나 정도 재정의할 필요성이 있을 때 사용
	   - 클래스의 객체가 필요하면 또 다시 클래스를 생성해야 하는
	     번거로움으로 인해 빈번하게 객체 생성이 필요한 경우
	     익명의 클래스를 활용하여 처리할 수 있다.
		
	○ 형식 및 구조
		new 상위 클래스의 생성자()
		{
			접근제어지시자 자료형 메서드()
			{
				...;
			}
		};  //-- check~!!! 세미콜론
		
		
		
		new Scanner(); // →  객체 생성
		
		new Scanner()
		{
			.....
		};  //-- check~!!! 세미콜론
		
	※ Java의 모든 클래스는 Object클래스를 상속받는다.
		- import java.lang.Object;
		- import java.lang.*;// → import java.lang.Object;
		
		패키지 명을 지정하지 않은경우 
		//package default;
		
		class Test extends Exam//, Object
		{
			
		}
		
		class Exam extends Etc
		{
			
		}
		
		class Etc extends Object
		{
			
		}
		
*/

/*
 ▣ 힌트:
    ▶  
*/


// package default;

// import java.lang.*; // → import java.lang.Object;


class Test3  // extends Object
{
	/*
	  Object 클래스의 모든 멤버 상속~!!!
	
	   public String toString()
	   {
	      ..;
	   }
	*/
	
	public Object getString()
	{
		//Object ob = new Object();
		//return ob;
		
		//return new Object();
		return new Object()
		{
			// 특정 메서드 재구성 →  재정의
			@Override
			public String toString()
			{
				return "익명의 클래스...";
			}
		};   //-- ★ 세미콜론(미 작성 시 에러 발생)
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test129 // extends Object
{
	/*
		Object 클래스의 모든 멤버 상속~!!!
		
			public String toString()
			{
				...;
			}
	*/
	
	
	public static void main(String[] args)
	{
		//
		Test3 ob = new Test3();
		
		//ob.abce();
		//-- 에러 발생(컴파일 에러)
		//   Test129.java:94: error: not a statement
		
		//System.out.println(ob.abce());
		//-- 에러 발생(컴파일 에러)
		//   Test129.java:94: error: not a statement
		
		System.out.println(ob.toString());
		//--==>> Test3@6d06d69c	 //-- 클래스명@해시코드
		
		System.out.println(ob.getString());
		//---===>> 익명의 클래스...
	}
	
}