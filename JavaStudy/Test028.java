/*===================================================================
	■■■ 연산자(Operator) ■■■
		- 조건 연산자 == 삼항 연산자, 대소문자 변환
===================================================================*/

//사용자로부터 임의의 한 문자를 입력받아
//입력받은 문자가 대문자이면 소문자로, 소문자이면 대문자로
//알파벳이 아닌 기타 문자라면 그 문자를 입력받은 그대로 출력하는
//프로그램을 구현한다.

//실행 예)
//한 문자 입력 : A
//A → a
//계속하려면 아무 키나 누르세요.

//한 문자 입력 : b
//b → B
//계속하려면 아무 키나 누르세요.

//한 문자 입력 : 7
//7 → 7
//계속하려면 아무 키나 누르세요.

/*
알파벳대문자 ? 알파벳소문자로변환	:	(알파벳소문자	?	알파벳대문자로변화	:	있는그대로);
------------	-----------------		--------------------------------------------------------
   수식1			수식2										수식3

*/

import java.io.IOException;

public class Test028
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		int nInput;
		char cOut;
		
		// 사용자 입력 안내 문구 출력
		System.out.print("한 문자 입력 : ");
		
		// 연산
		nInput = System.in.read();
		cOut = (char)((nInput >= 97 && nInput <= 122) ? (nInput - 32) : ((nInput >= 65 && nInput <= 90) ? (nInput + 32) : nInput)) ;
		
		
		// 결과 출력
		System.out.printf("%c → %c\n", (char)nInput, cOut);
		// 55 → 7
		// 65 → A, 90 → Z
		// 97 → a, 122 → z
		//----------------------------
		// 결과 출력
		//한 문자 입력 : A
		//A → a
		//계속하려면 아무 키나 누르십시오 . . .
		//	
		//한 문자 입력 : b
		//b → B
		//계속하려면 아무 키나 누르십시오 . . .
		//	
		//한 문자 입력 : 7
		//7 → 7
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		
		/*
		char temp;
		System.out.print("한 문자 입력 : ");
		temp = (char)System.in.read();
		
		
		System.out.println("입력받은 값 확인 : " + temp);
		
		// temp == 'A';	→ 대문자~!!!
		// temp == 'B';	→ 대문자~!!!
		// temp == 'V';	→ 대문자~!!!
		// temp == 'd';	→ 소문자~!!!
		// temp == 'e';	→ 소문자~!!!
		
		//(temp == 'A') ? ("대문자") : ("대문자아님");
		//String tempResult = (temp == 'A' || temp=='B' || temp=='C') ? ("대문자") : ("대문자아님");
		//System.out.println("tempResult : " + tempResult);
		
		//String tempResult = (temp가 65이상 90이하) ? ("대문자")	: ("대문자아님");
		//String tempResult = (65 <= temp <= 90이하) ? ("대문자") : ("대문자아님");
		

        //           <-----------------------------------|
		//							|--------------------|---------->
		//							|********************|
		//-------------------------------------------------------------------------------
		//String tempResult = (temp가 65 이상 and temp가 90이하) ? ("대문자") : ("대문자아님");
		String tempResult = (temp >= 65 && temp <= 90) ? ("대문자") : ("대문자아님");
		//                   ----------
		//					(자동형변환)
		System.out.println("tempResult : " + tempResult);
		
		String tempResult = (temp >= 65 && temp <= 90) ? ("소문자로변환") : ("대문자아님");
		*/
		
		char ch, result;
		
		System.out.print("한 문자 입력 : ");
		ch = (char)System.in.read();
		//'A' → 65	→	97	+	32	→	'a'
		//'B' → 66	→	98	+	32	→	'b'
		//				⁝
		//'Z' → 90	→	122	+	32	→	'z'
		
		//result = (입력값대문자)	?	(소문자로변환)	:	((입력값소문자)	?	(대문자로변환)	: (그대로));
		//  - (입력값대문자)
		//		→ (ch >= 65 && ch <= 90)
		//  - (소문자로변환)
		//		→ (ch += 32)
		//
		//	- (입력값소문자)
		//		→ (ch >=97 && ch <= 122)
		//	- (대문자로변환)
		//		→ (ch -= 32)
		//
		//	- (그대로)
		//		→ (ch)
		//result = (ch >= 65 && ch <= 90)	?	(ch += 32)	:	((ch >=97 && ch <= 122)	?	(ch -= 32)	: (ch));
		//result = (ch >= 65 && ch <= 90)	?	(ch + 32)	:	((ch >=97 && ch <= 122)	?	(ch - 32)	: (ch));
		//result = (ch >= 65 && ch <= 90)	?	(char)(ch + 32)	:	((ch >=97 && ch <= 122)	?	(char)(ch - 32)	: (ch));
		result = (ch >= 'A' && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		
		
		// 'Q' (→ 81)
		//result = ('Q' >= 'A' && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = ('81 >= 65 && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && 'Q' <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && 81 <= 90)	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && true)	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && true)	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = true	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (char)(ch + 32);
		//result = (char)('Q' + 32);
		//result = (char)(81 + 32);
		//result = (char)(113);
		//result = 'q';
		
		// 'm' (→109)
		//result = ('m' >= 'A' && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (109 >= 65 && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && 'm' <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && 109 <= 90)	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && false)	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && false)	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = false	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (109 >=97 && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (true && 109 <= 122)	?	(char)(ch - 32)	: (ch));
		//result = (true)	?	(char)(ch - 32)	: (ch));
		//result = (char)(ch - 32);
		//result = (char)(109 - 32);
		//result = (char)(77);
		//result = 'M';
		
		
		// '8' (→56)
		//result = ('b' >= 'A' && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (56 >= 65 && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (false && ch <= 'Z')	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (false)	?	(char)(ch + 32)	:	((ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (('8' >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (ch >='a' && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (56 >=97 && ch <= 'z')	?	(char)(ch - 32)	: (ch));
		//result = (false)	?	(char)(ch - 32)	: (ch));
		//result = ch
		
		// 결과값 출력
		System.out.println(ch + " → " + result);
		// 결과 출력
		//한 문자 입력 : A
		//A → a
		//계속하려면 아무 키나 누르십시오 . . .
		//	
		//한 문자 입력 : a
		//a → A
		//계속하려면 아무 키나 누르십시오 . . .
		//	
		//한 문자 입력 : 8
		//8 → 8
		//계속하려면 아무 키나 누르십시오 . . .
	}
}