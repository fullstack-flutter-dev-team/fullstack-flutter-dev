/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장. 실행흐름의 컨트롤
			- if문
			- if ~ else문 실습
===================================================================*/

  
// 1. 프로그램을 작성할 때 주어진 조건에 따라
//		분기 방향을 정하기 위해 사용되는 제어문에는
//		if문, if - else문, 조건 연산자, 복합 if문(if문 중첩)
//		, switch문 등이 있다.
	
// 2. if 문은 if 다음의 조건이 참(true)일 경우
//		특정 문장을 수행하고자 할 때 사용하는 구문이다.

  
// ○ 과제
//	사용자로부터 임의의 연도를 입력받아
//	입력받은 연도가... 윤년인지, 평년인지 판별하여
//	그 결과를 출력하는 프로그램을 구현한다.
//	단, 입력은 BufferedReader 를 활용하고,
//	if 조건문을 활용하여 연산을 수행할 수 있도록 한다.

// 실행 예)
// 임의의 연도 입력 : 2000
// 2000 -> 윤년
// 계속하려면 아무 키나 누르세요...

// 임의의 연도 입력 : 2012
// 2012 -> 윤년
// 계속하려면 아무 키나 누르세요...

// 임의의 연도 입력 : 2025
// 2025 -> 평년
// 계속하려면 아무 키나 누르세요...

// ※ 2월이	28일까지 있는 해 → 평년
//			29일까지 있는 해 → 윤년
//		
// ※ 윤년의 판별 조건
//		연도가 4의 배수이면서 100의 배수가 아니거나, 400의 배수이면 윤년~!!!!
//		그렇지 않으면 평년~!!!!
  
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
  
public class Test034
{
	public static void main(String[] args) throws IOException
	{
		
		// 변수 선언 및 초기화
		int nYear; // 임의의 연도
		String strLeap = "평년";
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 연산 및 처리
		System.out.print("임의의 연도 입력 : ");
		nYear = Integer.parseInt(br.readLine());
		
		if ((nYear % 4 == 0 && nYear % 100 != 0) || nYear % 400 == 0) {		//윤년 조건
			strLeap = "윤년";
		}

		System.out.println(nYear + " → " + strLeap);		
	}
}

//--결과 출력
//임의의 연도 입력 : 2000
//2000 → 윤년
//계속하려면 아무 키나 누르십시오 . . .

//임의의 연도 입력 : 2025
//2025 → 평년
//계속하려면 아무 키나 누르십시오 . . .
