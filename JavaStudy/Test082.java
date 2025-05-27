/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
	-  생성자(Constructor) 초기화 블럭(Initialized Block) ★★★
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ /* */

/* 


*/

public class Test082
{
	// 수행할 수 없음
	/*
	int n;
	int m;
	
	n = 100;
	m = 200;
	*/
	
	// 수행할 수 있음
	/*
	int n = 100;
	int m = 200;
	*/
	
	// 수행할 수 있음
	int n;
	int m;
	
	
	Test082()
	{
		System.out.println("생성자 실행...");
	}
	
	// ★초기화 불럭(Initialized Block) - 위치와 상관없이 가장 먼저 실행됨
	{
		n = 100;
		m = 200;
		System.out.println("초기화 블럭 실행...");
	}
	
	// 생성자 
	Test082(int n, int m)
	{
		this.n = n;
		this.m = m;
		System.out.println("생성자 실행...");
	}
	
	
	// 멤버 확인용 출력 메서드 정의
	void write()
	{
		System.out.println("n : " + n + " , m = " + m);
	}
	
	
	public static void main(String[] args)
	{
		Test082 ob1 = new Test082();
		//-- 실행결과
		//초기화 블럭 실행...
		//생성자 실행...
		
		ob1.write();
		//--실행결과
		//초기화 블럭 실행...
		//생성자 실행...
		//n : 100 , m = 200
		
		Test082 ob2 = new Test082(120, 2500);
		
		//-- 실행결과
		//초기화 블럭 실행...
		//생성자 실행...
		
		ob2.write();
		//--실행결과
		//n : 120 , m = 2500
		
	}
}