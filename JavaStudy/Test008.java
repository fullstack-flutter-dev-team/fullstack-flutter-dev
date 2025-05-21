/*===================================================================
	■■■ 변수와 자료형 ■■■
	- 변수와 자료형 실습 및 테스트 : char ( 2-바이트 문자형)
===================================================================*/
public class Test008
{
	public static void main(String[] args)
	{
		// 주요 변수 선언
		char ch1, ch2, ch3; // 2-byte 문자형
		
		int a; //-- check~!!!
		
		
		// 연산 및 처리(대입 연산)
		ch1 = 'A';
		//ch2 = 'a';
		//ch2 = 'abcd';
		ch2 = '\n'; //--개행 문자
		//ch3 = 'B';
		ch3 = '대'; //--정상 동작
		
		//a = ch1;	//-- 자동 형 변환
		a = (int)ch1;//-- check~ !!!
		//-- 명시적 형 변환(강제 형 변환)
		
		
		// 결과 출력
		System.out.println("ch1 : " + ch1);
		System.out.println("ch2 : " + ch2);
		System.out.println("ch3 : " + ch3);
		
		System.out.println("a : " + a);
		//→ a : 65
		
		
		//System.out.printf("○ ○ ○ ○\n", ch1, ch2, ch3, a);
		System.out.printf("%c %c %c %d %c\n", ch1, ch2, ch3, a, a);
		
		// 실행 결과
		/*
			ch1 : A
			ch2 : 

			ch3 : 대
			a : 65
			A 
			 대 65 A
		*/
		
	}
}