/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
===================================================================*/

//	※ CircleTest.java 파일과 한묶음~!!!

/*

*/

//import default;

//import a.b.CircleTest;

import java.io.IOException;

public class Test075
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언
		CircleTest ob = new CircleTest();
		double area, length;
		
		//원의 반지름 입력
		ob.input();
		
		//원의 넓이
		area = ob.calArea();
		
		//원의 둘레길이
		length = ob.calLength();
		
		//원의 반지름, 넓이, 둘레 길이 값 출력
		ob.print(area, length);
		*/
		
		//CircleTest 클래스(설계도) 기반 인스턴스(객체) 생성
		CircleTest ob = new CircleTest();
		/*
		CircleTest ob = new CircleTest;
								+
							CircleTest()
		*/
		
		//반지름 입력
		ob.input();
		
		double num1 = ob.calArea();
		double num2 = ob.calLength();
		
		ob.print(num1, num2);
	}
}

///실행 결과
/*
반지름 입력 : 200

>>반지름이 200 인 원의
>> 넓이 : 125663.68
>> 둘레 : 1256.64
계속하려면 아무 키나 누르십시오 . . .


*/