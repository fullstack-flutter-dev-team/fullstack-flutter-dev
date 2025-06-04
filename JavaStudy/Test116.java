/*========================================================================
	■■■ 클래스 고급 ■■■
	-  상속(Inheritance)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ㄷ

/* 

*/

/*
	『super』
	
	static 으로 선언되지 않는 메서드에서 사용되며
	현재 클래스가 상속받은 상위 클래스의 객체를 가리킨다.
	super 는 상위 클래스의 생성자를 호출하거나
	상위 클래스의 멤버 변수 또는 메서들을 호출할 때 사용할 수 있다.
	
	하위 클래스의 생성자에서 상위 클래스의 생성자를 호출할 때에는
	하위 클래스의 생성자 정의 구문에서 맨 처음에만 위치할 수 있다.
	
	※ 생성자와 클래스 상속간의 관계
	하위 클래스는 상위 클래스의 멤버를 상속받지만,
	생성자는 상속 대상에서 제외된다.
	그리고, 하위 클래스의 생성자가 호출될 때
	자동으로 상위 클래스의 생성자가 호출하게 된다.
	이 때, 상위 클래스의 생성자는 인수가 없는 생성자(default생성자 형태)가
	호출된다.
	
	만일, 상위 클래스에 인자가 있는 생성자만 존재하는 경우에는 주의해야 한다.
	---------------------------------------------------------------------------
	// 상위 클래스
	class Aclass
	{
		Aclass(int n) // 인자, 매개변수가 있는 생성자 정의
		{             //  (이때 디폴트 생성자는 자동생성 안된다.)
		
		}
	
	}
	-----------------------------------
	// 하위 클래스
	class Bclass extends Aclass
	{
		Bclass()
		{
			super(); // 에러 발생, 정의되지 않은 생성자를 호출하고 있다.
		}
	
	}
	
	---------------------------------------------------------------------------
	하위 클래스인 Bclass의 생성자에서 
	명시적으로 Aclass의 생성자를 호출하지 않으면
	자동으로 인자 없는 생성자를 호출한다.
	하지만, Aclass에는 인자가 있는 생성자만 존재하고 
	인자가 없는 생성자는 존재하지 않기 때문에 에러가 발생한다.
	따라서 Bclass생성자의 선두에 다음처럼 
	명시적으로 상위 클래스의 생성자를 호출하는 구문을 작성해야 한다.
	
	---------------------------------------------------------------------------
	// 상위 클래스
	class Aclass
	{
		Aclass(int n) // 인자, 매개변수가 있는 생성자 정의
		{             //  (이때 디폴트 생성자는 자동으로 삽입되지 않는다.)
		
		}
	
	}
	-----------------------------------
	// 하위 클래스
	class Bclass extends Aclass
	{
		Bclass()
		{
			super(10);	// 명시적으로 상위 클래스의 생성자 호출
						// (인자가 있는 생성자 호출)
		}
	
	}
	
	---------------------------------------------------------------------------
	
	※ 상위 생성자 super() 호출 위치
	하위 클래스의 생성자 내에서 상위 클래스의 생성자를 명시적으로 호출할 때에는
	하위 클래스 생성자 정의 block의 첫 줄에서만 super()를 호출할 수 있다. 
	
	※ 상속 시 주의할 사항
	상위 클래스에서 선언된 멤버 변수의 이를과
	하위 클래스에서 선언된 멤버 변수의 이름이 같으면
	상위 클래스의 멤버 변수는 무시된다.
	이 때, 상위 클래스의 멤버 변수를 사용하기 위해서는
	 『super』  키워드를 이용한다.
	
	동일한 이름의 멤버 변수나 동일한 이름의 메소드가
	한 클래스 안에 선언되거나 정의되는 경우 기본적으로 에러 발생한다.
	단, 메서드의 경우에는 매개 변수의 갯수나 타입이 다른 경우
	에러 발생하지 않고 이들을 서로 다른 메서드로 취급하는 문법이 지원된다.

/*
 ▣ 힌트: 
      ※ 
 
*/

import java.io.IOException;
import java.util.Scanner;


class SuperTest116
{
	protected double area;
	private String title;
	
	public SuperTest116()
	{
		System.out.println("SuperTest116... 인자 없는 생성자");
	}
	
	public SuperTest116(String title)
	{
		System.out.println("SuperTest116... 문자열을 인자로 받은 생성자");
	}
		
	public void write()
	{
		System.out.println(title + " - " + area);
	}
}


class Rect116 extends SuperTest116//, SuperTest115
{
	/*
	protected double area;
	
	// ※ private 멤버는 접근 자체가 불가능~!!! → 상속 불가
	//private String title;
	
	// ※ 생성자는 상속 대상에서 제외~!!!!
	//public SuperTest116()
	//{
	//	System.out.println("SuperTest116... 인자 없는 생성자");
	//}
	
	// ※ 생성자는 상속 대상에서 제외~!!!
	//public SuperTest116(String title)
	//{
	//	System.out.println("SuperTest116... 문자열을 인자로 받은 생성자");
	//}
		
	public void write()
	{
		System.out.println(title + " - " + area);
	}	
	
	*/
	private int w, h;
	
	public Rect116()
	{
		
	}
	
	public void calc(int w, int h)
	{
		this.w = w;
		this.h = h;
		area = (double)this.w * this.h;
		write();
	}
	
	public void write()
	{
		System.out.println("w : " + w + " , h : " + h);
		System.out.println("area : " + area);
	}
}


class Circle116 extends SuperTest116
{
	public Circle116(String title)
	{
		
	}
	
	public void calc(int r)
	{
		area = r * r * 3.141592;
		write();
	}
}

public class Test116
{
	public static void main(String[] args)
	{
		// Rect116 클래스 기반 인스턴스 생성
		Rect116 ob1 = new Rect116();
	}
}