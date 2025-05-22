/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- 반복문(while문) 실습
===================================================================*/

/*
	사용자로부터 원하는 단(구구단)을 입력받아
	해당 구구단을 출력하는 프로그램을 구현한다.
	단, 1단 ~ 9단 사이의 수를 입력받은 상황이 아니라면
	이에 대한 안내를 한 후 프로그램을 종료할 수 있도록 처리한다.
	
	실행 예)
	원하는 단(구구단) 입력 : 7
	7 * 1 = 7
	7 * 2 = 14
	7 * 3 = 21
	7 * 4 = 28
	7 * 5 = 35
	7 * 6 = 42
	7 * 7 = 49
	7 * 8 = 56
	7 * 9 = 63
	계속하려면 아무 키나 누르세요...
	
	원하는 단(구구단) 입력 : 11
	1 부터 9 까지의 정수만 입력이 가능합니다.
	계속하려면 아무 키나 누르세요...
	
	
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test057
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nNumDan, nNum = 1;
		
		// 사용자 입력 안내문구 출력 및 사용자 입력처리
		System.out.print("원하는 단(구구단) 입력 : ");
		nNumDan = Integer.parseInt(br.readLine());
		
		// 연산 및 결과 출력
		if (nNumDan < 1  || nNumDan > 9) {
			System.out.println("1 부터 9 까지의 정부만 입력이 가능합니다.");
		} else {
			while (nNum <= 9)
			{
				System.out.printf("%d * %d = %d\n", nNumDan, nNum, (nNumDan * nNum));
				nNum++;
			}
		}
		*/
		
		// 주요 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int dan;		//-- 사용자로부터 입력값을 정수형태로 담아낼 변수(단)
		
		// 연산 및 처리
		System.out.print("원하는 단(구구단) 입력 : ");
		dan = Integer.parseInt(br.readLine());
		
		// 입력값이 조건에 맞게 처리되었는지에 대한 확인
		if (dan < 1 || dan > 9)
		{
			// 안내 후 프로그램 종료
			System.out.println("1 부터 9 까지으 정수만 입력이 가능합니다.");
			return;	// 값의 반환, 해당 메소드 종료(main() 메서드일 경우 프로그램 종료)
		}
		
		int n = 0;
		
		
		// 결과 출력(반복 출력)
		while (n < 9)
		{
			n++;
			
			// 테스트(확인)
			//System.out.println("n : " + n);
			
			System.out.printf("%d * %d = %d\n", dan, n, (dan*n));
		}
		
	}
}

// 실행결과
// 원하는 단(구구단) 입력 : 7
// 7 * 1 = 7
// 7 * 2 = 14
// 7 * 3 = 21
// 7 * 4 = 28
// 7 * 5 = 35
// 7 * 6 = 42
// 7 * 7 = 49
// 7 * 8 = 56
// 7 * 9 = 63
// 계속하려면 아무 키나 누르십시오 . . .
   
// 원하는 단(구구단) 입력 : 11
// 1 부터 9 까지의 정부만 입력이 가능합니다.
// 계속하려면 아무 키나 누르십시오 . . .
