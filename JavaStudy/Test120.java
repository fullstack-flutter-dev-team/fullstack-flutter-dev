/*========================================================================
	■■■ 클래스 고급 ■■■
	- 상속 관계에 있는 클래스들 간의 캐스팅
		(업 캐스팅, 다운 캐스팅)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/* 
	○ 
*/

/*
 
/*
 ▣ 힌트: 
      ※ 
 
*/

// super class, 부모 클래스, 상위 클래스
class SuperTest120
{
	public int a = 10, b = 20;
	
	public void write()
	{
		System.out.println("슈퍼 클래스 write() 메서드...");
	}
	
	public int hap()
	{
		return a + b;
	}	
		
}

// sub class, 자식 클래스, 하위 클래스
class SubTest120 extends SuperTest120
{
	/*
	public int a = 10, b = 20;
	
	public void write()
	{
		System.out.println("슈퍼 클래스 write() 메서드...");
	}
	
	public int hap()
	{
		return a + b;
	}		
	
	*/
	
	public int b = 100, c = 200;
	
	public void print()
	{
		System.out.println("서브 클래스 print() 메서드...");
	}
	
	@Override
	public int hap()
	{
		return a + b + c;
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test120
{

	public static void main(String[] args)
	{
		// 하위 클래스(SubTest120) 기반 인스턴스 생성
		// 상위 클래스 정보도 메모리에 로딩된다.
		SubTest120 ob1 = new SubTest120();
		
		System.out.println("ob1.b : " + ob1.b);
		//--==>> ob1.b : 100
		
		System.out.println("ob1.a : " + ob1.a);
		//--==>> ob1.b : 100
		
		// ○ 업 캐스팅
		//SuperTest120 ob2; // 가능
		SuperTest120 ob2 = ob1; // 가능
		//-- 『SuperTest120 ob2 = (SuperTest120)ob1;』 와 동일한 코드
		System.out.println("ob1.b : " + ((SuperTest120)ob1).b);
		//-===> ob1.b : 20
		System.out.println("ob2.b : " + ob2.b);
		//-===> ob1.b : 20
		//-- 변수는 개체별로 따로 할당되기 때문에
		//	 변수 b는 ob2의 변수이다.
		
		// ★★★★★
		System.out.println("합 : " + ob2.hap());
		//--==>> 합 : 310
		//-- hap() 메서드는 오버라이딩(Overriding)되어 있고
		//    ob2 는 ob1을 업캐스팅한 상태의 객체이므로
		//    『SuperTest120』 의 hap()메서드를 호출하는 것이 아니라
		//    『SubTest120』에서 재정의한 hap() 메서드를 호출하게 된다.
		//    즉, 메서드는 업캐스팅이 되더라도
		//    재정의(덮어쓰기)한 이상....원래의 기능으로 되돌릴 수 없다.
		
		ob2.write();
		//--==>> 슈퍼 클래스 write() 메서드...
		
		
		/*
			상위클래스 obj = new 하위클래스();
			
			학생 주형이 = new 학생();
			포유류 사람 = 주형이;
			//-- 『포유류 사람 = (포유류)주형이;』 와 동일한 코드
			
			※ 학생은 포유류
			
			class 포유류
			{
			
			}
			
			class 학생 extends 포유류
			{
			
			}
		
		*/
		
		//ob2.print();
		//--==>> 에러 발생(컴파일 에러)
		//Test120.java:127: error: cannot find symbol
		//ob2.print();
		
		// ○ 다운 캐스팅
		((SubTest120)ob2).print();
		//--==>> 서브 클래스 print() 메서드...

		// ※ 추가 관찰 ---------------------------------------------
		
		// 상위 클래스(SuperTest120) 기반 인스턴스 생성
		// 하위 클래스 내용은 메모리에 로딩되지 않는다.
		SuperTest120 ob3 = new SuperTest120(); //-- 가능
		
		SubTest120 ob4;
		
		//System.out.println("ob3.c : " + ob3.c);
		//-- 에러 발생(컴파일 에러)
		//Test120.java:143: error: cannot find symbol
		//-- 상위 객체는 하위 객체의 멤버에 접근하는 것이 불가능하다.
		//    (사실 상위 객체 입장에서는 어떤 하위 객체가 존재하는지도 알 수 없음)
		
		
		//ob4 = ob3;
		//-- 에러 발생(컴파일 에러)
		//--==>> Test120.java:153: error: incompatible types: SuperTest120 cannot be converted to SubTest120
		//-- 상위 객체는 하위 객체에 담을 수(참조할 수) 없다.
		
		// 업 캐스팅
		ob4 = (SubTest120)ob3;
		//--==> 에러 발생(런타임 에러)
	}
	
}

/*

○ 업 캐스팅, 다운 캐스팅이 정상적으로 이루어지는 경우 ----------------------------------
	1. 하위 객체 생성;		// check~!!
	2. 상위 = 하위;			// 업 캐스팅, 정상
	3. 하위 = 상위;			// 에러 발생.
	4. 하위 = (하위)상위;	// 다운 캐스팅. 정상
	
○ 다운 캐스팅이 정상적으로 이루어지지 않는 경우 -----------------------------------
	1. 상위 객체 생성;		// check~!!!
	2. 하위 = 상위;			// 에러 발생.
	3. 하위 = (하위)상위;	// 다운 캐스팅. 런타임 에러 발생.
	
※ 업 캐스팅은 항상 가능. 다운 캐스팅은 경우에 따라 가능.

*/