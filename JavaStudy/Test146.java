/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- 문자열 관련 클래스
	- 캐릭터 셋(Character Set)
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class String](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html) 
/// @see [Class StringTokenizer](https://docs.oracle.com/javase/8/docs/api/java/util/StringTokenizer.html) 
/// @see [Class System](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html) 

/*

java.lang.Object
 ㄴ java.lang.String

java.lang.Object
 ㄴ java.util.StringTokenizer

java.lang.Object
 ㄴ java.lang.System

   ○ 캐릭터 셋(Character Set)
     - 유니코드(Unicode)
       국제 표준으로 제정된 2바이트계의 만국 공통의 국제 문자부호 체계
       (UCS : Universal Code System)를 말한다.
       애플, IBM, 마이크로소프트 등이 컨소시엄으로 설립한 유니코드(Unicode)가
       1990년에 첫 버전을 발표하였고, ISO/IEC JTC1에서 1995년 9월 국제 표준으로 제정하였다.
       공식 명칭은 ISO/IEC 10646-1(Universal Multiple-Octet coded Character Set)이다.
   
       데이터의 교환을 원할하게 하기 위하여
       문자 1개에 부여되는 값을 16비트로 통일하였다.
       코드 1문자 당 영어는 7비트, 비영어는 8비트,
       한글이나 일본어는 16비트의 값을 가지게 되는데
       이들을 모두 16비트로 통일한 것이다.
   
   
     - UTF-8 과 UTF-16
       UTF-8 과 UTF-16 의 차이를 한 마디로 말하면
       문자를 표현할 때의 단위가 다르다는 것이다.
       UTF-8 은 8비트 가변장 멀티바이트에서 문자를 표현하고,
       UTF-16은 16비트 가변장 멀티바이트에서 문자를 표현한다.
   
     - UTF-8(8Bit UCS Transforamtion Format)
       웹에서 기본적으로 사용하는 코드.
       UCS-2로 정의되는 문자 집합을 이용하여 기술된 문자열을
       바이트 열로 변환하는 방식의 1개 한 문자를 1~6바이트
       가변장 멀티바이트로 변환한다.
   
     - UTF-16(16Bit UCS Transformation Format)
       자바의 기본 코드, 자바에서는 문자 하나를 저장하면 바이트 수는
       영문자든, 한글 문자든 2바이트를 차지하게 된다.
       UCS-2 로 정의되는 문자 집합을 이용하여 기술된 문자열에
       UCS-4 의 일부 문자를 채워넣기 위한 인코딩 방식.
       UTF-8 과 병용할 수 있다.
       UCS-2 로 이용할 수 있는 문자 수를 대폭 늘릴 수 있다.
  
     ※ 자바단에서는 UTF-16을 사용하고 웹단에서는 UTF-8을 사용하기 때문에
        경우에 따라 변환해야 하는 상황이 발생할 수 있다.
   
     ※ 영문/숫자에 비해 한글은 문자 코드에 영향을 많이 받는다.
     ※ 한글은 문자 코드에 따라 데이터의 크기가 다르게 자장된다.


   ○ 문자 코드의 종류
     - KSC5601
       한글 완성형 표준(한글 2,350자 표현)
       한국공업표준 정보처리분야(C) 5601번 표준안.

     - KSC5636
       영문자에 대한 표준
       한국공업표준 정보처리분야(C)의 5636번 표준안.
       기존 ASCII Code에서 역슬러시(\)를 원(￦) 표시로 대체.

     - EUC-KR(MS949)
       Bell-Laboratories에서 유닉스 상에서 영문다 이외의 문자를
       지원하기 위해 제안한 확장 유니코드(Extend UNIX Code) 중
       한글 인코딩 방식.
       영문은 KSC5636 으로 처리하고, 한글은 KSC5601로 처리.
       즉, EUC-KR(MS949) = KSC5636 + KSC5601

     - UTF-8
       영문과 숫자는 1바이트, 한글은 3바이트로 표현.
       (웹에서 많이 사용, UTF-8 형식으로 JSP를 작성할 때는 
       파일도 UTF-8 형식으로 저장해야 한다.)

     - UTF-16
       자바 기본 문자 코드
       영문과 숫자는 1바이트, 한글은 2바이트로 표현.
  
     - ISO-8859-1
       서유럽 언어 표기에 필요한 US-ASCII에 없는
       94개 글자의 순차적 나열.
  
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.UnsupportedEncodingException;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test146  // extends Object
{
	
	public static void main(String[] args) throws UnsupportedEncodingException
	{
		byte[] buf;
		String name = new String("김한국");
		
		System.out.println("디폴트 캐릭터셋 : " + System.getProperty("file.encoding"));
		//--==>> 디폴트 캐릭터셋 : MS949
		
		// 『String.getBytes()』
		//   디폴트 캐릭터셋을 기반(규칙)으로 바이트 배열을 반환하는 메서드
		buf = name.getBytes();
		System.out.println("Length : " + buf.length);
		//--==>> Length : 6
		
		for (byte b : buf)
		{
			System.out.println("[" + b + "]");
		}
		System.out.println();
		//--- 실행 결과
		/*
	      [-79]┐
	      [-24]┘ 김
	      [-57]┐
	      [-47]┘ 한
	      [-79]┐
	      [-71]┘ 국
		*/
		
		System.out.println("-------------------");
		
		// "UTF-8" 캐릭터 셋을 기반(규칙)으로 바이트 배열을 반환
		//buf = name.getBytes();
		//buf = name.getBytes("UTF-8");
		//--==>> 에러 발생(컴파일 에러)
		//   Test146.java:129: error: unreported exception UnsupportedEncodingException; must be caught or declared to be thrown
		
		// 예외 처리 후 다시 실행
		buf = name.getBytes("UTF-8");
		
		// 반환받은 바이트 배열의 길이(방의 갯수) 확인
		System.out.println("Length : " + buf.length);
		//--==> Length : 9
		
		for (byte b : buf)
		{
			System.out.println("[" + b + "]");
		}
		System.out.println();
		//--- 실행 결과
		/*
	       [-22]┐
	       [-71]┃
	      [-128]┘김
	       [-19]┐
	      [-107]┃
	      [-100]┘한
	       [-22]┐
	       [-75]┃
	       [-83]┘국
		*/
		
		
		//new String("김한국");
		//new String(김한국문자열의바이트배열);
		// → new String(김한국문자열의바이트배열, 디폴트캐릭터셋);
		// → new String(김한국문자열의바이트배열, 인코딩방식);
		// new String(김한국문자열의바이트배열, "UTF-8");
		
		// UTF-8 형태로 저장된 바이트 배열을
		// String 객체로 파라미터 값 "UTF-8" 을 부여하여 생성
		// 즉, UTF-8 기반으로 buf 바이트 배열을 합쳐서(조립하여)
		// 문자열 객체를 생성한 후 이 결과를 출력
		
		System.out.println("Value 1 : " + new String(buf, "UTF-8"));
		//--==>> Value 1 : 김한국
		
		System.out.println("-------------------");
		
		// UTF-8 형태로 저장된 바이트 배열을
		// String 객체로 파라미터 값 없이 생성(→ 디폴트 캐릭터 셋으로)
		// 즉, MS949 기반으로 buf 바이트 배열을 합쳐서(조립하여)
		// 문자열 객체를 생성한 후 이 결과를 출력
		System.out.println("Value 2 : " + new String(buf));
		//--==>> Value 2 : 源??븳援?
		
		System.out.println("-------------------");
		
		String convert = new String(name.getBytes(), "UTF-8");
		System.out.println("Value 3 : " + convert);
		//--==>> Value 3 : ?????
		 
		buf = convert.getBytes();  // MS949
		System.out.println("Length : " + buf.length);
		//--==>> Length : 5
		
		buf = convert.getBytes("UTF-8");
		System.out.println("Length : " + buf.length);
		//--==>> Length : 14
		
		/*
		   ※ check~!!!
		
		   MS949(EUC-KR)을 UTF-8로 변환하겠다는 의도로
			
		*/
		
	}
	
	
}