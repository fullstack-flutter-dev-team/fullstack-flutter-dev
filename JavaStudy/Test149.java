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
    
    오늘을 기준으로 입력받는 날짜만큼 후의 연, 월, 일, 요일을
    확인하여 결과를 출력하는 프로그램을 구현한다.

    ※ API Document 참조하여 메서드의 활용 방법을 검토할 것~!!!
                            ----------
                               add()
                                : 현재 날짜를 기준으로 날 수를 더하는 연산 메서드
                                  → 『객체.add()』
    실행 예)
    오늘 날짜는 2025-6-12 목요일
    며칠 후의 날짜를 확인하고자 합십니까? : 200

    ================[확인결과]===============
    200일 후 : xxx-xx-xx x요일
    =========================================
    계속하려면 아무키나 누르세요...
*/

// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.IOException;
import java.util.Scanner;
import java.util.Calendar;
import java.util.GregorianCalendar;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test149  // extends Object
{
	private int nDiffDay;
	private int nYear, nMonth, nDay, nWeekday;
	private int nYearNew, nMonthNew, nDayNew, nWeekdayNew;
	private final String[] arrWeekDay = {
		"일",
		"월",
		"화",
		"수",
		"목",
		"금",
		"토",
	};
	
	
	public void input() throws IOException
	{
		// 인스턴스 생성 및 인스턴스 변수 초기화
		Scanner sc = new Scanner(System.in);
		Calendar cal = Calendar.getInstance();
		
		nYear = cal.get(Calendar.YEAR);
		nMonth = cal.get(Calendar.MONTH)+1;
		nDay = cal.get(Calendar.DAY_OF_MONTH);
		nWeekday = cal.get(Calendar.DAY_OF_WEEK)-1;
		
		System.out.printf("오늘 날짜는 %d-%d-%d  %s요일\n", nYear, nMonth, nDay, arrWeekDay[nWeekday]);
		System.out.print("며칠 후의 날짜를 확인하고자 하십니까? : ");
		nDiffDay = sc.nextInt();
		
		// 확인(테스트) 
		//System.out.println(">> nDiffDay : " + nDiffDay);
		
		// 오늘 기준으로 xx일 후 날짜 출력
		print(nDiffDay);
	}
	
	/**
	* 오늘 기준으로 xx일 후 날짜 출력
	*/
	private void print(int offset)
	{
		// 인스턴스 생성
		Calendar cal = Calendar.getInstance();
		
		// Adds the specified (signed) amount of time to the given calendar field, based on the calendar's rules.
		// Field number for get and set indicating the day of the month.
		cal.add(Calendar.DATE, nDiffDay);
		
		nYearNew = cal.get(Calendar.YEAR);
		nMonthNew = cal.get(Calendar.MONTH)+1;
		nDayNew = cal.get(Calendar.DAY_OF_MONTH);
		nWeekdayNew = cal.get(Calendar.DAY_OF_WEEK)-1;
		
		System.out.println(); // 개행
		System.out.println("===========[확인결과]==========");
		System.out.printf("%d일 후 : %4d-%02d-%02d  %s요일\n", offset, nYearNew, nMonthNew, nDayNew, arrWeekDay[nWeekdayNew]);
		System.out.println("===============================");
	}
	
	public static void main(String[] args) throws IOException
	{
		
		// Test149 클래스 인스턴스 생성
		//Test149 obj = new Test149();
		
		// 사용자 입력 & 처리결과 출력
		//obj.input();
		
		//-----------------------------------
		//Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);
			
		//Calendar 인스턴스 생성
		Calendar now = Calendar.getInstance();
		
		// 주요 변수 선언
		int nalsu;             //-- 사용자로부터 입력받은 날 수
		int y,m,d,w;           //-- 연, 월, 일, 요일
		String[] week = {
			"일",
			"월",
			"화",
			"수",
			"목",
			"금",
			"토",
		};
			
		// 현재의 연, 월, 일, 요일 확인하기
		// → 가져오기  : get() 메서드
		y = now.get(Calendar.YEAR);
		m = now.get(Calendar.MONTH) + 1;  //-- check~!!!
		d = now.get(Calendar.DATE);
		w = now.get(Calendar.DAY_OF_WEEK);
		
		// 현재의 연, 월, 일, 요일 확인결과 출력
		//System.out.println("오늘날짜는 " + 2025 + "-" + 6 + "-" + 12 + " " + "목" + "요일");
		//System.out.println("오늘날짜는 " + y + "-" + m + "-" + d + " " + week[w-1] + "요일");
		//--==>> 오늘날짜는 2025-6-12 목요일
		
		
		do
		{
			System.out.print("며칠 후의 날짜를 확인하고자 하십니까? : ");
			nalsu = sc.nextInt();
		}
		while (nalsu < 1);
		
		// check~!!!
		now.add(Calendar.DATE, nalsu);
		
		// 결과 출력
		System.out.println();
		System.out.println("=========[확인결과]===========");
		//System.out.printf("%d일 후 : xxx-xx-xx x요일", nalsu,);
		System.out.printf("%d일 후 : %tF %tA\n", nalsu, now, now);
		System.out.println("==============================");
		
		//String.format("%tF", 날짜시간객체);
		// → 년-월-일 형태의 문잔열 반환
		
		//String.format("%tA", 날짜시간객체);
		// → 요일 형태의 문자열 반환
		
// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

	}
	
	
}

//-- 실행 결과
/*
며칠 후의 날짜를 확인하고자 하십니까? : 100

=========[확인결과]===========
100일 후 : 2025-09-20 토요일
==============================
계속하려면 아무 키나 누르십시오 . . .

*/