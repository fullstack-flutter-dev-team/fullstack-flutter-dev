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

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Scanner;
import java.util.Calendar;
import java.util.GregorianCalendar;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test148  // extends Object
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
	
	public static void main(String[] args) throws IOException
	{
		// Test148 클래스의 인스턴스 생성
		//Test148 obj = new Test148();
		
		// 연, 월 사용자 입력 & 달력 출력
		//obj.input();
		
		//-----------------------------------------------------------------
		// 테스트(확인) → 관찰
		/*
		// Calendar 클래스 인스턴스 생성
		Calendar ob = Calendar.getInstance();
		
		System.out.println(ob.getActualMaximum(Calendar.YEAR));  //--==>> 292278994
		System.out.println(ob.getActualMaximum(Calendar.MONTH)); //--==>> 11
		System.out.println(ob.getActualMaximum(Calendar.DATE));  //--==>> 30
		System.out.println(ob.getActualMaximum(Calendar.HOUR));  //--==>> 11
		System.out.println(ob.getActualMaximum(Calendar.HOUR_OF_DAY));  //--==>> 23
		System.out.println(ob.getActualMaximum(Calendar.MINUTE));  //--==>> 59
		System.out.println(ob.getActualMaximum(Calendar.SECOND));  //--==>> 59
		System.out.println(ob.getActualMaximum(Calendar.DAY_OF_WEEK));  //--==>> 7
		System.out.println(ob.getActualMaximum(Calendar.DAY_OF_MONTH));  //--==>> 30
		*/
		
		// BufferedReader 인스턴스 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// Calendar 인스턴스 생성
		Calendar cal = Calendar.getInstance();
		
		// 주요 변수 선언
		int y, m;    //-- 연, 월
		int w;       //-- 요일
		int i;       //-- 루프 변수 활용

		do
		{
			System.out.print("연도 입력 : ");
			y = Integer.parseInt(br.readLine());
		}
		while (y < 1);
		
		do
		{
			System.out.print("월   입력 : ");
			m = Integer.parseInt(br.readLine());
		}
		while (m < 1 || m > 12);

		// 사용자로부터 입력받은 연(y), 월(m)을 이용하여
		// 달력의 날짜 세팅
		cal.set(y, m-1, 1);  //-- check~!!! Month 인덱스는 0부터 시작
		//-- 월 구성 시 입력값(m)을 그대로 사용하는 것이 아니라
		//   입력값에서 1을 뺀 값으로 월을 설정해야 한다.
		//-- 일 구성 시 입력받은 연, 월에 해당하는 1일로 설정해야 한다.
		//    이는 달력을 그려내기 위해서는 1일의 요일 확인이 필요하기 때문이다.
		
		// 세팅된 달력의 날짜로부터 요일 가져오기
		w = cal.get(Calendar.DAY_OF_WEEK);
		
		// 테스트(확인)
		//System.out.println("w : " + w);
		//-- 출력 결과
		//연도 입력 : 0
		//연도 입력 : 2025
		//월   입력 : -10
		//월   입력 : 13
		//월   입력 : 6
		//w : 1 → 2025년 6월 기주 → 일요일 → 2025년 6월 1일은 일요일~!!!
		
		// 결과 출력 → 달력 그리기
		System.out.println();
		System.out.println("\t[ " + y + "년 " + m + "월 ]\n");
		System.out.println("  일  월  화  수  목  금  토");
		System.out.println("=============================");
		for (i = 1; i < w; i++)
		{
			System.out.print("    ");  //-- 공백 4칸 발생
		}
		
		// 테스트(확인)
		//System.out.printf("%4d", 1);
		
		// Calendar 의 『getActualMaximum(int field)』 메서드 check~!!!
		//for (i = 1; i <= 31; i++)
		for (i = 1; i <= cal.getActualMaximum(Calendar.DATE); i++)
		{
			System.out.printf("%4d", i);
			
			//-- 반복문을 수행하며 날짜가 증가할 때 마다
			//    요일도 이와 함께 증가할 수 있도록 처리
			w++;
			
			// 날짜를 출력하는 과정에서 일요일을 출력할 때 마다
			// 개행 후 출력될 수 있도록 처리
			if (w % 7 == 1)
			{
				System.out.println(); //-- 개행
			}
		}
		
		// 최종 출력 이후 일요일 개행이 저용되지 않았을 경우에만
		// 개행할 수 있도록 처리
		if (w%7 != 1)
		{
			System.out.println(); //-- 개행
		}
	
		System.out.println("=============================");
		
		
		// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
		// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
	}
	
}

//-- 실행 결과
/*

연도 입력 : 2025
월   입력 : 6

        [ 2025년 6월 ]

  일  월  화  수  목  금  토
=============================
   1   2   3   4   5   6   7
   8   9  10  11  12  13  14
  15  16  17  18  19  20  21
  22  23  24  25  26  27  28
  29  30
=============================
계속하려면 아무 키나 누르십시오 . . .


연도 입력 : 2026
월   입력 : 1

        [ 2026년 1월 ]

  일  월  화  수  목  금  토
=============================
                   1   2   3
   4   5   6   7   8   9  10
  11  12  13  14  15  16  17
  18  19  20  21  22  23  24
  25  26  27  28  29  30  31
=============================
계속하려면 아무 키나 누르십시오 . . .


*/