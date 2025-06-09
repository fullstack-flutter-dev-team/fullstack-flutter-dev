/*========================================================================
	■■■ 클래스 고급 ■■■
	- 인터페이스(Interface) 간의 상속
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/* 
	○ 
*/

 
/*
 ▣ 힌트: 
      ※ 
 
*/

// 인터페이스
interface Demo
{
	public void write();
	public void print();
}

// 클래스
//class DemoImpl
//
// 추상 클래스 - 인터페이스(Demo)를 구현하는 추상 클래스
abstract class DemoImpl implements Demo
{
	@Override
	public void write()
	{
		System.out.println("write() 메서드 재정의...");
	}
	
	// public abstract void print();
}

// 클래스
//class DemoImplSub
//
// 추상 클래스 - 추상 클래스(DemoImpl)를 상속받는 추상 클래스
//abstract class DemoImplSub extends DemoImpl
//
// 클래스 - 추상 클래스(DemoImpl)를 상속받는 클래스
class DemoImplSub extends DemoImpl
{
	/*
	@Override
	public void write()
	{
		System.out.println("write() 메서드 재정의...");
	}
	
	// public abstract void print();
	*/
	
	@Override
	public void print()
	{
		System.out.println("print() 메서드 재정의...");
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test123
{
	public static void main(String[] args)
	{
		//Demo ob1 = new Demo();
		//-- 인스턴스 생성 불가  → 인터페이스
		
		//DemoImple ob2 = new DemoImpl();
		//-- 인스턴스 생성 불가  → 인터페이스
		
		DemoImplSub ob3 = new DemoImplSub();
		
		ob3.write();
		//--==>> write() 메서드 재정의...
		
		ob3.print();
		//--==>> print() 메서드 재정의...
	}
}

//-- 실행 결과
//write() 메서드 재정의...
//print() 메서드 재정의...