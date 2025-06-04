/*========================================================================
	■■■ 주민등록번호 유효성 검사 ■■■
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/* 

*/

/* 
    ○ 주민등록번호 검증 공식
       ① 마지막 자리를 제외한 앞자리 수를 규칙에 맞게 곱한다.
	   
		123456 - 1234567	(주민번호)
		******   ******   ----------------------  각 자릿수에 곱하기
		234567   892345		(각 자리에 곱해질 수)
		 
	   ② 규칙에 맞게 곱셈 연산을 수행한 결과를 모두 더한다.
		ex)	7 5 0 6 1 5 - 1 8 6 2 1 3 3
			* * * * * *   * * * * * *
			2 3 4 5 6 7   8 9 2 3 4 5
			-----------------------------
			→ 14 + 15 + 0 + 30 + 6 + 35 + 8 + 72 + 12 + 6 + 4 + 15
			==> 217
			
		③ 더해진 결과를 11로 나누어 『나머지』 를 취한다.
				19
				--------  
		   11  | 217
				 11
				------
				 107
				  99
				----
				   8 → 나머지(0)
			  
		④ 11에서 나머지 8을 뺀 결과값을 구한다.
		   11 - 8  →  3
		   
		※ ③을 처리하는 과정에서 나머지가 0인 경우는 ④ 의 연산 결과가 11 - 0 → 11
								나머지가 1인 경우는 ④ 의 연산 결과가 11 - 1 → 10
		         
			이를 다시 10으로 나누어 나머지를 취한다.
				▶ 11 → 1
				▶ 10 → 0
				 
		⑤ ④에서 처리한 연산 결과가 주민번호를 구성하는 마지막 숫자와 
		   일치하는지의 여부를 비료하여 확인한다.
				일치	→ 유효한 주민번호
				불일치	→ 유효하지 않은 주민번호
		
		
		실행 예)
		주민번호입력(xxxxxx-xxxxxx) : 123456-12345678   //-- 입력 갯수 초과 상황
		>> 입력 오류~!!!
		계속하려면 아무키나 누르세요...
		
		주민번호입력(xxxxxx-xxxxxx) : 1234              //-- 입력 갯수 미달 상황
		>> 입력 오류~!!!
		계속하려면 아무키나 누르세요...
	
		주민번호입력(xxxxxx-xxxxxx) : 123456-1234565   //-- 유효한 주민번호
		>> 정확한 주민번호~!!!
		계속하려면 아무키나 누르세요...
		
		주민번호입력(xxxxxx-xxxxxx) : 123456-1234567   //-- 잘못된 주민번호
		>> 잘못된 주민번호~!!!
		계속하려면 아무키나 누르세요...
*/

/*
 ▣ 힌트: 
      ※ 문제 해결을 위한 추가 팁~!!!
	  
	    배열.length     → 배열의 길이(배열방의 갯수) 반환
	    문자열.length() → 문자열의 길이 반환
		
		문자열.substring()      → 문자열 추출
		문자열.substring(m, n)  → 문자열 m번째 위치에서 n-1 번째 위치까지 추출(인덱스는 0부터)
		문자열.substring(m)  → 문자열 m번째 위치에서 문자열의 끝까지 추출(인덱스는 0부터)
 
*/

//import java.io.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/*
public class Test110
{
	private int[] nArrNum1, nArrNum2;
	private String strNum1, strNum2, strNum;
	private int nTotSum, nValidNum;
	
	public void input() throws IOException
	{
		// 주민번호입력(xxxxxx-xxxxxx) :
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nLength = 0;
		
		System.out.print("주민번호입력(xxxxxx-xxxxxx) : ");
		strNum = br.readLine();
		nLength = strNum.length();
		//System.out.println("strNum : " + strNum + " , nLength : " + nLength);
		
		
		if (nLength < 14 || nLength > 14)
		{
			System.out.println(">> 입력 오류~!!!");
			System.exit(0);
		}
		
		strNum1 = strNum.substring(0 , 6);
		strNum2 = strNum.substring(7, 14);
		//System.out.println("strNum1 : " + strNum1 + " , strNum2 : " + strNum2);

		// 주민번호 유효성 체크
		checkValidNum();
		
	}
	
