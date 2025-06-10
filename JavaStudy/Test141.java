/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- String 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯


// 추가 관찰

/*
	
	
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test141  // extends Object
{
	public static void main(String[] args)
	{
		String s = "seoul korea";
		System.out.println("s : " + s);
		//--==>> s : seoul korea
		
		// ○ 문자열 추출
		// seoul korea
		System.out.println(s.substring(6, 9));
		//--==>> kor
		
		/*=========================================
		※『문자열.substring(s, e)』
		   문자열을 대상으로
		   s 번째에서 ... e-1 번째까지 추출하여 결과 문자열 반환
		   (단, 인덱스는 0 부터 시작)
		===========================================*/
		
		// seoul korea
		System.out.println(s.substring(7));
		//--==>> orea
		
		/* =======================================
		※『문자열.substring(s)』
		   문자열을 대상으로
		   s 번째에서 ... 끝까지 추출하여 결과 문자열 반환
		   (단, 문자열이 가진 길이만큼...)
		============================================*/
		
		// ○ 문자열의 데이터(값) 비교
		// seoul korea
		System.out.println(s.equals("seoul korea"));
		//--==>> true
		System.out.println(s.equals("seoul Korea"));
		//--==>> false
		//-- 대소문자 엄격히 구분
		
		// seoul korea
		System.out.println(s.equalsIgnoreCase("sEoul korea"));
		//--==>> true
		System.out.println(s.equalsIgnoreCase("Seoul korea"));
		//--==>> true
		//-- 대소문자 구분 안함
		
		/*==============================
		○ 찾고자 하는 대상 문자열(s)에
		  『kor』 문자열이 포함되어 있을까?
		   존재하면.. 그 위치는 어디일까?
		 ===============================*/

		// seoul korea
		// 0123456
		System.out.println(s.indexOf("kor"));
		//--==>> 6
		
		// seoul korea
		// 0123456789
		System.out.println(s.indexOf("ea"));
		//--==>> 9

		// seoul korea
		// 0123456789
		System.out.println(s.indexOf("e"));
		//--==>> 1
		//-- 먼저 찾은 문자열의 인덱스를 반환하고 종료되는 형태
		
		// seoul korea
		// 0123456789
		System.out.println(s.indexOf("tt"));
		//--==>> -1
		//-- 찾고자 하는 문자열("tt")이 대상 문자열(s)에 존재할 경우
		//   그 문자열의 인덱스를 반환하지만
		//   존재하지 않을 경우 음수를 반환하게 된다. (-1)
		
		System.out.println("--------------");
		
		/*==============================
		  ○ 찾고자 하는 대상 문자열(s)에
		   『kor』 문자열이 포함되어 있을까?
		    존재하면.. 그 위치는 어디일까?
		    (단, 뒤에서부터 검사)
		================================*/
		// seoul korea
		// 0123456789
		System.out.println(s.indexOf("e"));
		//--==>> 1
		System.out.println(s.indexOf("o"));
		//--==>> 2
		
		System.out.println(s.lastIndexOf("e"));
		//--==>> 9
		System.out.println(s.lastIndexOf("o"));
		//--==>> 7
		
		// 대상 문자열(s) 중
		// 『6』 번째 인덱스 위치의 문자는 ?
		
		// seoul korea
		// 0123456789
		System.out.println(s.substring(6, 7));
		//--==>> k
		System.out.println(s.charAt(6));
		//--==>> k
		System.out.println(s.charAt(10));
		//--==>> a
		
		// seoul korea
		// 0123456789
		System.out.println(s.charAt(22));
		//--==>> 에러 발생(런타임 에러)
		//    Exception in thread "main" java.lang.StringIndexOutOfBoundsException: String index out of range: 22
		//     → 대상 문자열이 가지는 인덱스를 벗어난 경우....
		
		System.out.println("--------------");
		
		// ○ 대상 문자열(s)이 『rea』로 끝나는지 여부 확인
		//   (→ true / false)
		// seoul korea
		// 0123456789
		System.out.println(s.endsWith("rea"));
		//--==>> true
		System.out.println(s.endsWith("oul"));
		//--==>> false
		
	}
	
	
}