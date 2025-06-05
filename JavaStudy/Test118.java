/*========================================================================
	■■■ 클래스 고급 ■■■
	-  상속(Inheritance)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/* 

*/

/*
	※ 메서드 오버라이딩(Method Overriding)의 특징
		- 메서드 이름, 리턴타입, 파라미터 수나 타입이 완전히 일치해야 한다.
		- 반드시 상속 관계가 있어야 한다.
		- 재정의된 하위 클래스의 메서드 접근제어지시자는
			상위 클래스의 메서드 접근제어지시자보다 범우가 크거나 같아야 한다.
			예를 들어, 상위 클래스 메서드의 접근제어지시자가 『』 protected 인 경우
			하위 클래스가 이 메서드를 오버라이딩(Overriding)하는 경우
			접근제어시시자는 public 또는 protected 이어야 한다.
			『static』, 『final』 , 『private』  메서드는 오버라이딩(Overriding)할 수 없다.
				- 『static』 - 생성 시점이 달라서 오버라이딩 안 됨
		- Exception 추가가 불가능하다.
			즉, 상위 메서드가 가지고 있는 기존 예외 사항에
			새로운 Exception을 추가하는 것은 불가능하다는 것이다.
/*
 ▣ 힌트: 
      ※ 
 
*/


// 부모 클래스(상위 클래스,  super class)
class SuperTest118
{
	private int a = 5;
	protected int b = 10;
	public int c = 20;
	
	public void write()
	{
		System.out.println("Suter write() 메서드 : " + a + " : " + b + " : " + c);
	}
}

// 자식 클래스(하위 클래스, sub class)
class SubTest118 extends SuperTest118
{
	/*
	//private int a = 5;   // 상속 불가
	protected int b = 10;
	public int c = 20;
	
	public void write()
	{
		System.out.println("Suter write() 메서드 : " + a + " : " + b + " : " + c);
	}
	*/
	
	protected int b = 100;  //-- 가능
	
	public void print()
	{
		//System.out.println("Sub print() 메서드 : " + a + " : " + b + " : " + c);
		//--==>> 에러 발생(컴파일 에러)
		//-- 슈퍼 클래스에서 선언된 변수 a 에는 접근할 수 없다.
		//		→ private변수이기 때문에...
		System.out.println("Sub print() 메서드 : " + b + " : " + c);
		//--==>> Sub print() 메서드 : 100 : 20

		System.out.println("Sub print() 메서드 : " + b);
		//--==>> Sub print() 메서드 : 100
	
		System.out.println("Sub print() 메서드 : " + this.b); // this.b		→ SubTest118.b
		//-==>> Sub print() 메서드 : 100
		
		System.out.println("Sub print() 메서드 : " + super.b); // super.b	→ SuperTest118.b
		//--==>> Sub print() 메서드 : 10
		
		//-- 변수 b는 접근 방법에 따라 다른 b로 접근 및 출력이 이루어진다.
		//   슈퍼 클래스에서 선언된 b, 서브 클래스에서 선언된 b
		
		System.out.println("Sub print() 메서드 : " + c); // super.b	→ SuperTest118.b
		System.out.println("Sub print() 메서드 : " + this.c); // super.b	→ SuperTest118.b
		System.out.println("Sub print() 메서드 : " + super.c); // super.b	→ SuperTest118.b
		//---실행결과
		//Sub print() 메서드 : 20
		//Sub print() 메서드 : 20
		//Sub print() 메서드 : 20
		//-- 변수 c는 접근하는데 아무런 제약과 제한이 없다.
		//		슈퍼 클래스에서 선언된 c
		
	}//close print()
	
	@Override
	public void write()
	{
		//System.out.println("Suter write() 메서드 : " + a + " : " + b + " : " + c);
		//--==>> 에러 발생(컴파일 에러)
		//-- 슈퍼 클래스에서 선언된 변수 a 에는 접근할 수 없다.(print()메서드와 같은 상황...)
		//		→ private 변수이기 때문에...
		
		System.out.println("Sub write() 메서드 : " + b + " : " + c);
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test118
{
	public static void main(String[] args)
	{
		// 하위 클래스(SubTest118) 인스턴스 생성
		SubTest118 ob = new SubTest118();
		
		// 메서드 호출
		ob.print();
		//--==>> Sub print() 메서드 : 100 : 20
		
		//
		ob.write();
		//--==>> Suter write() 메서드 : 5 : 10 : 20
		
		// 하위 클래스(SubTest118)에서 재정의 후 호출
		//--==>> 에러 발생(컴파일 에러)
		//Test118.java:97: error: a has private access in SuperTest118
		//System.out.println("Sub write() 메서드 : " + a + " : " + b + " : " + c);
		
		// a 접근 구문을 제거한 후 호출
		//--==>> Sub write() 메서드 : 100 : 20

		System.out.println("-----------------------[구분선]");
		
		System.out.println(ob.b);
		//--==>> 100
		
		//System.out.println(((부모)ob).b);
		System.out.println(((SuperTest118)ob).b);
		//--==>> 10
		// 용어 → ※ 슈퍼 부름
		
		System.out.println(ob.c);
		//--==>> 20
		
		System.out.println(((SuperTest118)ob).c);
		//--==>> 20
		
		
		ob.write();
		//--==>> Sub write() 메서드 : 100 : 20
		
		
		//★★★★★★
		//().write();
		((SuperTest118)ob).write();
		//--==>> Sub write() 메서드 : 100 : 20
		
		// check~!!! ★★★
		// ※ 메서드와 변수를 꼭~!!! 구분하여 정리할 것~!!!
		
	}
}

