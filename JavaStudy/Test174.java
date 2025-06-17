/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  Set → ★HashSet, TreeSet
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Interface Set<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Set.html)
/// @see [Class HashSet<E>](https://docs.oracle.com/javase/8/docs/api/java/util/HashSet.html)

/// @see [Interface Set<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Set.html)
/// @see []()
/// @see []()
/// @see []()
/// @see [Class HashSet<E>](https://docs.oracle.com/javase/8/docs/api/java/util/HashSet.html)
/// @see []()
/// @see []()
/// @see []()


/*

java.util
  ㄴInterface Set<E>

java.lang.Object
  ㄴjava.util.AbstractCollection<E>
      ㄴjava.util.AbstractSet<E>
          ㄴjava.util.HashSet<E>

*/

/*
 
    Set → HashSet, TreeSet
    - 순서 없음
    - 중복을 허용하지 않는 구조(기본)
*/

/*
     ○ HashSet<E> 클래스
       java.util.HashSet<E> 클래스는
       Set 인터페이스를 구현하는 클래스로
       순서의 개념이 아니라 집합의 개념으로 이해해야 하는 자료구조이다.
       이로 인해 데이터의 중복을 허용하지 않는다.
       또한, 동기화를 지원하지 않는다.
*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Set;
import java.util.HashSet;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test174  // extends Object
{
	
	
	public static void main(String[] args)
	{
		// Set 자료구조 dog생성
		//Set<String> dog = new Set<String>();
		Set<String> dogs = new HashSet<String>();
		
		// Set 자료구조 dog에 요소 추가
		dogs.add("토이푸들");
		dogs.add("사모예드");
		dogs.add("리트리버");
		dogs.add("푸들");
		dogs.add("치와와");
		dogs.add("시바견");
		
		
		// Set 자료구조 dogs 요소 전체 출력
		System.out.print("전체 요소 : ");
		for (String dog : dogs)
		{
			System.out.print(dog + " ");
		}
		System.out.println();
		//--==>> 전체 요소 : 토이푸들 리트리버 푸들 시바견 치와와 사모예드 
		//-- 매번 순서가 바뀌지 않음
		//-- 순서가 의미 없는 자료구조이기 때문에
		//   데이터 입력 순서와 자료구조의 요소 격납 순서가
		//   상관 관계 없이 구성되어 있는 것을 관찰 및 확인
		
		// 데이터(요소) 추가
		dogs.add("시바견");
		dogs.add("진돗개");
		dogs.add("토이푸들");
		dogs.add("리트리버");
		dogs.add("치와와");
		dogs.add("푸들");
		dogs.add("시바견");
		dogs.add("진돗개");
		dogs.add("사모예드");
		dogs.add("사모예드");
		dogs.add("사모예드");
		dogs.add("사모예드");
		dogs.add("토이푸들");
		dogs.add("토이푸들");
		dogs.add("푸들");
		
		// 요소 추가 후 전체 데이터 출력
		System.out.print("추가 후 데이터 : ");
		for (String dog : dogs)
		{
			System.out.print(dog + " ");
		}
		System.out.println();
		//--==>> 추가 후 데이터 : 토이푸들 리트리버 진돗개 푸들 시바견 치와와 사모예드
		//-- 중복 데이터 입력해도 에러 발생하지 않음
		
		// ※ 데이터가 추가되는 순서와 상관없이 목록(요소들)이 구성되어 있으며
		//    같은 데이터가 여러 번 반복되어 추가될 경우
		//    이들 중 하나만 유효한 데이터로 구성되는 것을 확인 할 수 있다.
		//     (아무리 추가해도 한 번만 출력됨 → 하나만 요소로 구성되어 있음)
		//    
		// ※ 또한, 자료구조의 특성 상
		//    중복 데이터를 허용하지 않는다고 해서
		//    중복된 데이터를 추가할 경우
		//    에러가 발생한다는 의미는 아니라는 것도 확인할 수 있다.
	}
}