/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- 자바에서 기본적으로 제공하는 주요 클래스들
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/// @see [Class Object](https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html)
/// @see [자바의 주요(중요) 클래스 - Object](https://chicken-mola.tistory.com/33)


/*
	○ 개요
		일반적으로 클래스는 하나만 존재하는 것이 아니라
		같은 종류의 클래스를 여러 개 묶어서 사용하게 되는데
		이러한 클래스나 인터페이스의 묶음을 패키지()라고 한다.
		
		Sun(Oracle)사에서는 자바 프로그램을
		효율적으로 작성할 수 있도록 자바 표준 패키지를 제공하며
		자바 표준 패키지에는 그래픽, 네트워크, 데이터베이스 등의 
		다양하고 유용한 클래스들이 포합되어 있다.
		
	○ import구문
		자바 표준 패키지나 사용자에 의해 외부에서 만들어진 패키지를 사용하기 위해서는 
		컴파일을 수행하기에 앞서 프로그램에 포함시키는 과정이 필요한데, 
		이 때 『import』문을 이용하여 패키지 또는 클래스를 프로그램에 포함시키게 된다.
		하지만, 『java.lang.*』 패키지는 자바 프로그램에 기본적으로
		import되어 있기 때문에 이 패기지의 클래스들은 import하지 않고 바로 사용하는 것이 가능하다.
		
		import 문은 반드시 클래스 설계 구문 전에 선언되어 있어야 하며
		형식은 다음과 같은 두 가지가 있다.
		
		import [static] 패키지.클래스;
		import [static] 패키지.*;
		
		※ JDK 1.5 부터는 import 다음에 static 키워드를 사용할 수 있게 하였고
		    정적으로 패키지를 import 할 수 있는 기능을 제공하게 되었다.
		    만약, 패키지를 정적으로 import한 경우라면 모든 접근 가능한
		    메서드와 멤버 변수들은 접두사를 붙이지 않고 사용하는 것이 가능하다.
		                           ------
		                      (ex, br, ob, sc)
		
	○ Object 클래스
		『java.lang.Object』클래스는 자바 최상위 클래스로
		 자바 표준 피키지의 클래스나 사용자에 의해 작성된 모~~~든 클래스는
		 기본적으로 이 클래스로부터 상속받는다.
		 따라서, 자바의 모든 클래스는 『java.lang.Object』클래스의
		 메서드를 가지고 있으며, 바로 사용하는 것이 가능하다.
		
		상속 : is-a , Rect is Object
		class Rect extends Object
		{ }
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test130  // extends Object
{
	
	/*
		Object 클래스로부터 상소받은 멤버들
			...
		
		public String toString()
		{
				....;
		}
	*/
	
	
	/*
		// 기본 생성자
		public Test130()
		{
			super();
		}
	*/
	
	public static void main(String[] args)
	{
		Test130 ob = new Test130();
		
		//ob.xxx();
		//개체.xxx();
		//-- 해당 객체를 생성시키는 대상 클래스(→ Test130)의 메서드 xxx() 호출
		
		
		//ex)
		//Rect ob = new Rect();
		//ob.input();
		//-- ob 객체를 생성시키는 대상 클래스 → Rect
		//	Rect 클래스에 정의되어 있는 input() 메서드 호출
		
		
		//ob.yyy();
		//객체.yyy();
		//-- 해당 객체를 생성시키는 대상 클래스에 yyy() 메서드가 존재하지 않으면
		//--==>> 에러 발생(컴파일 에러)
		
		//System.out.println(ob.actionTest());
		//--==>> 에러 발생(컴파일 에러)
		//
		//-- 해당 객체(ob)를 생성시키는 대상 클래스(→ Test130)에
		//    actionTest() 라는 메서드가 존재하지 않기 때문에
		//    에러가 발생하는 상황
		
		System.out.println(ob.toString());
		//--==>> Test130@6d06d69c
		//-- Test130 클래스에 toString() 메서드를 정의한 적이 없음에도 불구하고
		//	  에러가 발생하지 않는 상황 → Object로 부터 상속받았기 때문~!!!
		//
		//-- [클래스명@해시코드] → 메모리의 주소가 아니라
		//	  자바가 내부적으로 객체를 구분하기 위해 임의로 부여하는 식별번호
		
		System.out.println(ob);
		//--==>> Test130@6d06d69c
	}
	
	
}