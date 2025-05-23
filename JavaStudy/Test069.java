/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- break 실습
===================================================================*/

/*
	※ break 키워드가 지니는 의미
		→ 멈춘다 ( + 그리고 빠져나간다)
		
		다음과 같은 처리가 이루어지는 프로그램을 구현한다.
		단, 입력받은 정수는 1~100 범위 안에서만
		가능하도록 처리한다.
		
		실행 예)
		
		임의의 정수 입력 : -10
		임의의 정수 입력 : 0
		임의의 정수 입력 : 2025
		임의의 정수 입력 : 10
		>> 1 ~ 10 까지의 합 : 55
		계속하시겠습니까(Y/N)? : Y   <--- 대/소문자 구분 없음(Y,y)
		
		임의의 정수 입력 : 100
		>> 1 ~ 100 까지의 합 : 5050
		계속하시겠습니까(Y/N)? : N   <--- 대/소문자 구분 없음(N,n)
		계속하려면 아무 키나 누르세요... → 프로그램 종료
*/

import java.util.Scanner;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test069
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		int nNum, nSum = 0, temp;
		String strCmd;
		char cCmd;
		Scanner sc = new Scanner(System.in);
		
		// 연산
		do
		{
			do
			{
				System.out.print("임의의 정수 입력 : ");
				nNum  = sc.nextInt();
			}
			while (!(nNum >= 0 && nNum <= 100));
			
			
			temp = 1;
			
			while (temp <= nNum)
			{
				nSum += temp;
				temp++;
			}
			
			
			System.out.printf(">> 1 ~ %d 까지의 합 : %d\n", nNum, nSum);
			
			System.out.print("계속하시겠습니까(Y/N)? : ");
			strCmd  = sc.next();
			cCmd = strCmd.charAt(0);
			
			// 확인(테스트)
			//System.out.printf("strCmd : %s\n",  strCmd);
		}
		while (cCmd == 'Y' || cCmd == 'y');
		*/
		
		/*
		// 변수 선언 및 초기화
		int nNum, nSum = 0, temp;
		String strCmd;
		char cCmd = 'Y';
		Scanner sc = new Scanner(System.in);
		
		// 연산
		while (cCmd == 'Y' || cCmd == 'y')
		{
			do
			{
				System.out.print("임의의 정수 입력 : ");
				nNum  = sc.nextInt();
			}
			while (!(nNum >= 0 && nNum <= 100));
			
			
			temp = 1;
			
			while (temp <= nNum)
			{
				nSum += temp;
				temp++;
			}
			
			
			System.out.printf(">> 1 ~ %d 까지의 합 : %d\n", nNum, nSum);
			
			System.out.print("계속하시겠습니까(Y/N)? : ");
			strCmd  = sc.next();
			cCmd = strCmd.charAt(0);
			
			// 확인(테스트)
			//System.out.printf("strCmd : %s\n",  strCmd);
			
			//
			if (!(cCmd == 'Y' || cCmd == 'y'))
			{
				break;
			}
		}
		
		*/
		// BufferedReader 인스턴스(→ 객체) 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// check~!!!
		int n, s, i;
		
		//--	n: 사용자 입력값을 담아둘 변수
		//		s: 누적합 연산 결과를 담아낼 변수
		//		i: 1 부터 1씩 사용자의 입력값까지 증가할 변수
		
		char ch;
		//-- 프로세스를 게속 진행할지 말지의 여부를 담아둘 변수
		
		while (true)	//-- 계속 반복 → 무한 반복
		{
			do
			{
				System.out.print("\n임의의 정수 입력 : ");
				n = Integer.parseInt(br.readLine());		// "123"  "\r\n" <- exception 발생
			}
			while (n < 1 || n > 100);
			
			//테스트(확인)
			//System.out.println("유효한 정수 입력이 완료된 상황~!!!");
			
			
			// 누적합 변수의 초기화 위치	check~!!!
			s = 0;
			
			// 1 부터 입력값(n) 까지의 누적합 연산
			//	→ 1 부터 입력값(n) 까지 반복
			for (i=1; i<=n; i++)
			{
				s += i;		//-- s 를 i만큼 증가  → 누적합 연산
			}
			
			System.out.printf(">> 1 ~ %d 까지의 합 : %d\n", n, s);
			System.out.print("계속하시겠습니까(Y/N)? : ");
			
			//br.readLine();
			ch = (char)System.in.read();
			//-- 계속할지 말지에 대한 여부(의사표현)
			
			// 그만할래~ → 반복문(→ 『while(true)』) 빠져나감
			/*
			if (ch == 'N' || ch == 'n')	//-- 'N' 또는 'n' 입력한거 맞아???
			{
				break;
			}
			*/
			
			// && 
			if (ch != 'Y' && ch != 'y')	//-- 'Y' 또는 'y' 입력하지 않은거 맞아???
			{
				// 반복문(→ 『while(true)』)을 멈추고 빠져나갈 수 있는 코드 작성 필요
				//-- 증, 위와 같은 의사 표현을 했다면
				// 그동안 수행했던 반복문을 멈추고 빠져나가야 한다.
				break;
				//-- 멈춘다 (+ 그리고 빠져나간다)  check~!!!
			}
			
			/*
			
			System.in.read()
			    ▼
			----------------------------------------------
			  50    y \r \n
			----------------------------------------------
			
					 System.in.read()
			         ▼
			----------------------------------------------
			  50    y \r \n
			----------------------------------------------
			
				     br.readLine()
			         ▼  ▼
			----------------------------------------------
			  50    y \r \n
			----------------------------------------------
			
			*/
			// Skips characters.
			// 엔터값(\r\n) 처리	 check~!!!
			br.skip(2);
		
		}//end while(true)
		
	}//close main()
	
}//class Test069

//-- 실행 결과
//임의의 정수 입력 : 500

//임의의 정수 입력 : 10
//>> 1 ~ 10 까지의 합 : 55
//계속하시겠습니까(Y/N)? : y

//임의의 정수 입력 : 10
//>> 1 ~ 10 까지의 합 : 55
//계속하시겠습니까(Y/N)? : n
//계속하려면 아무 키나 누르십시오 . . .