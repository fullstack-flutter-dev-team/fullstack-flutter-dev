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
		//System.out.println(s.charAt(22));
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
		
		
		System.out.println("--------------");
		
		/*
		○ 대상 문자열(s)과 비교 문자열 『seoul corea』 중
		   어떤 문자열이 더 큰가?  →  문자열에 대한 크기 비교
		    - 두 문자열이 같다면....  → 0
		    - 두 문자열이 다르다면... → 차이를 반환(사전식 배열)
		*/
		
		// s = "seoul korea";
		System.out.println(s.compareTo("seoul korea"));
		//--==>> 0
		
		//-- 두 문자열이 같다.
		//    즉, s와 "seoul korea" 는 같다.
		
		System.out.println(s.compareTo("seoul corea"));
		//--==>> 8
		//
		//-- 두 문자열이 같지 않다.
		//    즉, s와 "seoul corea" 는 같지 않다.
		//-- c ~ k → defghijk →  8
		
		// 대산 문자열(s) 중 
		// 해당 문자열을 모두 찾아 원하는 형태로 수정된 문자열 반환
		
		s = "우리나라 대한민국 대한독립 만세";
		System.out.println("s : " + s);
		//--==> s : 우리나라 대한민국 대한독립 만세
		
		s = s.replaceAll("대한", "자주");
		System.out.println("s : " + s);
		//--==>> s : 우리나라 자주민국 자주독립 만세
		// ※ 『replaceAll』 은 JDK 1.5 이후부터 사용 가능.
		
		// ○ 공백 제거
		s = s.replaceAll(" ", "");
		System.out.println("s : " + s);
		//--==> s : 우리나라자주민국자주독립만세
		
		s = "         사    랑      ";
		System.out.println(s);
		//--==>>          사    랑      

		System.out.println("|" + s + "|");
		//--==>> |         사    랑      |
		
				System.out.println("|" + s.trim() + "|");
		//--==>> |사    랑|
		//-- 양쪽 가장자리 공백 제거
		
		System.out.println("|" + s.replaceAll(" ", "") + "|");
		//--==>> |사랑|
		
		System.out.println("--------------");
		
		// "50" → 50
		int temp = Integer.parseInt("50");
		//System.out.println(temp);
		System.out.printf("%d\n", temp);
		//--==>> 50
		
		// 30 → "30"
		s = Integer.toString(30);
		System.out.println(s);
		System.out.printf("%s\n", s);
		//--==> 30
		
		int n = 2345678;
		System.out.printf("%d", n);
		//--==>> 2345678
		System.out.println("\n--------------");
		System.out.format("%d", n);
		//--==>> 2345678
		
		System.out.println("\n--------------");
		
		// 2345678 → "2345678"
		s = String.format("%d", n);
		System.out.println(s);
		//--==>> 2345678
		
		System.out.println("--------------");
		n = 6;
		s = String.format("%d월", n);
		System.out.println(s);
		System.out.println(s);
		//--==>> 6월
		
		System.out.println("--------------");
		s = String.format("%.2f", 3.141592);
		System.out.println(s);
		//--==>> 3.14
		
		System.out.println("--------------");
		s = String.format("%d + %d = %d", 10, 20, 30);
		System.out.println(s);
		//--==>> 10 + 20 = 30
		
		System.out.println("--------------");
		s = String.format("%b",true);
		System.out.println(s);
		//--==>> true
		
		System.out.println("--------------");
		
		//String str = "기본,열정,배려";
		//String[] strArr = str.split(",");
		//        ↓         ↓
		String[] strArr = "기본,열정,배려".split(",");
		for (String str : strArr)
		{
			System.out.print(str + " ");
		}
		System.out.println();
		//--==>> 기본 열정 배려 
		
	}
	
	
}