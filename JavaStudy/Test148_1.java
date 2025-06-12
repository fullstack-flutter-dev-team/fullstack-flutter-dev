/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- Calendar 클래스
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class Calendar](https://docs.oracle.com/javase/8/docs/api/java/util/Calendar.html) 
/// @see [Class GregorianCalendar](https://docs.oracle.com/javase/8/docs/api/java/util/GregorianCalendar.html) 

/*
java.lang.Object
 ㄴjava.lang.String

java.lang.Object
 ㄴjava.util.Calendar
    ㄴjava.util.GregorianCalendar

  ※ java.util.Calendar 클래스는 
     날짜와 시간을 객체 모델링화 한 클래스로
     연, 월, 일, 요일, 시, 분, 초 까지의 시간과 날짜와 관련된 정보를 제공한다.
     그리고 Calendar 클래스는 추상 클래스이므로 직접 객체를 생성할 수 없으며
     실제적인 메서드 구현은 Calendar 클래스의 서브 클래스인
     GregorianCalendar 클래스에 정의되어 있다.
     
     시스템으로부터 현재 시스템 시간 정보를 얻어올 때
     getInstance() 라는 정적(static) 메서드를 이용하여 객체를 생성할 수 있다.
     생성된 Calendar 클래스 객체는 시스템의 현재 날짜와 시간 정보를 가지며,
     이 객체가 생성되면 갖고있는 시간 정보들은
     get() 메서드를 이용하여 쉽게 가져올(사용할) 수 있다.
     
     getInstance() 메서드는 내부적으로 GregorianCalendar 객체를 생성하여
     돌려주기 때문에 GregorianCalendar 객체를 직접 생성하여 시간 정보를 구할 수도 있다.
     
     
     (※ GregorianCalendar : Calendar 클래스의 하위 클래스)
        → [그레고리력](https://ko.wikipedia.org/wiki/%EA%B7%B8%EB%A0%88%EA%B3%A0%EB%A6%AC%EB%A0%A5)
*/


/*
    
    사용자로부터 연, 월을 입력받아
    달력을 그려주는(출력하는) 프로그램을 구현한다.
    단, Calendar 클래스를 활용하여 작성할 수 있도록 한다.
    ※ API Document 참조하여 메서드의 활용 방법을 검토할 것~!!!
                           ------------
                            
    실행 예)
    연도 입력 : 0
    연도 입력 : 2025
    월 입력 : -10
    월 입력 : 13
    월 입력 : 6
     
    [ 2025년 6월] 
     
     일  월  화  수  목  금  토
    =====================================
      1  2   3   4   5   6   7
      8  9  10  11  12  13  14
     15 16  17  18  19  20  21
     22 23  24  25  26  27  28
     29 30
    =====================================
    계속하려면 아무 키나 누르세요.....
*/

// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.IOException;
import java.util.Scanner;
import java.util.Calendar;
import java.util.GregorianCalendar;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test148_1  // extends Object
{
	
	private int nYear, nMonth, nDay, nLastDay, nWeekDayIdx;
	private String[] arrWeek = {
		"일",
		"월",
		"화",
		"수",
		"목",
		"금",
		"토"
		};
	
	public void input()
	{
		/*
		  연도 입력 : 0
		  연도 입력 : 2025
		  월 입력 : -10
		  월 입력 : 13
		  월 입력 : 6
		*/
		
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("연도 입력 : ");
			nYear = sc.nextInt();
		}
		while (nYear < 1);
		
		do
		{
			System.out.print("월   입력 : ");
			nMonth = sc.nextInt();
		}
		while (nMonth < 1 || nMonth > 12);
		
		GregorianCalendar cal2 = new GregorianCalendar(nYear, nMonth-1, 1);
		nLastDay = cal2.getActualMaximum(Calendar.DAY_OF_MONTH);
		nWeekDayIdx = cal2.get(Calendar.DAY_OF_WEEK);
		
		//System.out.printf("nMonth : %d\n", nMonth);
		//System.out.println("isLeapYear : " + cal2.isLeapYear(2025));
		//System.out.println("getMaximum : " + cal2.getMaximum(Calendar.DAY_OF_MONTH));
		//System.out.println("SUNDAY : " + Calendar.SUNDAY);
		//System.out.println("getMaximum : " + cal2.getActualMaximum(Calendar.DAY_OF_MONTH));
		//System.out.println("DAY_OF_WEEK : " + cal2.get(Calendar.DAY_OF_WEEK));
		
		// 달력 출력
		drawCalendar();
	}
	
	
	public void drawCalendar()
	{ 
		//월 입력 : 6
		//
		//[ 2025년 6월] 
		//
		//일  월  화  수  목  금  토
		//=====================================
		//1  2   3   4   5   6   7
		//8  9  10  11  12  13  14
		//15 16  17  18  19  20  21
		//22 23  24  25  26  27  28
		//29 30
		//=====================================

		// Calendar 클래스 인스턴스 생성
		Calendar cal = Calendar.getInstance();
		String strTemp;

		// 입력정보 출력(연월)
		System.out.printf("\n  [ %d년  %d월 ]\n", nYear, nMonth);
		System.out.println(); // 개행
		
		// 상단 "===.." 출력
		drawLine('=', 20);
		
		// 달력 요일명 출력
		printWeekdayTitle();

		//---------------------------------------
		
		int temp = 1;
		
		for (int i = 0; i < 5; i++)
		{
			for (int j = 1; j <= 7; j++)
			{
				strTemp = (i == 0 && j < nWeekDayIdx) ? "   " : String.format("%2d ", temp++);
				System.out.print(strTemp);
				
				if (temp > nLastDay)
				{
					break;
				}
				
				if (j % 7 == 0)
				{
					System.out.println();
				}
			}
		}
		
		System.out.println();  // 개행
		//---------------------------------------
		
		// 하단 "===.." 출력
		drawLine('=', 20);
	}
	
	private void printWeekdayTitle()
	{
		for (String strWeekDay : arrWeek)
		{
			System.out.printf("%s ", strWeekDay);
		}
		
		System.out.println(); // 개행
	}
	
	private void drawLine(char chType, int count)
	{
		for (int i = 0; i < count; i++)
		{
			System.out.printf("%c", chType);
		}
		
		System.out.println(); // 개행
	}
	
	public static void main(String[] args)
	{
		// Test148 클래스의 인스턴스 생성
		Test148_1 obj = new Test148_1();
		
		// 연, 월 사용자 입력 & 달력 출력
		obj.input();
	}
	
}

//-- 실행 결과
/*

연도 입력 : 2025
월   입력 : 6

  [ 2025년  6월 ]

====================
일 월 화 수 목 금 토
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30
====================
계속하려면 아무 키나 누르십시오 . . .


연도 입력 : 2026
월   입력 : 1

  [ 2026년  1월 ]

====================
일 월 화 수 목 금 토
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31
====================
계속하려면 아무 키나 누르십시오 . . .



*/