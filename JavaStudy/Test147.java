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
 ㄴjava.util.Calendar
    ㄴjava.util.GregorianCalendar

  ※ Calendar 클래스는 추상 클래스이기 때문에 객체를 생성할 수 없다.
     (추상 클래스 : 완성되지 않은 클래스 즉, 완성되지 않은 설계도)
     
     Calendar ob  = new Calendar();
     → 이와 같은 구문을 통해 객체 생성 불가~!!
 
  ○ Calendar 클래스 객체(인스턴스)를 생성할 수 있는 방법
      1. Calendar ob1 = Calendar.getInstance();
      2. Calendar ob2 = new GregorianCalendar();
      3. GregorianCalendar ob3 = new GregorianCalendar();
  
  (※ GregorianCalendar : Calendar 클래스의 하위 클래스)
     → [그레고리력](https://ko.wikipedia.org/wiki/%EA%B7%B8%EB%A0%88%EA%B3%A0%EB%A6%AC%EB%A0%A5)
*/


/*
	연, 월, 일, 요일을 Calendar 객체로부터 가져와 출력
*/

// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Calendar;
import java.util.GregorianCalendar;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test147  // extends Object
{
	
	public static void main(String[] args)
	{
		// Calendar 인스턴스 생성
		// Calendar ob = new Calendar();
		Calendar rightNow = Calendar.getInstance();
		
		// 생성된 달력(rightNow) 인스턴스를 통해
		// 날짜 관련된 정보를 얻어낼 수 있는 메서드
		//  → 『get()』
		
		int y = rightNow.get(Calendar.YEAR);
		System.out.println("y : " + y);
		//--==>> y : 2025
		
		int m = rightNow.get(Calendar.MONTH) + 1;  //-- 『+1』 check~!!!
		System.out.println("m : " + m);
		//--==>> m : 6
		
		int d = rightNow.get(Calendar.DATE);
		System.out.println("d : " + d);
		//--==>> d : 11
		
		int w = rightNow.get(Calendar.DAY_OF_WEEK);
		System.out.println("w : " + w);
		//--==>> w : 4
		
		// 테스트(확인)
		System.out.println("Calendar.SUNDAY : " + Calendar.SUNDAY);       //--==>> 1 → 일요일
		System.out.println("Calendar.MONDAY : " + Calendar.MONDAY);       //--==>> 2 → 월요일
		System.out.println("Calendar.TUESDAY : " + Calendar.TUESDAY);     //--==>> 3 → 화요일
		System.out.println("Calendar.WEDNESDAY : " + Calendar.WEDNESDAY); //--==>> 4 → 수요일
		System.out.println("Calendar.THURSDAY : " + Calendar.THURSDAY);   //--==>> 5 → 목요일
		System.out.println("Calendar.FRIDAY : " + Calendar.FRIDAY);       //--==>> 6 → 금요일
		System.out.println("Calendar.SATURDAY : " + Calendar.SATURDAY);   //--==>> 7 → 토요일
		//-- 실행 결과
		//Calendar.SUNDAY : 1
		//Calendar.MONDAY : 2
		//Calendar.TUESDAY : 3
		//Calendar.WEDNESDAY : 4
		//Calendar.THURSDAY : 5
		//Calendar.FRIDAY : 6
		//Calendar.SATURDAY : 7
		
		System.out.printf("%d-%d-%d %d\n", y, m, d, w);
		//--==>> 2025-6-11 4
		
		String week = "";
		
		switch (w)
		{
			/*
			case Calendar.SUNDAY:  week = "일요일"; break;
			case Calendar.MONDAY:  week = "월요일"; break;
			case Calendar.TUESDAY:  week = "화요일"; break;
			case Calendar.WEDNESDAY:  week = "수요일"; break;
			case Calendar.THURSDAY:  week = "목요일"; break;
			case Calendar.FRIDAY:  week = "금요일"; break;
			case Calendar.SATURDAY:  week = "터요일"; break;
			*/
			case 1: week = "일요일"; break;
			case 2: week = "월요일"; break;
			case 3: week = "화요일"; break;
			case 4: week = "수요일"; break;
			case 5: week = "목요일"; break;
			case 6: week = "금요일"; break;
			case 7: week = "터요일"; break;
		}
		
		System.out.printf("%d-%d-%d %s\n", y, m, d, week);
		//--==>> 2025-6-11 수요일
		
		
		System.out.println("------------------------------");
		
		// Calendar 인스턴스 생성
		//Calendar rightNow2 = new Calendar(); //-- (x)
		
		//GregorianCalendar temp = new GregorianCalendar();
		//Calendar rightNow2 = temp;
		//   ↓
		Calendar rightNow2 = new GregorianCalendar(); //-- (O)
		
		String[] week2 = {
			"일요일",
			"월요일",
			"화요일",
			"수요일",
			"목요일",
			"금요일",
			"토요일"
			};
		
		// 달력의 날짜를 세팅
		// → 『set()』 메서드 활용
		
		// 수료일(2025-11-04)로 날짜 세팅
		rightNow2.set(2025, 10, 4);  //-- 『-1』 check~!!!
		
		rightNow2.get(Calendar.DAY_OF_WEEK);
		System.out.println(rightNow2.get(Calendar.DAY_OF_WEEK));
		//--==>> 3
		//      --- → 화요일
		
		System.out.println(week2[rightNow2.get(Calendar.DAY_OF_WEEK)-1]);
		
	}
	
}