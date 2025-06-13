/*========================================================================
	■■■ 예외 처리(Exception Handling) ■■■
	- 다른 예외 다시 던지기, try~catch 로 처리
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

// 다른 예외 다시 던지기

/// @see [Class Throwable](https://docs.oracle.com/javase/8/docs/api/java/lang/Throwable.html) 
/// @see [Class Exception](https://docs.oracle.com/javase/8/docs/api/java/lang/Exception.html) 

/*


*/
 
 // ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test159  // extends Object
{
	public int getValue(int value) throws Exception
	{
		int a = 0;
		
		try
		{
			a = getData(-2);                               // ③ 예외 발생
			                                               //   (빨강 폭탄)
		}
		catch (Exception e)                                // ④ 발생한 예외 잡아내기
		{                                                  //     (빨강 폭탄)   
			// ⑤ 잡아낸 예외에 대한 처리(빨강 폭탄)
			System.out.println("printStackTrace..................");
			e.printStackTrace();
			
			
			// check~!!
			// ⑥ 예외 발생(파랑 폭탄)
			throw new Exception("value 가 음수입니다.");
		}
		
		return a;
	}
	
	public int getData(int data) throws Exception           // ② 발생한 예외 던지기(빨강 폭탄)
	{
		if (data < 0)
		{
			throw new Exception("data 가 0 보다 작습니다."); // ① 예외 발생(빨강 폭탄) 
		}
		return data + 10;
	}
	
	
	public static void main(String[] args)
	{
		Test159 obj  = new Test159();
		
		try
		{
			int a = obj.getValue(-2);                      // ⑧ 예외 발생(파랑 폭탄)
			System.out.println("a : "  + a);
		}
		catch (Exception e)                                // ⑨ 발생한 예외 잡아내기(파랑 폭탄)
		{
			// ⑩잡아낸 예외에 대한 처리(파랑 폭탄)
			System.out.println("printStackTrace...............");
			e.printStackTrace();
		}
		
	}
}

//-- 실행 결과

/*
printStackTrace..................
java.lang.Exception: data 가 0 보다 작습니다.
        at Test159.getData(Test159.java:60)
        at Test159.getValue(Test159.java:38)
        at Test159.main(Test159.java:72)
printStackTrace...............
java.lang.Exception: value 가 음수입니다.
        at Test159.getValue(Test159.java:50)
        at Test159.main(Test159.java:72)
계속하려면 아무 키나 누르십시오 . . .
     
*/
