/*===================================================================
	■■■ 연산자(Operator) ■■■
		- 조건 연산자 == 삼항 연산자, 양수/음수 판별
===================================================================*/

//사용자로부터 임의의 정수를 입력받아
//입격받은 정수가 양수인지, 음수인지, 0인지 구분하여
//이 결과를 출력하는 프로그램을 구현한다.
//단, 입력 데이터는 BufferedReader를 활용하여 처리하고,
//조건 연산자(삼항 연산자)를 활용하여 기능을 구현할 수 있도록 한다.

//실행 예)
//임의의 정수 입력 : -42
//-42 → 음수
//계속하려면 아무 키나 누르세요.

//임의의 정수 입력 : 1024
//1024 → 양수
//계속하려면 아무 키나 누르세요.


//임의의 정수 입력 : 0
//0 → 영
//계속하려면 아무 키나 누르세요.

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test027
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		int nNum;
		String strResult;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 사용자 입력 안내문 출력
		System.out.print("임의의 정수 입력 : ");
		nNum = Integer.parseInt(br.readLine());
		
		// 연산
		
		strResult  = (nNum == 0 ) ? "영" : ((nNum > 0) ? "양수" : "음수");
		
		// 결과 출력
		System.out.printf("%d → %s\n", nNum, strResult);
		*/
		
		// 주요 변수 선언
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int n;
		String strResult;
		
		
		// 연산 및 처리
		System.out.print("임의의 정수 입력 : ");
		//br.readLine();
		//Integer.parseInt(br.readLine());
		n = Integer.parseInt(br.readLine()); // 추가: import java.io.IOException; throws IOException
		
		
		/*
		✨
		(n 이 0 보다 크다) ?	→	true	→ n 은 양수
							→	false	→ n 은 0 보다 작다 ?	→ true		→ n 은 음수
																→ false	→ n 은 영
																
		(n > 0) ?	("양수")	: (다시 확인)
							---------------
								(n < 0) ?	("음수")	: "영");
								
		
		(n > 0) ?	("양수")	: ((n < 0) ?	("음수")	: "영"));
		
		
		(1024 > 0) ?	("양수")	: ((n < 0) ?	("음수")	: "영"));
		(true) ?	("양수")	: ((n < 0) ?	("음수")	: "영"));
		("양수");
		strResult = ("양수");
		
		strResult = (-42 > 0) ?	("양수")	: ((n < 0) ?	("음수")	: "영"));
		strResult = (false) ?	("양수")	: ((n < 0) ?	("음수")	: "영"));
		strResult = ((-42 < 0) ?	("음수")	: "영"));
		strResult = (true) ?	("음수")	: "영"));
		strResult = ("음수");
		
		strResult = (0 > 0) ?	("양수")	: ((n < 0) ?	("음수")	: "영"));
		strResult = (false) ?	("양수")	: ((n < 0) ?	("음수")	: "영"));
		strResult = (0 < 0) ?	("음수")	: "영");
		strResult = (false) ?	("음수")	: "영"));
		strResult = ("영");
		*/
		strResult = (n > 0)? ("양수") : ((n < 0) ? ("음수") : ("영"));
		
		// 결과 출력
		System.out.println(n + " → " + strResult);
		
		// 생행 결과
		//임의의 정수 입력 : -56
		//-56 → 음수
		//계속하려면 아무 키나 누르십시오 . . .

		//임의의 정수 입력 : 2580
		//2580 → 양수
		//계속하려면 아무 키나 누르십시오 . . .
		//	

		//임의의 정수 입력 : 0
		//0 → 영
		//계속하려면 아무 키나 누르십시오 . . .
		
		br.close();
	}
}