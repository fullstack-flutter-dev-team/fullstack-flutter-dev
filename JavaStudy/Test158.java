/*========================================================================
	■■■ 예외 처리(Exception Handling) ■■■
	- 예외 다시 던지기
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

// 예외 다시 던지기

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
public class Test158  // extends Object
{
	
	public static void main(String[] args) // throws Exception
	{
		Test158 obj = new Test158();

		try
		{
			// ⑧ 예외 발생
			int a = obj.getValue(-2);
			System.out.println("a : " + a);
		}
		catch (Exception e)    // ⑨ 발생한 예외 잡아내기
		{
			// ⑩ 잡아낸 예외에 대한 처리
			System.out.println("-- printStackTrace.................");
			e.printStackTrace();
		}
	}
	
	//                            ② 발생한 예외 던지기
	public int getData(int data) throws Exception
	{
		if (data < 0)
		{
			// ① 예외 발생
			throw new Exception("data 가 0 보다 작습니다.");
		}
		
		return data + 10;
	}
	
	//                           ★ ⑦ 잡아낸 예외를 다시 던지기 ★
	public int getValue(int value) throws Exception
	{
		int a = 0;
		
		try
		{
			//  ③ 예외 발생
			a = getData(-2);
		}
		catch (Exception e) // ④ 발생한 예외 잡아내기
		{
			// ⑤ 잡아낸 예외에 대한 처리
			System.out.println("printStackTrace...");
			e.printStackTrace();
			
			// ★ chekck~!!! ★
			// ⑥ 잡아서 처리한 예외를 다시 발생
			throw e;
		}
		
		return a;
	}
}

//-- 실행 결과
/*

printStackTrace...
java.lang.Exception: data 가 0 보다 작습니다.
        at Test158.getData(Test158.java:56)
        at Test158.getValue(Test158.java:70)
        at Test158.main(Test158.java:39)
-- printStackTrace.................
java.lang.Exception: data 가 0 보다 작습니다.
        at Test158.getData(Test158.java:56)
        at Test158.getValue(Test158.java:70)
        at Test158.main(Test158.java:39)
계속하려면 아무 키나 누르십시오 . . .     
 
*/
