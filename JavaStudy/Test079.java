/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
	-  생성자(Constructor)
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ /* */

/* 


*/

class NumberTest2
{
	// 주요 속성 구성
	int num;
	
	
	// 디폴트(default) 생성자 → 자동 삽입
	/*
	NumberTest2()
	{
	
	}
	*/
	
	//※ 이번 경우는
	//	사용자 정의 생성자가 정의되어 있으므로
	//	『default』 생성자가 자동으로 삽입되지 않는다.
	
	//생성자(→ 사용자 정의 생성자)
	NumberTest2(int n)
	{
		num = n;
		System.out.println("생성자 호출시 매개변수 전달 : " + n);
	}
	
	int getNum()
	{
		return num;
	}
}

public class Test079
{
	public static void main(String[] args)
	{
		// NumberTest2 기반 인스턴스 생성
		//NumberTest2 ob = new NumberTest2();
		//--==>> 에러 발생(컴파일 에러)
		//-- NumberTest2 클래스에는
		//	사용자 정의 생성자가 존재하고 있는 상황이기 때문에
		//	default 생성자 가 자동으로 삽입되지 않으며
		//	사용자 정의 생성자는 매개변수를 갖는 형태이기 때문에
		//	위(line 47) 와 같이 매개변수 없는 생성자를 호출하는 형태의
		//	인스턴스 생성 구문은 문제를 발생시키게 된다.
		
		//NuberTest2 기반 인스턴스 생성
		NumberTest2 ob1 = new NumberTest2(10);
		//--==>>생성자 호출시 매개변수 전달 : 10
		
		//ob1 객체가 갖고있는 num 속성에 접근
		System.out.println("ob1.num : " + ob1.num);
		//--==>>ob1.num : 10
		
		//ob1  객체가 갖고있는 getNum() 메소드 호출
		System.out.println("ob1.getNum() : " + ob1.getNum());
		//ob1.getNum() : 10
		
		// NumberTest2 기반 인스턴스 생성
		NumberTest2 ob2 = new NumberTest2(256);
		//--==>> 생성자 호출시 매개변수 전달 : 256
		
		//ob2 객체가 갖고있는 num 속성 확인
		System.out.println("ob2.num : " + ob2.num);
		System.out.println("ob2.getNum() : " + ob2.getNum());
		//ob2.num : 256
		//ob2.getNum() : 256
	}
}

//--
/*
생성자 호출시 매개변수 전달 : 10
ob1.num : 10
ob1.getNum() : 10
생성자 호출시 매개변수 전달 : 256
ob2.num : 256
ob2.getNum() : 256
계속하려면 아무 키나 누르십시오 . . .
*/