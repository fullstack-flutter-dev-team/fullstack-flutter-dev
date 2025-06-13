/*========================================================================
	■■■ 컬렉션 프레임워크(Collection Framework) ■■■
	-  
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


/// @see [Class Stack<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Stack.html) 

/*

  ○ 컬렉션 프레임워크(Collection Framework)
     = 컬렉션(Collection) + 프레임워크(Framework)
        ---------------     --------------------- 
              |                환경, 틀, 약속,
              |
            집합 → 수집품, 소장품, (물건, 사람들의) 무리, 더리, 수집, 수거
                    -------------------------------------------------------      
                               모아놓은 것들.......모여있는 것들....
 
       ==> 자료구조
 
  ○ 자료(Data) ≠ 정보(Information, 자료를 기반으로 분석한 결과물??)
     현실 세계로부터 단순한 관찰이나 측정을 통해 수집된
     사실이나 개념의 값들 또는 그 값들의 집합.
      ↓
  ○ 자료구조
     자료 처리를 위한 자료의 표현, 저장, 관계, 관리 및
     이용에 관한 방법 등의 개념을 이해하여 프로그램에 사용하고
     컴퓨터에 의해 처리되는 과정에서 적절한 자료의 표현, 구성, 저장 및
     처리를 위한 알고리즘 작성 및 선택과 이용 방법을 연구하는 분야.
      ↓
   ○ 컬렉션 프레임워크
      컬렉션(모아놓은 데이터들)의 표현과 조작을 위한 통일된 아키텍처로
      컬렉션 프레임워크를 구성하는 요소는 다음과 같다.
        1. 인터페이스(Interface)
           기본적으로 컬렉션에 필요한 데이터 관리 기능을 제공한다.
           예를 들어, List는 추가, 삭제, 검색 등의 기능을 제공하는
           컬렉션 인터페이스가 존재하며
           각 컬렉션마다 고유의 인터페이스가 정의되어 있다.
           
        2.구현(Implementation)
           인터페이스를 구현한 클래스로 각 컬렉션을
           실제 어떤 자료구조를 이용하여 표현했느냐에 따라
           컬렉션의 종류가 달지게 된다.
           
        3.알고리즘(Algorithms)
           각 컬렉션들마다 유용하게 사용될 수 있는 메서드를 의미한다.
           
   ※ 자바의 컬렉션은 견고한 컬렉션 프레임워크 기반 위에 정의되어 있으므로  
      각 컬렉션 종류마다 제공되는 메서드의 일관성이 있기 때문에
      한 가지 컬렉션을 익혀두면 다른 컬렉션을 사용하는데 용이하다.
         
   ※ 컬렉션에는 유사한 기능을 가지는 메서들이 다수 존재(ex. add(), push())   
         
*/


/*

java.lang.Object
  ㄴjava.util.AbstractCollection<E>
       ㄴjava.util.AbstractList<E>
            ㄴjava.util.Vector<E>
                ㄴjava.util.Stack<E>

    ○ 스택(Stack)
       Stack 클래스는 오브젝트 후입선출(LIFO, Last In First Out) 구조의 Stack 을 나타낸다. 
       이는, 벡텨(Vector)를 스택으로 처리하는 5개의 메서드로
       벡터(Vector) 클래스를 확장하게 된다.
       
       통사의 push() 메서드와 pop() 메더드가 제공되는 것 외에
       스택의 선두 항목으로 peek() 을 실시하는 메서드,
       스택으로 항목을 찾아서 선두로부터 몇 번째인지를 찾아내는 메서드 등이 제공된다.
       
       스택이 처음으로 작성되었을 때, 항목은 존재하지 않는다.
       
       - boolean empty()
          스택이 비어있는지 확인한다.
       - E peek()
          스택의 맨 위의 객체를 스택에서 제거하지 않고 반환한다.
       - E pop()
          스택의 맨 위의 객체를 반환하고 스택에서 제거한다.
       - E push(E item)
          객체를 스택 자료구조에 저장한다.
       - int search(Object o)
          스택의 맨 위에서부터 파라미터 값으로 넘겨받은 객체까지의 거리를 반환한다.
           맨 위의 객체의 경우 1을 반환하고 그 아래 객체는 2를 반환하는 형식.
*/

/*
    제네릭, 제네릭 표현식 
*/



// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Stack;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test160  // extends Object
{
	
	public static void main(String[] args)
	{
		// 배열은 동일한 자료형만 저장, 컬렉션은 다양한 자료형을 저장
		// Stack 자료구조 생성
		//Stack<String> myStack = new Stack<String>();
		//Stack<Integer> myStack = new Stack<Integer>();
		Stack<Object> myStack = new Stack<Object>();
		
		String value;
		String str1 = "김한국-1";
		String str2 = "김한국-2";
		String str3 = "김한국-3";
		String str4 = "김한국-4";
		
		// myStack 이라는 Stack 자료구조 안에 str1~str4 까지 담아내기
		// 컬렉션에는 동일한 기능을 가지는 메서드들이 존재한다.
		// add(), push()
		myStack.add(str1); // 업캐스팅 발생
		myStack.add(str2); // 업캐스팅 발생
		myStack.push(str3);
		myStack.push(str4);
		
		// peek() : 스택 맨 위의 객체 반환, 제거하지 않는다.
		String val1 = (String)myStack.peek(); // 마지막 추가된 요소 반환
		//String val1 = myStack.peek(); // 컴파일 에러 발생
		System.out.println("val1 : " + val1);
		String val2 = (String)myStack.peek(); // 마지막 추가된 요소 반환
		System.out.println("val2 : " + val2);
		String val3 = (String)myStack.peek(); // 마지막 추가된 요소 반환
		System.out.println("val3 : " + val3);
		//--
		//val1 : 김한국-4
		//val2 : 김한국-4
		//val3 : 김한국-4
		
		System.out.println("------------------------------");
		
		// myStack 이라는 이름을 가진 Stack 자료구조에
		// 데이터가 비어있는 상태라면...
		// → myStack.isEmpty()
		
		
		// myStack 이라는 이름을 가지 Stack 자료구조에
		// 데이터가 비어있는 상태가 아니라면...(즉, 무언가 채워져 있는 상태라면...)
		// → !myStack.isEmpty()
		
		// myStack에 값이 들어 있다면..    //  1 2 3  ④ →  1 2 ③ →  1 ②  →  ①   → 
		while (!myStack.isEmpty()) // !false → true   →   true →  true → true → false  
		{
			// pop() : 스택 맨 위의 객체 반환. 제거한다.
			value = (String)myStack.pop(); //  ④ → ③ → ② → ①
			System.out.println("value : " + value);
		}
		
		
	}
}


-- 실행 결과
/*
value : 김한국-4
value : 김한국-3
value : 김한국-2
value : 김한국-1     
*/
