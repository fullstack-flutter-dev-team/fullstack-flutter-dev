/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- StringTokenizer 클래스 (★ 개념만 숙지~!!! 않쓰이는 클래스...)
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [StringTokenizer Class](https://docs.oracle.com/javase/8/docs/api/java/util/StringTokenizer.html) 

/*

java.lang.Object
 ㄴjava.util.StringTokenizer

  ○ StringTokenizer 클래스
     문자열 파싱(parsing)을 위한 정보를 제공하는 클래스로
     파싱(parsing)하고자 하는 문자열을 인자로 받아 생성하는데,
     여기에서 파싱(parsing)이란 하나의 문자열을 여러 문자열로
     나누는 작업을 의미하게 되며, 이 때 나누는 단위가 되는 문자열을
     토큰(token)이라고 한다.

     StringTokenizer 클래스를 사용하기 위해서는
     java.util 패키지의 StringTokenizer 를 import해야 한다.

     StringTokenizer 클래스는 호환성을 유지하는 목적으로
     보관 유지되고 있으며, 문자열을 파싱(parsing)하기 위해서는
     String 클래스의 split() 메서드나 java.util.regex 패키지를
     사용할 것을 권장하고 있다.

  ○ 생성자
     - 원형
      StringTokenizer(String str) // 기본 구분자로 분리
      StringTokenizer(String str, String delim)
      StringTokenizer(String str, String delim, boolean returnDelims)
 
    ※. 주어진 문자열 str을 단어로 분리하는 객체를 생성하며
        공백(구분) 문자는 delim에 포함된 문자로 처리하게 된다.
        만약 returnDelims 가 true 이면
        구분 문자도 분리된 데이터에 포함하여 처리하게 된다.
 
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.StringTokenizer;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test145  // extends Object
{
	
	public static void main(String[] args) throws IOException
	{
		//String str = "NO=STD-0000&NAME=김한국&SCORE=85";
		//StringTokenizer st = new StringTokenizer(str);
		
		String strTemp;
		String[] strArr;
		int n;
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		
		System.out.print("파싱할 문자열 입력(컴마 구분) : ");
		strTemp = br.readLine();
		// "사과,딸기,바나나,포도"
		
		
		// StringTokenizer 인스턴스 생성
		StringTokenizer st = new StringTokenizer(strTemp, ",");
		//-- strTemp 를 대상 문자열로...()
		//   『,』를 구분자로..
		
		// StringTokenizer 의 『countTokens()』
		// int countTokens();
		// : 파싱된 문자열의 갯수를 반환(리턴)한다.
		
		// 테스트(확인)
		System.out.println("갯수 : " + st.countTokens());
		//--==>> 갯수 : 4
		
		strArr = new String[st.countTokens()];
		//                  -------------------
		//-- strArr = new String[4];
		
		n = 0;
		while (st.hasMoreTokens())  // true true true true false
		{
			strArr[n++] = st.nextToken();
		}
		
		
		System.out.print("파싱된 토큰(문자열) : ");
		for (String str : strArr)
		{
			System.out.print(str + " ");
		}
		System.out.println();  // 개행
		
		/*
		    ※ StringTokenizer 의 『hasMoreTokens()』와 『nextToken()』
		    
		    ▣『hasMoreTokens()』
		       사용할 수 있는 토큰이 남아있는 경우 true를 반환.
		       더 이상 사용할 토큰이 남아있지 않은 경우 false 를 반환.
		       확인한 결과만 반환할 뿐...
		       실제 데이터를 읽어들이지도 않고,
		       실제 데이터를 읽어들이는 헤드를 이동시키지도 않는다.
		       
		    ▣『nextToken()』
		       다음 토큰을 얻어온다.
		       다음 토큰을 얻어오며 헤드를 이동시키게 된다.
		       구분자를 바꾸었을 경우 다음 호출에도
		       바뀐 구분자를 활용하여 토큰을 분리한다.
		    
		   ▼
		    ---------------------------------------------------
		    사과,딸기,바나나,포도
		    ---------------------------------------------------
		
		        ▼
		    ---------------------------------------------------
		    사과,딸기,바나나,포도
		    ---------------------------------------------------
		
		             ▼
		    ---------------------------------------------------
            사과,딸기,바나나,포도
		    ---------------------------------------------------
		
		                    ▼
		    ---------------------------------------------------
		    사과,딸기,바나나,포도
		    ---------------------------------------------------
		
		*/
		
	}
	
}