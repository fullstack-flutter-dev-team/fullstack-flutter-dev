/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장. 실행흐름의 컨트롤
		- switch 구문
===================================================================*/


//사용자로부터 임의의 연도와 월을 입력받아
//해당 월의 마자막 날짜를 확인할 수 있는 프로그램을 구현한다.


//실행 예)
//임의의 연도를 입력하세요 : 2025
//임의의 월을 입력하세요 : 2

//>> 2025년 2월은 28일까지 있습니다.
//계속하려면 아무 키나 누르세요....

//임의의 연도를 입력하세요 : 2025
//임의의 월을 입력하세요 : 5

//>> 2025년 5월은 31일까지 있습니다.
//계속하려면 아무 키나 누르세요....


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test043
{
	public static void main(String[] args) throws IOException
	{
		/*
		
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nYear, nMonth, nLastDay = 30;
		boolean isLeap = false;
		
		System.out.print("임의의 연도를 입력하세요 : ");
		nYear = Integer.parseInt(br.readLine());
		
		System.out.print("임의의 월을 입력하세요 : ");
		nMonth = Integer.parseInt(br.readLine());
		
		
		if((nYear % 4 == 0 && nYear % 100 != 0)|| nYear%400==0) {		//윤년 조건
			isLeap = true;	
		} else {
			isLeap = false;
		}
		
		//
		
		switch (nMonth)
		{
			case 1: case 3: case 5: case 7: case 8: case 10: case 12:
				nLastDay = 31;
				break;
			case 4: case 6: case 9: case 11:
				nLastDay = 30;
				break;
			case 2:
				if (isLeap)
				{
					nLastDay = 29;
				} else {
					nLastDay = 28;
				}
				break;
			//default:
			//	nLastDay = 30;
			//	break;
		
		}
		
		// 결과 출력
		System.out.println();
		System.out.printf("%d년 %d월은 %d일까지 있습니다.\n", nYear, nMonth, nLastDay);
		//결과출력
		//임의의 연도를 입력하세요 : 2025
		//임의의 월을 입력하세요 : 2

		//2025년 2월은 28일까지 있습니다.
		//계속하려면 아무 키나 누르십시오 . . .
	
		//임의의 연도를 입력하세요 : 2025
		//임의의 월을 입력하세요 : 5

		//2025년 5월은 31일까지 있습니다.
		//계속하려면 아무 키나 누르십시오 . . .		
		*/
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int y, m, d;		//-- 연, 월, 일
		
		System.out.print("임의의 연도를 입력하세요 : ");
		y = Integer.parseInt(br.readLine());
		
		System.out.print("임의의 월을 입력하세요 : ");
		m = Integer.parseInt(br.readLine());
		
		
		// 월별 마자막 일자
		switch (m)
		{
			/*
			case 1: d=31; break;
			case 2: d=0; break; // check~!!! 윤년 고려
			case 3: d=31; break;
			case 4: d=30; break;
			case 5: d=31; break;
			case 6: d=30; break;
			case 7: d=31; break;
			case 8: d=31; break;
			case 9: d=30; break;
			case 10: d=31; break;
			case 11: d=30; break;
			case 12: d=31; break;
			*/
			
			case 1: case 3: case 5: case 7: case 8: case 10: case 12: d=31; break;
			case 4: case 6: case 9: case 11: d=30; break;
			//case 2: d=0; break;
			case 2:
				if ((y%4==0 && y%100 !=0) || y%400 ==0)
				{
					// 윤년
					d=29;
				} else {
					// 평년
					d=28;
				}
			
			//default: return; // 프로그램 종료
			//default:  d=-1; break;
		}
		
		System.out.println("\n>>" + y + "년 " + m + "월은 " + d + "일까지 있습니다.");
		// 결과 출력
		//임의의 연도를 입력하세요 : 2025
		//임의의 월을 입력하세요 : 2

		//2025년 2월은 28일까지 있습니다.
		//계속하려면 아무 키나 누르십시오 . . .		
		
		//임의의 연도를 입력하세요 : 2025
		//임의의 월을 입력하세요 : 5

		//2025년 5월은 31일까지 있습니다.
		//계속하려면 아무 키나 누르십시오 . . .
	}
}