/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- 반복문(while문) 실습 - 소수 체크
===================================================================*/

/*
	사용자로부터 임의의 정수를 입력받아
	입력받은 정수가 소수인지 아닌지를 판별하여
	결과를 출력하는 프로그램을 구현한다.
	
	※ 소수 : 1 또는 자기 자신의 값 이외에 어떤 수로도
				나누어 떨어지지 않는 수.
				단, 1은 소수 아님.
	
	
	실행 예)
	임의의 정수 입력 : 10
	>> 10 → 소수 아님
	계속하려면 아무 키나 누르세요...
	
	임의의 정수 입력 : 11
	>> 11 → 소수
	계속하려면 아무 키나 누르세요...
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test054
{
	public static void main(String[] args)  throws IOException
	{
		/*
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nInNum, nCnt = 0, nCount = 0;
		String strResult = "소수";
		
		// 사용자 입력 안내문국 출력
		System.out.print("임의의 정수 입력 : ");
		nInNum = Integer.parseInt(br.readLine());
		
		while (nCnt < nInNum)
		{
			nCnt++;
			
			if ((nInNum % nCnt) == 0 && nCnt != 1 && nCnt != nInNum || nInNum == 1)
			{
				nCount++;
				strResult = "소수 아님";
				break;
			}
			
			// 확인(테스트)
			//System.out.printf(">> %d → %sm  nCnt: %d,  nCount: %d\n", nInNum, strResult, nCnt, nCount);
			
		} 
		
		// 결과 출력
		System.out.printf(">> %d → %s, nCount: %d\n", nInNum, strResult, nCount);
		System.out.printf(">> %d → %s\n", nInNum, strResult);
		//--실행 결과
		//임의의 정수 입력 : 17
		//>> 17 → 소수
		//계속하려면 아무 키나 누르십시오 . . .
		
		//임의의 정수 입력 : 10
		//>> 10 → 소수 아님
		//계속하려면 아무 키나 누르십시오 . . .
		
		//임의의 정수 입력 : 1
		//>> 1 → 소수 아님
		//계속하려면 아무 키나 누르십시오 . . .
		
		*/
		
		
		// 주요 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int num;			//-- 사용자의 입력값을 담아낼 변수
		int n = 2;			//-- 입력값을 대상으로 나눗셈 연산을 수행할 변수
							//		2부터 시작해서 1씩 증가
							//		ex) 입력값 11 → n : 2 3 4 5 6 7 8 .... 10
		
		// 연산 및 처리
		//-- 사용자에게 안내 메세지 출력, 입력값 얻어오기
		System.out.print("임의의 정수 입력 : ");
		num = Integer.parseInt(br.readLine());
		
		//-- 사용자가 어떤 값을 입력한 상태인지 알 수 없지만
		//		우선 이 값을 소수로 간주(가정)한다.
		//String flag = "소수";	// "소수아님"
		//char flag = 'T';		// 'F'
		//int flag = 1;			// 0
		boolean flag = true;	// false
		//-- num(→ 사용자 입력값)은 소수일 것이다~!!!
		
		while (n < num)
		{
			// 테스트(확인)
			//System.out.println("반복문 수행... n은 " + n);
			
			// 확인 연산
			//-- n 으로 num을 나우어 떨어지는지 확인(→ 나머지가 0인지 확인)
			
			if (num % n ==  0)
			{
				// 테스트(확인)
				// 앗~! 난 너를 소수라 생각했는데.... ㅠㅠ
				// 넌 소수가 아니었어~ 흑흑~
				//System.out.println("넌 소수가 아니구나~ 흑흑...");
				flag = false;
				
				// 추가 테스트(확인)
				//System.out.println("조건 확인 n은 " + n);
				
				// ⭐ 반복문 탈출로 리소스 소모량을 줄인다.
				break;		//-- 멈춘다 ( + 그리고 빠져나간다.)
							//				→ break를 감싸는 가장 가까운 반복문
			}
			
			n++;
		}
		
		
		// 테스트(확인)
		//System.out.println("flag 확인 : " + flag);
		
		//첫 번째 허들을 넘어온 결과...에 추가적인 확인이 필요한 상황
		//	→ 1이 아닌 상황인가???
		
		// 결과 출력
		// (최종 결과값을 출력하기 전에 수행해야 할 추가 확인
		//	→ 입력값이 1이 아닌지에 대한 검토)
		if (flag && num != 1)
		{
			// 위 조건도 true... 추가 확인... 입력값이 1도 아님  → 최종적으로 소수
			System.out.printf("%d → 소수\n", num);
		} else {
			// 위 조건이 false 이거나... 추가 확인 ... 입력값이 1인 상황 → 최종적으로 소수 아님
			System.out.printf("%d → 소수 아님\n", num);
		}
		
		//-- 결과 출력
		//임의의 정수 입력 : 1009
		//1009 → 소수
		//계속하려면 아무 키나 누르십시오 . . .
			
		//임의의 정수 입력 : 1008
		//1008 → 소수 아님
		//계속하려면 아무 키나 누르십시오 . . .

		//임의의 정수 입력 : 1
		//1 → 소수 아님
		//계속하려면 아무 키나 누르십시오 . . .
	}
}