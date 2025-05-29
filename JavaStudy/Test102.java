/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
	-  정보 은닉과 접근제어 지시자
	    (접근 지시자, 접근 제어자, 접근 지정자, 접근 제한자
		   → 접근 제어와 관련한 예약어)
=========→==========================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛

/* 

*/

/* 

*/

/*
 ▣ 힌트:
    
*/

import java.util.Scanner;
import java.util.Random;

class CircleTest2
{
	// CircteTest2의 멤버 변수, 인스턴스 변수, 전역 변수(global 변수)
	//int num;
	//   ↓
	// ※ 정보 은닉(Information Hiding)
	//    인스턴스 변수의 『private』 이라는 접근 지시자의 선언
	//    클래스 내부에서만 접근 및 참조가 가능하도록 하겠다는 의미
	//      →  클래스 내부의 메서드에서만 접근이 가능
	private int num;
	
	// RMI(원격객체 통신) - PDA
	// getter / setter 구성
	public int getNum()
	{
		//return num;
		return this.num;
	}
	
	public void setNum(int num)
	{
		//CircleTest2.num = num;  / static에서 선점
		this.num = num;
	}
	
	void input()
	{
		Scanner sc  = new Scanner(System.in);
		
		System.out.print("반지름 입력 : ");
		//num = sc.nextInt();
		this.num = sc.nextInt();
	}
	
	double calArea()
	{
		return num*num*3.141592;
	}
	
	
	void write(double area)
	{
		System.out.println("반지름 : " + num);
		System.out.println("넓이   : " + area);
	}
}


public class Test102
{
	public static void main(String[] args)
	{
		// CircleTest2 인스턴스 생성
		CircleTest2 ob1 = new CircleTest2();
		
		// ※ num 을 『private』 으로 선언하면 컴파일 에러 발생
		//ob1.num = 10000;  // 접근 가능
		//System.out.println("원의 반지름 num 확인 : " + ob1.num);
		
		// ※ 현재로써는 유일하게
		//     CircleTest2 의 num 에 데이터를 전달할 수 있는 방법
		ob1.input();
		//--==>> 반지름 입력 : 250
		//              → 『ob1.num = 250;』
		
		double result = ob1.calArea();
		
		ob1.write(result);
		//--실행 결과
		//반지름 입력 : 250
		//반지름 : 250
		//넓이   : 196349.5
		//계속하려면 아무 키나 누르십시오 . . .
		
	}
}