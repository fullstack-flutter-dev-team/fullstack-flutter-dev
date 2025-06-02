/*========================================================================
	■■■ 만년 달력 ■■■
	-  다음과 같은 기능의 프로그램을 구현한다.
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/* 
    ▣ 컴파일 에러 발생 시 
       Test097.java:2: error: unmappable character (0xE2) for encoding x-windows-949
	   ?뼚?뼚?뼚 諛곗뿴 ?뼚?뼚?뼚
	
	  ==[Javac 인수(E)]==▶ javac -encoding UTF-8 $(FileName)
*/

/* 
    실행 예)
	 『연도』 를 입력하세요 : -25
	 『연도』 를 입력하세요 : 0
	 『연도』 를 입력하세요 : 2025
	 『월』 을 입력하세요 : 13
	 『월』 을 입력하세요 : -2
	 『월』 을 입력하세요 : 6
	 
	 [ 2025년 6월 ]
	 일 월 화 수 목 금 토
	 ======================
	 1  2  3  4  5  6  7
	 8  9 10 11 12 13 14
	15 16 17 18 18 20 21
	22 23 24 25 26 27 28
	29 30
    ======================
	계속하려면 아무 키나 누르세요...
*/

/*
 ▣ 힌트:
 
*/

import java.util.Random;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test109
{
	private int year, month, weekDay;
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	String[] weekNames = {"일", "월", "화", "수", "목", "금", "토"};
	int[][] calendar; // 달력 배열
	
	void input() throws IOException
	{
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		do
		{
			System.out.print("『연도』 를 입력하세요 : ");
			year = Integer.parseInt(br.readLine());
			
		}
		while (year <= 0);
		
		do
		{
			System.out.print("『월』 을 입력하세요 : ");
			month = Integer.parseInt(br.readLine());
			
		}
		while (month < 1 || month >12);
		
		//확인(테스트)
		//System.out.printf("연도 : %d , 월 : %d\n", year, month);
		
		// xxxx년 xx월 1일의 요일 구하기
		calcWeekday();
	}
	
	// 해달 월 1일의 요일 계산
	private void calcWeekday()
	{

		int nLeapCount = 0;
		int nalSu;
		
		for (int i = 1; i< year; i++)
		{
			if (isLeapYear(i))
			{
				// 윤년: 366일
				nLeapCount++;
			}
		}
		
		nalSu = 365*(year-1) + nLeapCount;
		
		
		for (int i = 0; i < this.month-1; i++)
		{
			if (i == 1)
			{	
				if (isLeapYear(this.year))
				{
					nalSu += months[i] + 1;
				} else {
					nalSu += months[i];
					
				}
			} else {
				nalSu += months[i];
			}
			
		}
		
		weekDay = ((nalSu+1) % 7);
		String strWeekDay = weekNames[weekDay];
		
		// 확인(테스트)
		//System.out.printf("요일 : %s\n", strWeekDay);
		
		// 달력 출력
		printCalendar();
	 
	}
	
	// 달력 출력
	private void printCalendar()
	{
	// [ 2025년 6월 ]
	// 일 월 화 수 목 금 토
	// ======================
	// 1  2  3  4  5  6  7
	// 8  9 10 11 12 13 14
	//15 16 17 18 18 20 21
	//22 23 24 25 26 27 28
	//29 30
    //======================
				 
		System.out.println(); // 개행
		System.out.printf(" [ %d년 %d월 ]\n", year, month);
		
		for (int i = 0; i < this.weekNames.length; i++)
		{
			System.out.printf("%4s ", this.weekNames[i]);
		}
		
		System.out.println(); // 개행
		drawLine('=', 45);
		
		calendar = new int[5][7];
		int day = 1;
		
		for (int i = 0 ; i< calendar.length; i++)
		{
			for (int j = 0; j < calendar[i].length; j++)
			{
				if (i == 0)
				{
					if (j >= weekDay)
					{
						System.out.printf("%5d ", day++);
					} else {
						System.out.printf("%6c ", '\0');
					}
				} else {
					
					if (day > months[month-1])
					{
						break;
					}
					System.out.printf("%5d ", day++);
				}
			}
				System.out.println();
		}
		
	
		drawLine('=', 45);
	}
	
	// 라인 삽입
	private void drawLine(char ch, int n)
	{
		for (int i = 0; i < n; i++)
		{
			System.out.print(ch);
		}
		
		System.out.println();
	}
	
	// 해당 연도가 윤년인지 여부 확인
	private boolean isLeapYear(int year)
	{
		boolean ret = false;
		
		if ((year % 4 == 0 && year %100 != 0) || (year % 400 == 0))
		{
			ret = true;
		}
		
		return ret;
	}
	
	
	public static void main(String[] args) throws IOException
	{
		
		Test109 obj = new Test109();
		
		//
		obj.input();
	}
}

//--실행 결과
//『연도』 를 입력하세요 : -25
//『연도』 를 입력하세요 : 0
//『연도』 를 입력하세요 : 2024
//『월』 을 입력하세요 : 13
//『월』 을 입력하세요 : -2
//『월』 을 입력하세요 : 12

// [ 2024년 12월 ]
//   일    월    화    수    목    금    토
//=============================================
//    1     2     3     4     5     6     7
//    8     9    10    11    12    13    14
//   15    16    17    18    19    20    21
//   22    23    24    25    26    27    28
//   29    30    31
//=============================================
//계속하려면 아무 키나 누르십시오 . . .