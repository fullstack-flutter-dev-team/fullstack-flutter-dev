/*========================================================================
	■■■ 클래스 고급 ■■■
	- 인터페이스(Interface)의 다중 상속
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
interface ADemo
{
	public void write();
}

// 인터페이스
interface BDemo
{
	public void print();
}


// 클래스
//class DemoImpl
//
//class DemoImpl extends ADemo, BDemo	//-- (x)
//class DemoImpl implements ADemo, BDemo
//
// 추상 클래스 - 두 인터페이스(ADemo, BDemo)를 구현하는 추상 클래스
//abstract class DemoImpl implements ADemo, BDemo
//
// 클래스 - 두 인터페이스(ADemo, BDemo)를 구현하는 클래스(두 인터페이스의 모든 메서드 Overriding)
class DemoImpl implements ADemo, BDemo
{
	// JDk 1.5(5.0) 에서는 인터페이스 메서드를
	// 오버라이딩(Overriding)할 때
	// 『@Override』 어노테이션(annotation)을 사용할 수 없다.
	// JDK 1.6(6.0) 이후부터 적용 가능한 문법이다.
	// 단, 상속받은 클래스의 메서드를 오버라이딩(Overriding) 할 때는
	// JDk 1.5(5.0) 에서도 『@Override』어노테이션(annotation) 사용이 가능하다.
	@Override
	public void write()
	{
		System.out.println("ADemo 인터페이스 메서드 write()...");
	}
	
	@Override
	public void print()
	{
		System.out.println("BDemo 인터페이스 메서드 print()...");
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test122
{
	public static void main(String[] args)
	{
		//
		//ADemo ob1 = new ADemo();	//-- 인터페이스 → 인스턴스 생성 불가
		//BDemo ob1 = new BDemo();	//-- 인터페이스 → 인스턴스 생성 불가
		
		// ADemo, BDemo 인터페이스를 구현한 추상 클래스 → 인스턴스 생성 불가
		//DemoImpl obj = new DemoImpl();	//-- 추상 메서드를 포함하지 않는 추상클래스도 인스턴스 생성 불가
		
		
		// ADemo, BDemo 인터페이스를 구현한 클래스
		// (내부 모든 메서드 Overriding 완료 후)
		DemoImpl ob1 = new DemoImpl();
		
		ob1.write();
		//--==>> ADemo 인터페이스 메서드 write()...
		
		ob1.print();
		//--==>> BDemo 인터페이스 메서드 print()...
		
		//ADemo ob2 = new ADemo();	//-- (X)
		//BDemo ob3 = new BDemo();	//-- (X)
		
		// ○ 업 캐스팅
		ADemo ob2 = new DemoImpl();	//-- (O)
		BDemo ob3 = new DemoImpl();	//-- (O)
		
		//ob2.print();
		//--==>> 에러 발생(컴파일 에러)
		//	Test122.java:93: error: cannot find symbol
		
		//ob3.write();
		//--==>> 에러 발생(컴파일 에러)
		//	Test122.java:97: error: cannot find symbol
		
		((BDemo)ob2).print();
		//--==>> BDemo 인터페이스 메서드 print()...

		((ADemo)ob2).write();
		//--==>> ADemo 인터페이스 메서드 write()...
		
		// ※ DemoImpl 클래스가 두 인터페이스(ADemo, BDemo)를 모두 구현했기 때문에
		//		이와 같은 처리가 가능하다.
		//		만약, DemoImpl클래스가 두 인터페이스들 중 한 인터페이스만 구현했다면
		//		이 구문은 런타임 에러가 발생하는 구문이 된다.
		
		// ○ 다운 캐스팅
		((DemoImpl)ob3).write();
		//--==>> ADemo 인터페이스 메서드 write()...
	}
}

//ADemo 인터페이스 메서드 write()...
//BDemo 인터페이스 메서드 print()...
//BDemo 인터페이스 메서드 print()...
//ADemo 인터페이스 메서드 write()...
//ADemo 인터페이스 메서드 write()...