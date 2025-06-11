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
 
    ○ StringBuffer 클래스
       문자열을 처리하는 클래스로 String 클래스와의 차이점은
       String 클래스는 내부 문자열 데이터의 수정이 불가능하지만
       StringBuffer 클래스는 문자열을 사용할 때
       내부 문자열을 실행 단계에서 변경할 수 있다는 것이다.

       즉, StringBuffer 객체는 가변적인 길이를 가지므로
       객체를 생성하는 시점에서 미리 그 크기나 값을 지정하거나
       실행 시점에 버퍼의 크기를 바꿀 수 있는 기능을 제공한다.

       또한, JDK 1.5 이후부터는
       문자열을 처리하는 StringBuilder 라는 클래스로 제공한다.
       StringBuilder 클래스의 기능은 StringBuffer 클래스와 동일하지만
       가장 큰 차이점은 multi-thread unsafe 라는 점이다.
       즉, Synchronization 이 없기 때문에
       StringBuffer 보다 빠르며 동시성(동기화) 문제가 없다면
       StringBuilder 를 사용하는 것이 성능을 향상시킬 수 있다.
  
   ※ 버퍼(임시 저장공간) : 임시로 데이터를 저장하는 공간을 만들어 놓은 것으로 간주
   ※ multi-thread unsafe : 멀티 스레드 환경에서 데이터 보장이 안 됨
   ※ 동기화 & 동시성 처리 ?
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test143  // extends Object
{
	
	public static void main(String[] args)
	{
		String str1 = new String("seoul");
		String str2 = new String("seoul");
		
		
		System.out.println(str1);
		System.out.println(str2);
		//--실행 결과
		//seoul
		//seoul
		
		System.out.println(str1 == str2);
		//--==>> false
		
		System.out.println(str1.equals(str2));
		//--==>> true
		
		StringBuffer sb1 = new StringBuffer("korea");
		StringBuffer sb2 = new StringBuffer("korea");
		//-- String 클래스 외에는
		//    모든 문자열 관련 클래스가 new 연산자를 통해서만 메모리 할당 가능.
		
		System.out.println(sb1);
		System.out.println(sb2);
		//--실행 결과
		//korea
		//korea
		
		System.out.println(sb1 == sb2);
		System.out.println(sb1.equals(sb2)); // StringBuffer는 Override하지 않았음(Object 비교)
		//--실행 결과
		//false
		//false
		
		
		System.out.println("---------------------------------------------------------------------");
		System.out.println(sb1);
		//                -----
		//              StringBuffer
		//--==>> korea
		
		System.out.println(sb1.toString());
		//               ------------------
		//                   String
		//--==>> korea
		
		System.out.println(sb1.toString().equals(sb2.toString()));
		//--==>> true
		
		System.out.println("---------------------------------------------------------------------");
		
		StringBuffer sb3  = new StringBuffer();
		//-- StringBuffer 기본 생성자 호출(→  인스턴스 생성 과정)
		//   기본적으로 생성되는 버퍼의 크기는 『16』
		
		// capacity()
		System.out.println("버퍼 크기 : " + sb3.capacity());
		//--==>> 버퍼 크기 : 16

		System.out.println("---------------------------------------------------------------------");
		
		System.out.println(sb3);
		//--==>> 無
		
		/* ========================
		  String name = "김한국";
		  name += "이미국";
		  
		  System.out.println(name);
		  //--==>> 김한국이미국
		=========================== */
		
		// append()
		sb3.append("seoul");     // sb3 += "seoul";
		sb3.append("korea");     // sb3 += "korea";
		sb3.append("우리나라");  // sb3 += "우리나라";
		sb3.append("대한민국");  // sb3 += "대한민국";
		System.out.println(sb3);
		System.out.println(sb3.toString());
		//--실행 결과
		//seoulkorea우리나라대한민국
		//seoulkorea우리나라대한민국
		
		// capacity()
		System.out.println("버퍼 크기 : " + sb3.capacity());
		//--==>> 버퍼 크기 : 34
		
		System.out.println("---------------------------------------------------------------------");
		
		String temp1 = "java and oracle";
		System.out.println(temp1);
		//--==>> java and oracle
		
		System.out.println(temp1.toUpperCase());
		//--==>> JAVA AND ORACLE
		
		System.out.println(temp1.toLowerCase());
		//--==>> java and oracle
		
		//System.out.println(sb3.toUpperCase());
		//System.out.println(sb3.toLowerCase());
		//--==>> 에러 발생(컴파일 에러)
		//   Test143.java:148: error: cannot find symbol
		
		String temp3 = sb3.toString();
		System.out.println(temp3.toUpperCase());
		System.out.println(temp3.toLowerCase());
		//-- 실행 결과
		//SEOULKOREA우리나라대한민국
		//seoulkorea우리나라대한민국
		
		System.out.println(sb3.toString().toUpperCase());
		System.out.println(sb3.toString().toLowerCase());
		//-- 실행 결과
		//SEOULKOREA우리나라대한민국
		//seoulkorea우리나라대한민국
		
		System.out.println(sb3);
		//--==>> seoulkorea우리나라대한민국
		
		/* =======================================
		   ○ 대상 문자열(sb3) 중 seoul 앞에
		      "한국" 이라는 문자열 추가
		      seoulkorea우리나라대한민국 → 한국seoulkorea우리나라대한민국
		 ======================================= */
		
		sb3.insert(0, "한국");
		System.out.println("처리 결과 : " + sb3.toString());
		//--==>> 처리 결과 : 한국seoulkorea우리나라대한민국
		
		/* =======================================
		   ○ 대상 문자열(sb3) 중 korea 뒤에
		      "사랑" 이라는 문자열 추가
		       단, 대상 문자열의 인덱스를 눈으로 직접 확인하지 않고.....
		   
		    >> 처리 결과 : 한국seoulkorea우리나라대한민국 → 한국seoulkorea사랑우리나라대한민국
		 ======================================= */
		 
		//sb3.insert((sb3.toString()).indexOf("우리"), "사랑");
		//System.out.println("처리 결과 : " + sb3.toString());
		//--==>> 처리 결과 : 한국seoulkorea사랑우리나라대한민국
		
		// 테스트 ①
		System.out.println(sb3.toString());
		//--==>> 한국seoulkorea우리나라대한민국
		
		// 테스트 ②
		//sb3.insert(12, "사랑");
		//System.out.println("처리 결과 : " + sb3.toString());
		//--==>> 처리 결과 : 한국seoulkorea사랑우리나라대한민국
		
		// 테스트 ③
		sb3.indexOf("korea");
		System.out.println(sb3.indexOf("korea"));
		//--==>> 7
		
		// 테스트 ④
		//System.out.println(sb3.insert(sb3.indexOf("korea"), "사랑"));
		//--==>> 한국seoul사랑korea우리나라대한민국
		
		// 테스트 ⑤
		//System.out.println(sb3.insert(sb3.indexOf("korea") + 5, "사랑"));
		//                            ---------------------
		//                                     → 7
		//--==>> 한국seoulkorea사랑우리나라대한민국
		
		// 테스트 ⑥
		//System.out.println("korea".length());
		//--==>> 5
		
		// 테스트 ⑦
		System.out.println(sb3.insert(sb3.indexOf("korea") + "korea".length(), "사랑"));
		//--==>> 한국seoulkorea사랑우리나라대한민국
		
		System.out.println("---------------------------------------------------------------------");
		/* =======================================
		   ○ 대상 문자열(sb3) 에서
		      "우리나라" 문자열 삭제
		 ======================================= */
		//sb3.delete(14, 18);
		//System.out.println(sb3);
		//--==>> 한국seoulkorea사랑대한민국
		
		// 14
		System.out.println(sb3.toString().indexOf("우리나라"));
		//--==>> 14
		
		//System.out.println(sb3.toString().indexOf("우리나라") + 4);
		System.out.println(sb3.toString().indexOf("우리나라") +  "우리나라".length());
		//-==>> 18
		
		System.out.println("우리나라".length());
		sb3.delete(sb3.toString().indexOf("우리나라"), sb3.toString().indexOf("우리나라") + "우리나라".length());
		System.out.println(sb3);
		//--===>> 한국seoulkorea사랑대한민국
		
		
		System.out.println("---------------------------------------------------------------------");
		/* =======================================
		   ○ 대상 문자열(sb3) 에서
		      "korea" 이후 모든 문자열 삭제(korea 포함)
		      한국seoulkorea사랑대한민국  →  한국seoul
		 ======================================= */
		// 한국seoulkorea사랑대한민국
		//  01 23456789012345678901
		//sb3.delete(7, 18);
		//System.out.println(sb3);
		//--==>> 한국seoul
		
		System.out.println(sb3.toString());
		//--==>> 한국seoulkorea사랑대한민국
		System.out.println(sb3.toString().length());
		//--==>> 18
		
		sb3.delete(sb3.toString().indexOf("korea"), sb3.toString().length());
		System.out.println(sb3);
		//--==>> 한국seoul
		
		// 버퍼 크기 다시 확인
		System.out.println("버퍼 크기 : " + sb3.capacity());
		//--==>> 버퍼 크기 : 34
		
		/* ==================================================
		   버퍼 크기 조절
		   →  현재 문자열을 담아둘 수 있는 버퍼의 크기로...
		   trimToSize();
		 ================================================== */
		sb3.trimToSize();
		// 버퍼 크기 조절 이후 버퍼 크기 다시 확인
		System.out.println("버퍼 크기 : " + sb3.capacity());
		//--===>> 버퍼 크기 : 7
	}
	
}