	// 주민번호 유효성 체크 메서드
	private void checkValidNum()
	{
		//	ex) 7 5 0 6 1 5 - 1 8 6 2 1 3 3
		//		* * * * * *   * * * * * *
		//		2 3 4 5 6 7   8 9 2 3 4 5
	
		// ④ 11에서 나머지 8을 뺀 결과값을 구한다.
		//   11 - 8  →  3
		//   
		//   ※ ③을 처리하는 과정에서 나머지가 0인 경우는 ④ 의 연산 결과가 11 - 0 → 11
		//						나머지가 1인 경우는 ④ 의 연산 결과가 11 - 1 → 10
		//         
		//		 이를 다시 10으로 나누어 나머지를 취한다.
		//			▶ 11 → 1
		//			▶ 10 → 0	
		
		nTotSum = 0;
		int[] arrNum1 = {2,3,4,5,6,7};
		int[] arrNum2 = {8,9,2,3,4,5};
		int nStep3;
		
		for (int i = 0; i < strNum1.length(); i++)
		{
			nTotSum += (Integer.parseInt(strNum1.substring(i, i+1)) * arrNum1[i]);
			//System.out.printf("%s * %d = %d\n", strNum1.substring(i, i+1),arrNum1[i],  (Integer.parseInt(strNum1.substring(i, i+1)) * arrNum1[i]));
		}
		
		for (int i = 0; i < strNum2.length()-1; i++)
		{
			nTotSum += (Integer.parseInt(strNum2.substring(i, i+1)) * arrNum2[i]);
			//System.out.printf("%s * %d = %d\n", strNum2.substring(i, i+1),arrNum2[i],  (Integer.parseInt(strNum2.substring(i, i+1)) * arrNum2[i]));
		}
		
		nStep3 = nTotSum % 11;
			
		// 확인(테스트)
		//System.out.println("nTotSum : " + nTotSum);
		//System.out.println("nStep3 : " + nStep3);
		
		if (nStep3 < 2)
		{
			if (nStep3 == 0)
			{
				nValidNum = 1;
			} else {
				nValidNum = 0;
			}
		} else {
			nValidNum = 11 - nStep3;
		}
		// 확인(테스트)
		//System.out.println("nValidNum : " + nValidNum);
		
		// 결과 출력
		printResult();
	}
	
	private void printResult()
	{
		//주민번호입력(xxxxxx-xxxxxx) : 123456-1234565   //-- 유효한 주민번호
		//>> 정확한 주민번호~!!!
		//계속하려면 아무키나 누르세요...
		
		//주민번호입력(xxxxxx-xxxxxx) : 123456-1234567   //-- 잘못된 주민번호
		//>> 잘못된 주민번호~!!!
		//계속하려면 아무키나 누르세요...
		
		String strMsg = "";
		// 확인(테스트)
		//System.out.printf("nValidNum : %d, lastDigit : %s\n" , nValidNum, strNum2.substring(6));
		
		if (nValidNum == Integer.parseInt(strNum2.substring(6)))
		{
			strMsg = ">> 정확한 주민번호~!!!";
		} else {
			strMsg = ">> 잘못된 주민번호~!!!";
		}
		
		System.out.println(strMsg);
	}
	
	public static void main(String[] args) throws IOException
	{
		// 테스트(확인)
		//String strTemp = "김주형";
		//System.out.println(strTemp.length());
		////--==>> 3
		
		//strTemp = "동해물과 백두산이";
		//System.out.println(strTemp.length());
		////--==>> 9
		
		//strTemp = "study-hard";
		//System.out.println(strTemp.length());
		////--==>> 10
		
		//strTemp = "12345678";
		//System.out.println(strTemp.length());
		////--==>> 8
		
		//// 테스트(확인)
		//String strTemp = "ABCDEFGHIZKLMNOPQRSTUVWXYZ";
		//System.out.println(strTemp.substring(13, 17));
		////--==>> NOPQ
		
		////System.out.println(strTemp.substring(13, 30));
		////--==>> 에러 발생(런타임 에러)
		////Exception in thread "main" java.lang.StringIndexOutOfBoundsException: String index out of range: 30
        ////at java.lang.String.substring(String.java:1963)
        ////at Test110.main(Test110.java:120)
		
		//System.out.println(strTemp.substring(13, 26));
		////--==>> NOPQRSTUVWXYZ

		//System.out.println(strTemp.substring(13));
		////--==>> NOPQRSTUVWXYZ
		
		//System.out.println(strTemp.length());
		////--==>> 26
		
		//System.out.println(strTemp.substring(13, strTemp.length()));
		////--==>> NOPQRSTUVWXYZ
		
		//
		Test110 obj = new Test110();
		obj.input();
		
	}
}

*/


