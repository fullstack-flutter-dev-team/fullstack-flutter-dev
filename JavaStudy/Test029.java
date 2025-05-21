/*===================================================================
	■■■ 연산자(Operator) ■■■
		- 조건 연산자 == 삼항 연산자, 윤년 판별
===================================================================*/

//사용자로부터 임의의 연도를 입력받아
//입력받은 연도가 .... 윤년인지 평년인지 판별하여
//그 결과를 출력하는 프로그램을 구현한다.
//단, 입력은 BufferedReader 를 활용하고
//조건 연산자(삼항 연산자)를 활용하여 연산을 수행할 수 있도록 한다.


//4년마다 1일 추가
//100년마다 스킵
//400년마다 1일 추가 

//실행 예)
//임의의 연도 입력 : 2000
//2000년 → 윤년
//계속하려면 아무 키나 누르세요...

//임의의 연도 입력 : 2025
//2025년 → 평년
//계속하려면 아무 키나 누르세요...

// ※ 2월이	28일까지 있는 해 → 평년
//			29일까지 있는 해 → 윤년
//		
// ※ 윤년의 판별 조건
//	연도가 4의 배수이면서 100의 배수가 아니거나,
//	400의 배수이면 윤년~!!!!
//	그렇지 않으면 평년~!!!!

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test029
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		int nYear;
		String strResult;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 사용자 입력 안내 문구 출력
		System.out.print("임의의 연도 입력 : ");
		
		
		// 연산
		nYear = Integer.parseInt(br.readLine());
		strResult = (((nYear % 4) == 0) && (nYear % 100 != 0) || ((nYear % 400) == 0)) ? "윤년" : "평년";
		
		// 결과 출력
		System.out.printf("%d년 → %s\n", nYear, strResult);
		//-결과출력
		//임의의 연도 입력 : 2000
		//2000년 → 윤년
		//계속하려면 아무 키나 누르십시오 . . .
		//	
		//임의의 연도 입력 : 2025
		//2025년 → 평년
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int year;			//-- 사용자가 입력한 임의의 연도를 담아낼 변수
		String strResult;	//-- 윤년인지 평년인지 판별 결과를 담아낼 변수
		
		System.out.print("임의의 연도 입력 : ");
		year = Integer.parseInt(br.readLine());
		
		// 연도가 4의 배수					연도가 100의 배수 아님							연도가 400의 배수
		// → 연도를 4로 나눈 나머지가 0	→ 연도를 100으로 나눈 나머지가 0이 아님		→ 연도를 400으로 나눈 나머지지가 0
		// → year %  4 == 0				→ year % 100 != 0								→ year % 400 == 0
		
		// 『year %  4 == 0 』 이면서  『year % 100 != 0』	거나 『year % 400 == 0』 이면 윤년~!!!
		// 『year %  4 == 0 』 && 『year % 100 != 0』 || 『year % 400 == 0』 이면 윤년~!!!
		strResult = ((year %  4 == 0) && (year % 100 != 0) || (year % 400 == 0)) ? "윤년" : "평년";
		
		System.out.printf("%d년 → %s\n", year, strResult);
		//--결과출력
		//임의의 연도 입력 : 2000
		//2000년 → 윤년
		//계속하려면 아무 키나 누르십시오 . . .
		//	
		//임의의 연도 입력 : 2025
		//2025년 → 평년
		//계속하려면 아무 키나 누르십시오 . . .
		//	
		//임의의 연도 입력 : 2024
		//2024년 → 윤년
		//계속하려면 아무 키나 누르십시오 . . .
	}
}