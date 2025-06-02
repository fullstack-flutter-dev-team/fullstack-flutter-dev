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
    ▶ 해당 월의 1일이 무슨 요일인가?
	▶ 해당 월이 마지막 날짜는 ?
 
*/

import java.util.Random;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;


/*
public class Test109
{
	private int year, month, weekDay;
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	String[] weekNames = {"일", "월", "화", "수", "목", "금", "토"};
	int[][] calendar; // 달력 배열
	
	void input() throws IOException
	{
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 연도 입력
		do
		{
			System.out.print("『연도』 를 입력하세요 : ");
			year = Integer.parseInt(br.readLine());
			
		}
		while (year <= 0);
		
		// 월 입력
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
	
	// xxxx년 xx월 1일의 요일 계산
	private void calcWeekday()
	{
		// 변수 선언 및 초기화
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
		
		
		// 전년도 까지의 날수 계산
		nalSu = 365*(year-1) + nLeapCount;
		
		
		// 해당 연도 직전 달까지의 누적 일수 계산
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
		
		// xxxx년 xx월 1일이 weekDay 인덱스 계산
		weekDay = (nalSu+1) % 7;
		
		// 확인(테스트)
		//String strWeekDay = weekNames[weekDay];
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
				if (i == 0)                      // 달력의 첫 번째 행 처리
				{
					if (j >= weekDay)
					{
						System.out.printf("%5d ", day++);
					} else {
						System.out.printf("%6c ", '\0');
					}
				} else {
					
					if (day > months[month-1])   // 해당 월 마지막 날 처리
					{
						break;
					}
					System.out.printf("%5d ", day++);
				}
			}
				System.out.println();    // 개행
		}
		
	
		drawLine('=', 45);               // '=' 라인
	}
	
	// 라인 삽입
	private void drawLine(char ch, int n)
	{
		for (int i = 0; i < n; i++)
		{
			System.out.print(ch);
		}
		
		System.out.println();     // 개행
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
		// Test109 클래스 인스턴스 생성
		Test109 obj = new Test109();
		
		// 연도, 월 입력 > 날수 계산 > 해당 월의 1일 요일 계산 > 달력 출력
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

*/

public class Test109
{
	public static void main(String[] args) throws IOException
	{
		// BufferedReader 인스턴스 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		 
		// 배열 선언 및 초기화
		//-- 각 월이 담고있는 마지막 날짜(매 월의 최대 날짜)
		int[] days = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		// 배열 인덱스 0   1   2  3   4   5    6   7  8   9   10  11
		// 월          1   2   3  4   5   6    7   8  9  10   11  12
		 
		//주요 변수 선언
		int nalsu, y, m, w;    //-- 날 수, 연, 월, 요일
		
		
		do
		{
			System.out.print("『연도』 를 입력하세요 : ");
			y = Integer.parseInt(br.readLine());
		}
		while (y < 1);
		//-- 입력받은 연도가 1보다 작을 경우 다시 입력받을 있도록 처리
		
		
		do
		{
			System.out.print("『월』 을 입력하세요 : ");
			m = Integer.parseInt(br.readLine());
		}
		while (m<1 || m>12);
		//-- 입력받은 월이 1보다 작거나 12보다 크면 다시 입력받을 수 있도록 처리
		//-----------------------------여기까지 수행하면 유효한 연도와 월을 사용자로부터 입력받은 상태
		
		
		// 입력받은 연도에 해당하는 2월의 마지말 날 계산
		if ((y%4 == 0 && y%100 != 0) || y%400 == 0)           //-- 윤년이라면...
		{
			// 2월의 마지막 날은 29일로 설정
			// 현재 기본값은 28일로 설정해 둔 상태
			days[1] = 29;
		}
		// else 구문은
		// 현재 days 배열의 1번째 요소(2월)가 28일로 구성되어 있는 상태이기 때문에
		// 생략 가능한 구문이 된다.
		
		// ① 
		// 1년 1월 1일 ~ 입력받은 연도의 이전 연도 12월 31일 까지의 날 수 계산
		//               -------------------------
		//                         (y-1)
		nalsu = (y-1)*365 + (y-1)/4 - (y-1)/100 + (y-1)/400;
		
		// ②
		// 입력받은 연도(해당 연도) 1월 1일 ~ 입력한 월의 이전 월까지의 알 수 계산하여 ①에 더해나가기
		//                                    -------------------
		//                                          (m-1)
		for (int i = 0; i < (m-1); i++)
		{
			nalsu += days[i];
		}
		
		// ③
		// 입력받은 월의 1일의 날 수 누적 연산
		nalsu += 1;   //   ++nalsu;
		
		//--------------------------- 여기까지 수행하면 모든 날 수에 대한 종합적인 연산 처리 완료
		
		// 요일 확인
		//-- 입력받은 연, 입력받은 월이 1일이 무슨 요일인지 확인하기 위한 연산
		w = nalsu % 7;
		//-- w → 0 → 일요일
		//-- w → 1 → 월요일
		//-- w → 2 → 화요일
		//-- w → 3 → 수요일
		//-- w → 4 → 목요일
		//-- w → 5 → 금요일
		//-- w → 6 → 토요일
		
		// 테스트(확인)
		//System.out.println("w : " + w);
		//--==>> 『연도』를 입력하세요 : 2025
		//        『월』 을 입력하세요 : 6
		//        w: 0 ---------------------2025년 6월 1일 → 일요일
		//--==>> 『연도』를 입력하세요 : 2025
		//        『월』 을 입력하세요 : 11
		//        w: 0 ---------------------2025년 11월 1일 → 토요일
		
		//------------------------ 여기까지 수행하면 입력 연도 입력 월의 1일이 무슨 요일인지 확인
		
		// 달력 그리기(출력)
		System.out.println();     // 개행
		System.out.printf("\t [ %d년 %d월 ]\n", y, m);
		System.out.println();     // 개행
		System.out.println("  일  월  화  수  목  금  토");
		System.out.println("==============================");
		
		// 특정 요일이 1일부터 시작되며 그려질 수 있도록 공백 발생(지정)
		for (int i = 0; i < w ; i++)
		{
			System.out.print("    ");      //공백 4칸 발생
		}
		
		
		// 테스트(확인)
		//System.out.printf("%4d", 1);
		//-- 1이 출력되는 위치 확인
		for (int i = 1; i <= days[m-1]; i++)
		{
			System.out.printf("%4d", i);
			
			w++; // 요일 인데스
			
			// 특정 상황에서의 개행
			//---------
			// 일요일 구성(출력)하려는 경우...
			// 즉, 이번에 출력하고자 하는 날짜가 일요일인 경우
			if (w%7 == 0)
			{
				// 개행
				System.out.println();
			}
		}
		// 달의 마지말 날짜가 출력 형식을 모두 채웠을 경우
		// (즉, 토요일까지 라인 전체가 출력되었을 경우)
		// 이미 반복문 내에서 일요일 개행이 이루어졌기 때문에
		// 이 경우에는 추가 개행을 하지 않도록 처리
		
		if (w%7 != 0)
		{
			System.out.println();
		}
		System.out.println("==============================");
	}
}
//-- 실행결과
/*
『연도』 를 입력하세요 : 2025
『월』 을 입력하세요 : 7

         [ 2025년 7월 ]

  일  월  화  수  목  금  토
==============================
           1   2   3   4   5
   6   7   8   9  10  11  12
  13  14  15  16  17  18  19
  20  21  22  23  24  25  26
  27  28  29  30  31
==============================
계속하려면 아무 키나 누르십시오 . . .

*/