public class Test110
{
	
	
	public static void main(String[] args) throws IOException
	{
		// 테스트(확인)
		//String strTemp = "김주형";
		//System.out.println(strTemp.length());
		////--==>> 3
		
		//strTemp = "동해물과 백두산이";
		//System.out.println(strTemp.length());
		////--==>> 9
		
		//strTemp = "study-hard";
		//System.out.println(strTemp.length());
		////--==>> 10
		
		//strTemp = "12345678";
		//System.out.println(strTemp.length());
		////--==>> 8
		
		//// 테스트(확인)
		//String strTemp = "ABCDEFGHIZKLMNOPQRSTUVWXYZ";
		//System.out.println(strTemp.substring(13, 17));
		////--==>> NOPQ
		
		////System.out.println(strTemp.substring(13, 30));
		////--==>> 에러 발생(런타임 에러)
		////Exception in thread "main" java.lang.StringIndexOutOfBoundsException: String index out of range: 30
        ////at java.lang.String.substring(String.java:1963)
        ////at Test110.main(Test110.java:120)
		
		//System.out.println(strTemp.substring(13, 26));
		////--==>> NOPQRSTUVWXYZ

		//System.out.println(strTemp.substring(13));
		////--==>> NOPQRSTUVWXYZ
		
		//System.out.println(strTemp.length());
		////--==>> 26
		
		//System.out.println(strTemp.substring(13, strTemp.length()));
		////--==>> NOPQRSTUVWXYZ
		
		// BufferedReader 인스턴스 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 입력받는 주민번호(문자열 형태)를 담아둘 변수 선언
		String str;
		
		// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯
		
		// 공식에 따라 주민번호의 각 자릿수에 곱하게 될 수  → 배열 형태로 구성
		//           7  5  0  6  1  5  -  1  8  6  2  1  3  3  
		//           *  *  *  *  *  *     *  *  *  *  *  * 
		int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5};
		//                            ---
		//                           check~!!!
		
		//-- 누적곱 -- (x)
		//-- 누적합 -- (o)
		// 곱셈 연산 후 누적합   → 각 자릿수에 맞는 곱셈의 결과를 더해 나갈 수 있도록 처리
		// ---------    =======
		//int tot = 1;
		int tot = 0;
		
		System.out.print("주민번호 입력(xxxxxx-xxxxxxx) : "); // "750615-1862133" → 14자리
		//Integer.parseInt()br.readLine()); // -- (x)
		str = br.readLine();
		
		if (str.length() != 14)
		{
			System.out.println(">> 입력 오류~!!!");
			return;   //-- 메서드 종료  → main() 메서드 종료  → 프로그램 종료
		}
		
		// 테스트(확인)
		//System.out.println(">> 입력값의 자릿수가 적합한 상황~!!!");
		
		
		// 각 자릿수에 곱셈 연산이 진행되는 동안 누적합 산출
		for (int i= 0; i < str.length()-1; i++)
		{
			// 테스트(확인)
			//System.out.print(i + " ");  //--==>> i → 0 1 2 3 4 5 6 7 8 9 10 11 12
			
			
			// i 가 6일 때는 뒷부분 무시하고 계속하라~!!!             check~!!!
			if (i == 6)
			{
				continue;     //-- (뒷부분 무시하고) 계속해라
			}
			
			// 
			//"1234".sustring(0,1);
			//  →  1
			//→ Integer.parseInt("1");
			//tot += ch[0] * Integer.parseInt(str.substring(0, 1));
			//tot += ch[1] * Integer.parseInt(str.substring(1, 2));
			//tot += ch[2] * Integer.parseInt(str.substring(2, 3));
			//tot += ch[3] * Integer.parseInt(str.substring(3, 4));
			//                         ：
			//tot += ch[12] * Integer.parseInt(str.substring(12, 13));
			tot += chk[i] * Integer.parseInt(str.substring(i, (i+1)));     //-- 뒷부분 check~!!!
		}
		
		//System.out.println();  // 개행
		
		// 확인(테스트)
		System.out.println("tot : " + tot);
		//--==>> 주민번호 입력(xxxxxx-xxxxxxx) : 750615-1862133
		//       tot : 217
		
		//-------------------------- 여기까지 수행하면 ① 과 ②를 모두 끝낸 상황이며
		//                           규칙에 맞게 곱셈 연산을 수행한 결과를 모두 더한 값은
		//                           변수 tot에 담겨있는 상황이 된다.
										
		//int su1 = tot % 11;
		//int su2 = 11 - su1;
		int su = 11 - (tot % 11);
		
		//--------------------- 여기까지 수행하면 ③ 과 ④를 모두 끝낸 상황이며
		//                      변수 su에 대한 연산 결과가 두 자리로 나올 경우
		//                      주민번호 마지막 자리의 숫자와 비교를 수행할 수 없는 상황
		
		su = su % 10;  // su %= 10;
		
		//if (su == 주민번호마지막자리의숫자)
		//if (su == str마지막자리의숫자)
		//if (su == str.substring(13, 14)의 숫자)
		//if (su == str.substring(13)의 숫자)
		if (su == Integer.parseInt(str.substring(13)))
		{
			System.out.println(">> 정확한 주민번호~!!!");
		} else {
			System.out.println(">> 잘못된 주민번호~!!!");
		}
	}
}
