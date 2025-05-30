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
	
*/

/* 

*/

/*
 ▣ 힌트:
    - 1년 1월 1일 → "월요일"
    - 1년이 항상 265일은 아니다.
      º 2월의 마지막 날짜가 29일 → 윤년 (366일)
      º 2월의 마지막 날짜가 28일 → 평년 (365일)
      º 윤년의 판별 조건
         → 연도가 4의 배수이면서 100의 배수가 아니거나,
             400의 배수이면 윤년, 그 이외의 연도는 평년.
*/	  
	  

import java.util.Scanner;
import java.util.Random;


/*
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
	
	//1월: 31일
	//2월:28/29일
	//3월:31일
	//4월:30일
	//5월:31일
	//6월:30일
	//7월:31일
	//8월:31일
	//9월:30일
	//10월:31일
	//11월:30일
	//12월:31일
 
	
	public String getWeekDay()
	{
		
		
 		   //0     1    2    3    4    5    6    0    1   2    3    4    5  6   0    1    2    3    4     5    6   0   1    2    3    4    5     6     0    1   2    3    4   5
		   //      1    2    3    4    5    6    7    8   9   10   11   12  13  14   15   16   17    18   19   20  21  22   23   24   25   26    27    28   29  30   31   1  2
		   //------------------------------------
		   //0     1    2    3    4    5     6
		   //일   월    화   수  목   금    토
		   //      1    2    3   4     5     6
		   // 7    8    9   10  11    12    13
		   //14   15   16   17  18    19    20
		   //21   22   23   24  25    26    27
		   //28   29   30   31
		
		
		
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

*/


// ★ WeekDay 는  default package에 위치하고 있다.

class WeekDay
{
	// 속성 구성 → 주요 변수 선언
	private int y, m, d;    //-- 사용자가 입력한 연, 월, 일 값을 담아낼 변수(정보은닉-private)
	
	// 기능 구성 → 메소드 정의 : 연, 월, 일 입력받기
	public void input()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.print("연 월 일 입력(공백 구분) : ");    // 2025 5 30
		
		//-- check~!! 유효성 체크 로직 고려
		y = sc.nextInt();
		m = sc.nextInt();
		d = sc.nextInt();
		
		// ....
	}
	
	// 기능 구성  → 메서드 정의 : 요일 산출하기
	//public void week()
	public String week()
	{
		// 각 월의 마지막 날짜(각 월이 가지는 최대값)를 배열 행태로 구성
		// 2월에 해당하는 인덱스의 값은 0 으로 설정
		//int[] months = {31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		// 2월에 해당하는 인덱스의 값은 28 으로 설정
		int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		
		// 테스트(확인)
		//System.out.println(months.length);
		//--==>> 12
		
		// 각 요일의 이름을 배열 형태로 구성
		String[] weekNames = {"일", "월", "화", "수", "목", "금", "토"};
		
		// 날 수를 누적 연산할 변수
		int nalsu;
		
		// ① 윤년에 따른 2월의 날 수 계산
		//    사용자의 입력 연도가 윤년이라면...2월의 마지막 날짜를 29일로 구성
		//    사용자의 입력 연도가 평년이라면...2월의 마지막 날짜를 28일로 구성
		if (y % 4 == 0 && y % 100 != 0 || y % 400 ==0)  //-- 사용자의 입력 연도가 윤년이라면
		{
			// 2 월의 마지막 날짜를 29일로 구성
			months[1]=  29;
		} 
		else {                                        //-- 사용자의 입력 연도가 평년이라면
			// 2 월의 마지막 날짜를 28일로 구성
			months[1]=  28;
			
		}
		
		// 1년 1월 1일 부터... 입력 연도의 이전 연도 12월 31일 까지의 날 수 계산
		nalsu = (y - 1) * 365 + (y - 1) / 4  - (y - 1) / 100  + (y - 1) / 400;
		//      --------------
		//       1년 기본 주기  -----------
		//                      4년마다 + 1   --------------
		//                                    100년마다 +1(x)   --------------
		//                                                       400년 마다 +1
		// 테스트(확인)
		//System.out.println("연산 결과 : " + nalsu);
		//--실행결과
		//            연산 결과 : 739251
		//                       -------
		//                       → 1년 1월 1일 ~ 2024년 12월 31일 까지의 날 수
		
		
		// ② 입력받은 월의 이전 월 까지의 날 수 계산 후
		//     이 결과를 ①번 결과에 더하는 연산(누적합)
		for (int i = 0; i < (m-1); i++)
		{
			nalsu += months[i];
		}
		
		// 테스트(확인)
		//System.out.println("연산 결과 : " + nalsu);
		//--실행결과
		//연 월 일 입력(공백 구분) : 2025 5 30
		//연산 결과 : 739371
		//           ---------      →1년 1월 1일 ~  2025년 4월 30일까지의 날 수
		
		
		// ③ 입력받은 일의 날짜만큼 날 수 계산 후
		//    이 결과를 2번 결과에 더하는 연산(누적합)
		nalsu += d;
		// 테스트(확인)
		//System.out.println("연산 결과 : " + nalsu);
		//--실행결과
		//연 월 일 입력(공백 구분) : 2025 5 30
		//연산 결과 : 739371
		//           ---------    →   1년 1월 1일 ~  2025년 5월 30일까지의 날 수
		
		//--------------------------- 여기까지 수행하면 전체 날 수 연산 끝~!!!
		
		// 얻어낸 날 수를 기반으로 무슨 요일인지 확인한기 위한 연산
		int w = nalsu % 7;
		//-- 전체날수 % 7 == 0  →  일요일
		//-- 전체날수 % 7 == 1  →  월요일
		//-- 전체날수 % 7 == 2  →  화요일
		
				// 테스트(확인)
		//System.out.println("w : " + w);
		//--실행결과
		//연 월 일 입력(공백 구분) : 2025 5 30
		//w : 5
		//   ---  → (전체날수 % 7) == 5  → 금요일
		
		// 최종 결과값 반환
		return weekNames[w];
		//return weekNames[5];
		//return "금";
	}
	
	// 기능 구성 → 메서드 정의 : 결과 출력하기
	public void print(String day)
	{
		// >> 2025년 5월 29일 →  목요일
		System.out.printf(">> %d년 %d월 %d일 → %s요일\n", y, m, d, day);
	}
}

public class Test103
{
	public static void main(String[] args)
	{
		// 테스트
		//WeekDay ob = new WeekDay();
		//ob.input();
		//ob.week();
		//--실행결과-1
		//--==>> 12
		
		//--실행결과-2
		//연 월 일 입력(공백 구분) : 2025 5 30
		//연산 결과 : 739251
		//계속하려면 아무 키나 누르십시오 . . .
		
		
		// WeekDay 클래스 인스턴스 생성
		WeekDay ob = new WeekDay();
		
		// 엽력 메서드 호출
		ob.input();
		
		// 요일 산출 메서드 호출
		//ob.week();
		String result = ob.week();
		
		// 최종 결과 출력 메서드 호출
		ob.print(result);
	}
}
//--실행결과
//연 월 일 입력(공백 구분) : 2025 5 29
//>> 2025년 5월 29일 → 목요일
//계속하려면 아무 키나 누르십시오 . . .