/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  Enumeration 과 Iterator 인터페이스
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Interface Enumeration<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Enumeration.html)
/// @see [hasMoreElements()](https://docs.oracle.com/javase/8/docs/api/java/util/Enumeration.html#hasMoreElements--)
/// @see [nextElement()](https://docs.oracle.com/javase/8/docs/api/java/util/Enumeration.html#nextElement--)
 
/// @see [Interface Iterator<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html)
/// @see [hasNext()](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#hasNext--)
/// @see [next()](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#next--)
/// @see [remove()](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#remove--)

/*
 
java.util
    ㄴInterface Enumeration<E>
 
java.util
    ㄴInterface Iterator<E>
 
 
     ○ Enumeration 과 Iterator 인터페이스
        Collection Framework 에는
        Enumeration 과 Iterator 라는 인터페이스가 있다.
        사전적인 의미로는 반복, 순환 이라는 의미를 가지고 있으며
        어떤 객체들의 모임이 있을 때,
        이 객체들을 특정 순서에 의해 하나씩 접근하여 사용하기 위한
        인터페이스라고 할 수 있다.
        
        ※ 자료구조에 따라서 Enumeration, Iterator 에 종속적인 경우가 있으므로,
            모두 알고 있어야 한다.
        
        - java.util.Enumeration<E> 인터페이스
          : 이 인터페이스는 단지 두 개의 메서드만을 제공하며
            『hasMoreElements()』 메서드를 통해
            인터페이스 안에 다음 요소가 있는지에 대한 질의를 수행한다.
            true가 반환되었다면 다음 인덱스에 요소가 존재한다는 의미이며,
            『nextElement()』메서드로 다음 요소를 꺼내어 사용하면 되는 것이다.
        
        - java.util.Iterator<E> 인터페이스
          : Enumeration 과의 차이점은 단지 『remove()』 메서드가 추가된 것 뿐이다.
            Iterator가 가지고 있는 『hasNext()』와 『next()』메서드는
            이름만 약간 다를 뿐 Enumeration 인터페이스가 가지고 있는
            『hssMoreElements()』 & 『nextElement()』와
            정확히 일치하는 기능을 수행한다.
            Iterator 는 JDK 1.2부터 추가로 지원되었다.
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Vector;
import java.util.Enumeration;
import java.util.Iterator;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test170  // extends Object
{
	
	public static void main(String[] args)
	{
		// 벡터 자료구조 v 인스턴스 생성
		Vector<String> v = new Vector<String>();
		
		// 벡터 자료구조 v에 요소 추가
		v.add("Java");
		v.add("Oracle");
		v.add("Jsp");
		v.add("Servlet");
		v.add("Spring");
		
		// ① Enumeration
		//     - hasMoreElements()
		//     - nextElement()
		Enumeration<String> e = v.elements();
		while (e.hasMoreElements())
		{
			System.out.println(e.nextElement());
		}
		System.out.println();
		//-- 실행 결과
		//Java
		//Oracle
		//Jsp
		//Servlet
		//Spring
		
		System.out.println("---------------------");
		//-- 실행 결과
		// ② Iterator
		//  - hasNext()
		//  - next()
		Iterator<String> it  = v.iterator();
		while (it.hasNext())
		{
			System.out.println(it.next());
		}
		System.out.println();
		//-- 실행 결과
		//Java
		//Oracle
		//Jsp
		//Servlet
		//Spring
		
	}
	
	
	
}