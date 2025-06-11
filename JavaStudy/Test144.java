/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- StringBuffer 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/// @see [String Class](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html) 
/// @see [StringBuffer Class](https://docs.oracle.com/javase/8/docs/api/java/lang/StringBuffer.html)
/// @see [StringBuilder Class](https://docs.oracle.com/javase/8/docs/api/java/lang/StringBuilder.html)
/// @see [Test140.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test140.java)

/*

java.lang.Object
ㄴ java.lang.StringBuffer
 
java.lang.Object
 ㄴ java.lang.StringBuilder
 
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test144  // extends Object
{
	
	public static void main(String[] args)
	{
		
		String s1 = "123456789";
		s1 = (s1 + "123").replace('2', 'A');
		//  "123456789"
		//  "123456789123"
		//  "1A3456789123"
		
		System.out.println("s1 : " + s1);
		//--==>> s1 : 1A34567891A3
		
		
		StringBuffer s2 = new StringBuffer("123456789");
		s2.delete(0, 3).replace(1, 3, "24").delete(4, 6);
		// "123456789
		// "123456789".delete(0, 3).replace(1, 3, "24").delete(4, 6);
		// "456789".replace(1, 3, "24").delete(4, 6);
		// "424789".delete(4, 6);
		// "4247"
		
		System.out.println("s2 : " + s2);
		//--==>> s2 : 4247
		
		StringBuffer s3 = new StringBuffer("123456789");
		
		// ★ StringBuffer 클래스에 substring() 메서드가 있는지 확인....
		String s4 = s3.substring(3, 6);
		// "123456789"
		// "123456789".substring(3, 6);
		// "456"
		
		System.out.println("s3 : " + s3);
		//--==>> s3 : 123456789
		System.out.println("s4 : " + s4);
		//--==>> s4 : 456
		
		StringBuffer s5 = new StringBuffer("123456789");
		s5.delete(0, 3).delete(1, 3).delete(2, 5).insert(1, "24");
		// "123456789"
		// "123456789".delete(0, 3).delete(1, 3).delete(2, 5).insert(1, "24");
		// "456789".delete(1, 3).delete(2, 5).insert(1, "24");
		// "4789".delete(2, 5).insert(1, "24"); //--- check~!!! ★★★★
		// "47".insert(1, "24");
		//"4247"
		System.out.println("s5 : " + s5);
		//--==>> s5 : 4247
		
	}
	
}