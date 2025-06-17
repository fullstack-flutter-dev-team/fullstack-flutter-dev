/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  ArrayList 클래스
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class ArrayList<E>](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html)
/// @see [Class LinkedList<E>](https://docs.oracle.com/javase/8/docs/api/java/util/LinkedList.html)

/// @see [Interface Enumeration<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Enumeration.html)
/// @see [hasMoreElements()](https://docs.oracle.com/javase/8/docs/api/java/util/Enumeration.html#hasMoreElements--)
/// @see [nextElement()](https://docs.oracle.com/javase/8/docs/api/java/util/Enumeration.html#nextElement--)
 
/// @see [Interface Iterator<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html)
/// @see [hasNext()](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#hasNext--)
/// @see [next()](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#next--)
/// @see [remove()](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#remove--)

/// @see [Class ArrayList<E>](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html)
/// @see [add(E e)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#add-E-)
/// @see [add(int index, E element)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#add-int-E-)
/// @see [clear()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#clear--)
/// @see [clone()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#clone--)
/// @see [get(int index)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#get-int-)
/// @see [isEmpty()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#isEmpty--)
/// @see []()
/// @see []()
/// @see [addAll(Collection<? extends E> c)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#addAll-java.util.Collection-)
/// @see [contains(Object o)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#contains-java.lang.Object-)
/// @see [indexOf(Object o)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#indexOf-java.lang.Object-)
/// @see [iterator()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#iterator--)
/// @see [lastIndexOf(Object o)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#lastIndexOf-java.lang.Object-)
/// @see [listIterator()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#listIterator--)
/// @see [listIterator(int index)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#listIterator-int-)
/// @see [remove(int index)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#remove-int-)
/// @see [remove(Object o)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#remove-java.lang.Object-)
/// @see [trimToSize()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#trimToSize--)
/// @see []()

/// @see [Interface List<E>](https://docs.oracle.com/javase/8/docs/api/java/util/List.html)
/// @see []()
/// @see []()

/// @see [Interface ListIterator<E>](https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html)
/// @see [add(E e)](https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html#add-E-)
/// @see [hasNext()](https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html#hasNext--)
/// @see [next()](https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html#next--)
/// @see [hasPrevious()](https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html#hasPrevious--)
/// @see [previous()](https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html#previous--)
/// @see [previousIndex()](https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html#previousIndex--)
/// @see [remove()](https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html#remove--)
/// @see [set(E e)](https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html#set-E-)

/*
java.util
    ㄴInterface Enumeration<E>
 
java.util
    ㄴInterface Iterator<E>

java.util
    ㄴInterface ListIterator<E>

java.util
  ㄴInterface List<E>

java.lang.Object
  ㄴjava.util.AbstractCollection<E>
      ㄴjava.util.AbstractList<E>
          ㄴjava.util.ArrayList<E>

java.lang.Object
  ㄴjava.util.AbstractCollection<E>
     ㄴjava.util.AbstractList<E>
         ㄴjava.util.AbstractSequentialList<E>
             ㄴjava.util.LinkedList<E>

*/

/* 
    ○ List 인터페이스
      - 순서가 있음, 배열과 유사, 중복을 허용
      - 주요 구현 클래스
       º Vector(동기화 지원)
       º ArrayList(동기화 지원 안함)
       º LinkedList(체인, 링크, 결합, 큐)
      
         ※ ArrayList 보다 Vector가 먼저 구현 되었음.
         ※ ArrayList가 Vector보다 성능이 더 좋음.
         ※ LinkedList -  Linked~ 는 Queue와 더 관련성이 있음.
      
      동기화 : 멀티 쓰레드
      동시성 : ?
      
*/

/*
    ○ ArrayList 클래스
       - ArrayList 와 Vector 클래스는
         List를 크기 변경이 가능한 배열로 구현한 것으로
         차이점은, Vector 클래스의 객체는 기본적으로 동기화되지만,
         ArrayList는 그렇지 않다는 점이다.
       
       - 비동기화 컬렉션은 동기화 컬렉션보다 더 나은 성능을 제공하며
         스레드들이 컬렉션을 공유하지 않는 프로그램에서는
         일반적으로 ArrayList를 Vector보다 더 선호하며,
         ArrayList는 동기화를 고려하지 않은 Vector처럼 동작함으로써
         스레드 동기화에 따르는 부담을 가지지 않기 때문에
         Vector 보다 더 빠르게 실행된다.
       
       - null 을 포함한 모든 요소를 허용하며
         List 인터페이스를 구현하는 것 외에 리스트에 격납하기 위해
         내부적으로 사용되는 배열의 사이즈를 조작하는 메서드를 제공한다.
*/

// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Vector;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test172  // extends Object
{
	
	public static void main(String[] args)
	{
		// List 자료구조 list1 생성
		//ArrayList<String> list1 = new ArrayList<String>();  //-- 가능
		//Vector<String> list1 = new Vector<String>();  //-- 가능
		//List<String> list1 = new Vector<String>();  //-- 가능
		List<String> list1 = new ArrayList<String>();  //-- 가능
		
		// list1 자료구조에 요소 추가
		// → add()
		list1.add("드레곤볼");
		list1.add("진격의거인");
		list1.add("던전밥");
		
		// List 자료구조 list2 생성
		//List<String> list2 = new List<String>();     //--(X), List는 인터페이스
		//List<String> list2 = new ArrayList<String>();  //--(O),
		List<String> list2 = new ArrayList<String>(list1);
		
		
		// 출력 → 더미 데이터 확인
		System.out.println("==========================================");
		System.out.println(list1);
		System.out.println(list2);
		System.out.println("==========================================");
		//-- 실행 결과
		/*
		  [드레곤볼, 진격의거인, 던전밥]
		  [드레곤볼, 진격의거인, 던전밥]    
		*/
		
		
		// list2 자료구조에 요소 추가
		// → add()
		list2.add("나루토");
		list2.add("원피스");
		
		
		// 출력 → 더미 데이터 확인
		System.out.println("==========================================");
		System.out.println(list1);
		System.out.println(list2);
		System.out.println("==========================================");
		//-- 실행 결과
		/*
		  [드레곤볼, 진격의거인, 던전밥]
		  [드레곤볼, 진격의거인, 던전밥, 나루토, 원피스] 
		*/

		// List 자료구조 list3 생성
		List<String> list3 = new ArrayList<String>();
		
		// list2 자료구조에 요소 추가 → list2의 전체 요소 추가
		//  → addAll()
		list3.addAll(list2);
		
		// 출력 → 더미 데이터 확인
		System.out.println("==========================================");
		System.out.println(list1);
		System.out.println(list2);
		System.out.println(list3);
		System.out.println("==========================================");
		//-- 실행 결과(new 키워드로 생성한 객체들 이므로 서로 독립적인 자료구조..)
		/*
		  [드레곤볼, 진격의거인, 던전밥]
		  [드레곤볼, 진격의거인, 던전밥, 나루토, 원피스]
		  [드레곤볼, 진격의거인, 던전밥, 나루토, 원피스]
		*/
		
		// ★★★★★
		// list3 자료구조의 "나루토" 앞에 "코난" 추가
		// [드레곤볼, 진격의거인, 던전밥, 나루토, 원피스]
		//  → [드레곤볼, 진격의거인, 던전밥, 코난, 나루토, 원피스]
		
		// ① "나루토" 찾기 → indexOf() → 위치 인덱스 반환
		int n = list3.indexOf("나루토");
		
		// 테스트(확인)
		//System.out.println("n : " + n);
		//--==>> n : 3
		
		// ② "나루토" 찾은 인덱스 위치에 "코난" 삽입
		//    →  add(위치, 요소)
		list3.add(n, "코난");
		
		// 출력 → 더미 데이터 확인
		System.out.println("==========================================");
		System.out.println(list1);
		System.out.println(list2);
		System.out.println(list3);
		System.out.println("==========================================");
		//-- 실행 결과
		/*
		  [드레곤볼, 진격의거인, 던전밥]
		  [드레곤볼, 진격의거인, 던전밥, 나루토, 원피스]
		  [드레곤볼, 진격의거인, 던전밥, 코난, 나루토, 원피스]
		*/
		
		
		// list3 출력 → ListIterator 를 활용하여 전체 출력
		ListIterator<String> li3 = list3.listIterator();
		
		System.out.println("ListIterator를 활용한 전체 출력...");
		while (li3.hasNext())
		{
			System.out.print(li3.next() + " ");
		}
		System.out.println();
		//-- 실행 결과
		/*
		  ListIterator를 활용한 전체 출력...
		  드레곤볼 진격의거인 던전밥 코난 나루토 원피스 
		*/
		
		
		// list3 출력 → ListIterator 를 활용하여 역순 출력
		System.out.println("ListIterator를 활용한 역순 출력...");
		while (li3.hasPrevious())
		{
			System.out.print(li3.previous() + " ");
		}
		System.out.println();
		//-- 실행 결과
		/*
		  ListIterator를 활용한 역순 출력...
		  원피스 나루토 코난 던전밥 진격의거인 드레곤볼 
		*/
		
	}
}