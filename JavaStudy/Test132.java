/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- Object 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

// Test130.java 파일과 비교~!!!
/// @see [Test130.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test130.java)
/// @see [Class Object](https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html)
/// @see [자바의 주요(중요) 클래스 - Object](https://chicken-mola.tistory.com/33)

/*
	○
	
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

class Test
{
	private int a = 10;
	
	public void write()
	{
		System.out.println("a : " + a);
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test132  // extends Object
{
	public static void main(String[] args)
	{
		Test ob1 = new Test();
		Test ob2 = new Test();
		
		System.out.println("10 == 9 : " + ( 10 == 9));
		//--==>>  10 == 9 : false
		
		int a = 10;
		int b = 10;
		
		System.out.println("a == b : " + (a == b));
		//--==>> a == b : true
		/*
			※ 『==』 비교 연산자는
				피연산자의 크기를 비교하는 것을 확인(관찰)할 수 있다.
		*/
		
		System.out.println("ob1 == ob2 : " + (ob1 == ob2));
		//--==>> ob1 == ob2 : false

		/* ================================================================
		  ※ 객체(Object)들을 비교하는 과정에서 사용되는 『==』 비교 연산자는
		     대상 객체들의 크기를 비교하는 것이 아니라 주소를 비교한다.
		================================================================ */
		
		System.out.println("\n--------------------------------------");
		
		System.out.println("ob1              : " + ob1);
		System.out.println("ob1.toString()   : " + ob1.toString());
		//-- 실행 결과
		//ob1              : Test@6d06d69c
		//ob1.toString()   : Test@6d06d69c
			
		System.out.println("ob2              : " + ob2);
		System.out.println("ob2.toString()   : " + ob2.toString());
		//-- 실행 결과
		//ob2              : Test@7852e922
		//ob2.toString()   : Test@7852e922
		
		/* ==================================================================
		[ 클래스명@해시코드(hashcode) ]
		         -------------------
		         자바 내부적으로 개체를 구분하기 위해(식별하기 위해) 사용하는 것
		         메모리의 주소값으로 생각하면 절대로 안된다.
		
		   check~!!! (★ 중요)
		   ※ 객체가 같으면 hashcode(해시코드)가 같지만
		      hashcode(해시코드)가 같다고 해서 같은 객체는 아니다.
		================================================================== */
		
	}
}