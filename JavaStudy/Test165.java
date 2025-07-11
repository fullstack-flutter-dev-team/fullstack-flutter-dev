/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  벡터(Vector)
	-  Interface Iterator<E>
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class Vector<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html) 
/// @see [Interface Iterator<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html) 

/*
---------------------------------------
java.lang.Object
  ㄴjava.util.AbstractCollection<E>
     ㄴjava.util.AbstractList<E>
        ㄴjava.util.Vector<E>


java.util
  ㄴInterface Iterator<E>

---------------------------------------

Vector v = new Vector();
 → 비어있는 Vector 자료구조 v 생성

Vector v = new Vector(8);
 → 8 개의 초기 element를 가진 Vector자료구조 v 생성
    이 자료구조를 활용하는 과정에서
    8개가 모두 채워지게 되면(모자라게 되면) 자동으로 확장된다.
   
Vector v = new Vector(3, 5);
 → 3 개의 초기 element를 가진 Vector자료구조 v 생성
    이 자료구조를 활용하는 과정에서 
    3개가 모두 채워지게 되면(모자라게 되면) 자동으로 5개 증가(확장)된다.
   
   
※ 벡터는 데이터 요소로서 정수형, 실수형, 문자열...등을
   담아내는 것이 가능하다. (→ 가능해졌다.)
   → 데이터 안정성 확보 check~!!!
   
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Vector;
import java.util.Iterator;


// MyVector 클래스 설계 → Vector 클래스 상속
class MyVector extends Vector<Object>
{
	// 생성자 → 사용자 정의 생성자
	MyVector()
	{
		// Vector(슈퍼 클래스) 생성자 호출
		// super()
		// → Vector();
		super(1, 1);
		// → Vector(1, 1);
		//-- 첫 번째 인자 : 주어진 용량(기본 size)
		//   두 번째 인자 : 증가량(증가 size)
	}
	
	
	void addInt(int i)
	{
		// 요소 추가
		addElement(new Integer(i));
	}
	
	void addFloat(float f)
	{
		// 요소 추가
		addElement(new Float(f));
	}
	
	void addString(String s)
	{
		// 요소 추가
		//addElement(new String(s));
		addElement(s);
	}
	
	void addCharArray(char[] a)
	{
		// 요소 추가
		addElement(a);
	}
	
	void write()
	{
		//-- ① 
		/*
		Iterator<Object> it = this.iterator();
		
		while (it.hasNext())
		{
			System.out.println(it.next() + " ");
		}
		System.out.println();
		*/
		//-- 실행 결과
		//5 
		//3.14 
		//안녕하세요
		//[C@6d06d69c
		
		//-- ②
		/*
		Object o;
		int length = size();
		
		// 테스트(확인)
		System.out.println("벡터 요소 갯수 : " + length);
		//--==>> 벡터 요소 갯수 : 4
		
		for (int i = 0; i < length; i++)
		{
			o = elementAt(i);
			System.out.println(o);
		}
		*/
		//-- 실행 결과
		//5
		//3.14
		//안녕하세요
		//[C@6d06d69c
		
		//-- ③
		Object o;
		int length = size();
		
		// 테스트(확인)
		System.out.println("벡터 요소 갯수 : " + length);
		//--==>> 벡터 요소 갯수 : 4
		
		for (int i = 0; i < length; i++)
		{
			o = elementAt(i);
			//System.out.println(o);
			
			// ※ 『instanceof』 연산자 check~!!!
			//-- 처리해야 하는 대상의 객체 타입 확인
			
			// 각 요소별 접근 처리
			
			if (o instanceof char[])
			{
				//System.out.println("문자배열 : " + o);
				//System.out.println("문자배열 : " + o.toString());
				//--==>> 문자배열 : [C@6d06d69c
				
				// 문자 배열의 각 요소에 개별 접근
				/*
				for (char ch : (char[])o)
				{
					System.out.print(ch);
				}
				System.out.println();
				//--==>> study
				*/
				
				System.out.println("문자열 : " + String.copyValueOf((char[])o));
				//--==>> 문자열 : study
				
			} else if (o instanceof String) {
				System.out.println("문자열 : " + o);
			} else if (o instanceof Integer) {
				System.out.println("정수형 : " + o);
			} else if (o instanceof Float) {
				System.out.println("실수형 : " + o);
			} else {
				System.out.println("타입 확인 불가~!!!");
			}
			//--
			//정수형 : 5
			//실수형 : 3.14
			//문자열 : 안녕하세요
			//문자배열 : [C@6d06d69c
			
		}
		
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test165  // extends Object
{
	
	public static void main(String[] args)
	{
		// MyVector 인스턴스 생성
		MyVector v = new MyVector();
		
		// 주요 변수 선언 및 초기화
		int digit = 5;
		float real = 3.14F;
		String s = new String("안녕하세요");
		char[] letters = {'s', 't', 'u', 'd', 'y'};
		
		v.addInt(digit);      //-- 벡터 자료구조에 정수 저장
		v.addFloat(real);     //-- 벡터 자료구조에 실수 저장
		v.addString(s);    //-- 벡터 자료구조에 문자열 저장
		v.addCharArray(letters); //-- 벡터 자료구조에 문자 배열 저장
		
		
		// 벡터 요소 출력
		v.write();

		
	}
}