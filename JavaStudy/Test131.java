/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- Object 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

// Test130.java 파일과 비교~!!!
/// @see [Test130.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test130.java)

/*
	○
	
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test131  // extends Object
{
	/*
		...;
		...;
		
		
		public String toString()
		{
			...;
		}
	*/
	
	@Override
	public String toString()
	{
		return "재정의한 toString()...";
	}
	
	
	public static void main(String[] args)
	{
		Test131 ob = new Test131();
		
		// println(문자열)
		System.out.println(ob.toString());
		//--==>> 재정의한 toString()...
		
		// println(객체)
		System.out.println(ob);
		//--==>> 재정의한 toString()...
		
		
	}
}