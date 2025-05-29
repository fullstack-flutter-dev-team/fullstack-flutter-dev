/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
	-  클래스 설계
	-  배열의 활용
	-  정보은닉과 접근제어 지시자
=========→==========================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛º

/* 
    사용자로부터 임의의 연, 월, 일을 입력받아
	해당 날짜의 요일을 출력하는 프로그램을 구현한다.
	단, 달력 클래스(Calendar)는 사용하지 않는다.
	또한, 클래스와 인스턴스의 개념을 활요하여 작성할 수 있도록 한다.
	  (→ WeekDay 클래스 설계)
	그리고, 배열의 개념도 적용시켜 작성할 수 있도록 한다.
	접근제어 지시자의 개념도 확인하여 작성할 수 있도록 한다.
	최종적으로..
	
	WeekDay 클래스의 설계를 통해
	Test103 클래스의 main() 메소드가 정상적으로 작동하여
	프로그램이 실행될 수 있도록 한다.
	
	실행 예)
	연 월 일 입력(공백 구분)  : 2025 5 29
	>> 2025년 5월 29일 → 목요일
	계속하려면 아무키나 누르세요...
	
	Hint
	  - 1년 1월 1일 → "월요일"
	  - 1년이 항상 265일은 아니다.
	    º 2월의 마지막 날짜가 29일 → 윤년
		º 2월의 마지막 날짜가 28일 → 평년
		º 윤년의 판별 조건
		   → 연도가 4의 배수이면서 100의 배수가 아니거나,
		       400의 배수이면 윤년, 그 이외의 연도는 평년.
     
     
     
*/

/* 

*/

/*
 ▣ 힌트:
    
*/


import java.util.Scanner;
import java.util.Random;

class WeekDay
{
	private int[][] calendar;
	private int nYear, nMonth, nDay, nDaysToLastYear, nDaysToLastMonthOfThisYear, nLeapCount;
	private String[] arrWeekDay = {"일요일" , "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	private boolean isLeapYear;
	
	public void input()
	{
		//
		Scanner sc = new Scanner(System.in);
		
		System.out.print("연 월 일 입력(공백 구분) : ");
		this.nYear = sc.nextInt();
		this.nMonth = sc.nextInt();
		this.nDay = sc.nextInt();
	}
	
	public boolean isLeapYear()
	{
		boolean isLeapYear = false;
		
		if (((this.nYear % 4 == 0) && (this.nYear % 100 != 0)) || (this.nYear % 400 == 0))
		{
			isLeapYear = true;
		}
		
		this.isLeapYear = isLeapYear;
		return isLeapYear;
	}
	
	
	public boolean isLeapYear(int year)
	{
		boolean isLeapYear = false;
		
		if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
		{
			isLeapYear = true;
		}
		
		return isLeapYear;
	}
	
	/*
		1월: 31일
		2월:28/29일
		3월:31일
		4월:30일
		5월:31일
		6월:30일
		7월:31일
		8월:31일
		9월:30일
		10월:31일
		11월:30일
		12월:31일
	*/
	
 
	
	public String getWeekDay()
	{
		
		/*
 		   0     1    2    3    4    5    6    0    1   2    3    4    5  6   0    1    2    3    4     5    6   0   1    2    3    4    5     6     0    1   2    3    4   5
		         1    2    3    4    5    6    7    8   9   10   11   12  13  14   15   16   17    18   19   20  21  22   23   24   25   26    27    28   29  30   31   1  2
		   ------------------------------------
		   0     1    2    3    4    5     6
		   일   월    화   수  목   금    토
		         1    2    3   4     5     6
		    7    8    9   10  11    12    13
		   14   15   16   17  18    19    20
		   21   22   23   24  25    26    27
		   28   29   30   31
		
		*/
		
		int nWeekDayIndex = 0;
		nDaysToLastYear = nDaysToLastMonthOfThisYear = nLeapCount=  0;
		
		for (int i = 1; i < nYear; i++)
		{
			if (isLeapYear(i))
			{ 
				nLeapCount++;
			}
		}
		
		for (int j = 1; j < this.nMonth; j++)
		{
			switch (j)
			{
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
				case 12:
					nDaysToLastMonthOfThisYear += 31;
					break;
				case 4:
				case 6:
				case 9:
				case 11:
					nDaysToLastMonthOfThisYear += 30;
					break;
				case 2:
					if (isLeapYear(this.nYear))
					{ 
						nDaysToLastMonthOfThisYear += 29;
					} else {
						nDaysToLastMonthOfThisYear += 28;
					}
					break;
			}
		}
			
		// 윤년: 366일, 평년: 365일
		nDaysToLastYear = 365 * (this.nYear - 1) + nLeapCount;
		nWeekDayIndex = (nDaysToLastYear + nDaysToLastMonthOfThisYear + this.nDay) % 7;
		
		//확인(테스트)
//		System.out.println("nLeapCount : " + nLeapCount);
//		System.out.println("nDaysToLastYear : " + nDaysToLastYear);
//		System.out.println("nDaysToLastMonthOfThisYear : " + nDaysToLastMonthOfThisYear);
//		System.out.println("nWeekDayIndex : " + nWeekDayIndex);
		
		return arrWeekDay[nWeekDayIndex];
	}
	
	public void print(String strWeekDay)
	{
		// >> 2025년 5월 29일 → 목요일
		System.out.printf(">> %4d년 %2d월 %2d일 →  %3s\n", this.nYear, this.nMonth, this.nDay, strWeekDay);
	}
	
	public void printCalendar()
	{

		
		for (int i = 0; i < calendar.length; i++)
		{
			for (int j = 0; j < calendar[i].length; j++)
			{
				
			}
			
		}
	}
	
	public String toString()
	{
		String strObj = "인스턴스 데이터 → nYear : " +  nYear + " , nMonth : " + nMonth + " , nDay : " + nDay + " , isLeapYear : " + isLeapYear();
		return strObj;
	}
}


public class Test103
{
	public static void main(String[] args)
	{
		// 변수 선언
		String strWeekDay;
		
		// 객체 선언 및 초기화
		WeekDay obj = new WeekDay();
		
		// 연월일 입력
		obj.input();
		
		// 요일 정보 조회
		strWeekDay = obj.getWeekDay();
		
		// 조회 날짜에 대한 요일 출력
		obj.print(strWeekDay);
		//--실행결과
		//연 월 일 입력(공백 구분) : 2025 5 30
		//>> 2025년  5월 30일 →  금요일
		//계속하려면 아무 키나 누르십시오 . . .
		
		
		// 인스턴스 데이터 내역 조회
//		System.out.println(obj.toString());
		//--실행결과
		// 인스턴스 데이터 → nYear : 2025 , nMonth : 5 , nDay : 29 , isLeapYear : false
	}
}