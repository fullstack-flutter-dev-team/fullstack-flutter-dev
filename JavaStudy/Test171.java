/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  Enumeration 과 Iterator 인터페이스
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

/*
java.util
    ㄴInterface Enumeration<E>
 
java.util
    ㄴInterface Iterator<E>

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


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.List;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test171  // extends Object
{
	
	public static void main(String[] args)
	{
		// List 자료구조 list 생성(List는 인터페이스)
		//List<String> list = new List<String>(); //-- 불가능
		//List<String> list = new LinkedList<String>();
		List<String> list = new ArrayList<String>(); //--LinkedList보다 더 많이 사용됨.
		
		list.add("서울");
		list.add("부산");
		list.add("인천");
		list.add("대구");
		list.add("광주");
		list.add("대전");
		list.add("울산");
		list.add("세종");
		
		// 출력 → 더미 확인
		System.out.println(list);
		//--==>> [서울, 부산, 인천, 대구, 광주, 대전, 울산, 세종]
		
		// 요소의 갯수 확인
		System.out.println("전체 갯수 : " + list.size());
		//--==>> 전체 갯수 : 8
		
		// 첫 번째 요소만 출력
		System.out.println("첫 번째 요소 : " + list.get(0));
		//--==>> 첫 번째 요소 : 서울
		
		// 마지막 요소만 출력
		System.out.println("마지막 요소 : " + list.get(list.size()-1));
		//--==>> 마지막 요소 : 세종
		
		// 처음 위치에 "한국" 추가
		list.add(0,"한국");
		
		// 출력 → 더미 확인
		System.out.println(list);
		//--==>> [한국, 서울, 부산, 인천, 대구, 광주, 대전, 울산, 세종]
		
		// 처음 위치의 데이터(요소)를 "대한민국"으로 변경
		list.set(0, "대한민국");
		
		// 출력 → 더미 확인
		System.out.println(list);
		//--==>> [대한민국, 서울, 부산, 인천, 대구, 광주, 대전, 울산, 세종]
		
		// 자료구조 내에서 "서울" 요소의 존재여부 확인
		if (list.contains("서울"))
		{
			System.out.println("서울이 존재합니다.");
		}
		System.out.println();
		//--==>> 서울이 존재합니다.
		
		
		// "서울"이 몇 번째 인덱스에 위치하는지 확인
		int n  = list.indexOf("서울");
		System.out.println("서울의 위치 : " + n);
		//--==>> 서울의 위치 : 1
		
		// "대한민국" 지우기
		//list.remove("대한민국");  //-- (O)
		list.remove(0);             //-- (O)
		
		
		// 출력 → 더미 확인
		System.out.println(list);
		//--==>> [서울, 부산, 인천, 대구, 광주, 대전, 울산, 세종]
		
		
		// list의 전체 요소 출력
		System.out.println("전체 출력");
		for (String str:list)
		{
			System.out.print(str + " ");
		}
		System.out.println();
		//--==>> 서울 부산 인천 대구 광주 대전 울산 세종 
		
		for (int idx = 0 ; idx < list.size(); idx++)
		{
			System.out.print(list.get(idx) + " ");
		}
		System.out.println();
		//--==>> 서울 부산 인천 대구 광주 대전 울산 세종 
		
		
		Iterator<String> it = list.iterator();
		while (it.hasNext())
		{
			System.out.print(it.next() + " ");
		}
		System.out.println();
		//--==>> 서울 부산 인천 대구 광주 대전 울산 세종 
		
	}
	
}