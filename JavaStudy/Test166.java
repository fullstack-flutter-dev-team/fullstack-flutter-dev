/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  벡터(Vector)
	-  Interface Iterator<E>
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class Vector<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html) 
/// @see [Class Collections](https://docs.oracle.com/javase/8/docs/api/java/util/Collections.html) 

/*
---------------------------------------
java.lang.Object
  ㄴjava.util.AbstractCollection<E>
     ㄴjava.util.AbstractList<E>
        ㄴjava.util.Vector<E>


java.lang.Object
  ㄴjava.util.Collections

---------------------------------------
    - Collections.binarySearch()
    - Collections.reverseOrder()
    - Collections.sort(List<T> list)
    - Collections.sort(List<T> list,  Comparator<? super T> c))
    
    
    
    
    
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Vector;
import java.util.Collections;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test166 // extends Object
{
	// 정적 문자열 배열 선언 및 초기화
	private static final String[] colors = {
			"검정",
			"노랑",
			"초록",
			"파랑",
			"빨강",
			"연두"
		};


	public static void main(String[] args)
	{
		// 벡터 자료구조 v 생성
		Vector<String> v = new Vector<String>(3);
		
		
		// 벡터 자료구조 v에 colors 배열 데이터를 요소로 추가
		for (String strColor : colors)
		{
			v.addElement(strColor);
		}
		
		// 접근 및 확인
		System.out.println("첫 번째 요소 : " + v.firstElement());
		System.out.println("두 번째 요소 : " + v.get(1));
		System.out.println("마지막  요소 : " + v.lastElement());
		System.out.println("요소의  갯수 : " + v.size());
		//--
		//첫 번째 요소 : 검정
		//두 번째 요소 : 노랑
		//마지막  요소 : 연두
		//요소의  갯수 : 6
		
		System.out.println("----");
		// ○ 첫 번째 요소를 "하양"으로 변경
		// →  set()
		v.set(0, "하양");
		//-- "검정" 에서 "하양" 으로 덮어쓰기
		System.out.println("첫 번째 요소 : " + v.firstElement());
		System.out.println("두 번째 요소 : " + v.get(1));
		System.out.println("요소의  갯수 : " + v.size());
		//--실행 결과
		//첫 번째 요소 : 하양
		//첫 번째 요소 : 노랑
		//첫 번째 요소 : 6

		System.out.println("----");
		// ○ 첫 번째 요소를 "주황" 추가
		// →  insertElementAt()
		v.insertElementAt("주황", 0);
		
		// ○ 전체 출력
		System.out.print("전체 출력 : ");
		for (String strColor : v)
		{
			System.out.print(strColor + " ");
		}
		System.out.println();
		//--==>> 전체 출력 : 주황 하양 노랑 초록 파랑 빨강 연두 
		
		// ○ 오름차순 정렬 ( 객체를 대상으로는 정렬이 불가능 ★)
		Collections.sort(v);
			
		System.out.println("----");
		
		// ○ 오름차순 정렬 후 전체 출력
		System.out.print("오름차순 정렬 후 전체 출력 : ");
		for (String strColor : v)
		{
			System.out.print(strColor + " ");
		}
		System.out.println();
		//--==> 오름차순 정렬 후 전체 출력 : 노랑 빨강 연두 주황 초록 파랑 하양 
		
		System.out.println("----");
		// ○ 검색 ★★
		// Collections.binarySearch()
		// 검색 기능 수행
		// 단, 오름차순 정렬이 수행되어 있는 자료에 대해서만 사용이 가능하다. check~!!!
		// 검색 결과가 존재하지 않을 경우 [음수]를 반환한다.
		
		// 노랑 빨강 연두 주황 초록 파랑 하양
		int idxBlue = Collections.binarySearch(v, "파랑");
		System.out.printf("파랑 : %d번째 인덱스에 위치하고 있다.\n", idxBlue);
		//--==>> 파랑 : 5번째 인덱스에 위치하고 있다.
		
		System.out.println("----");
		
		// ○ 내림차순 정렬
		Collections.sort(v, Collections.reverseOrder());
		
		// ○ 내림차순 정렬 후 전체 출력
		System.out.print("내림차순 정렬 후 전체 출력 : ");
		for (String strColor : v)
		{
			System.out.print(strColor + " ");
		}
		System.out.println();
		//--==>> 내림차순 정렬 후 전체 출력 : 하양 파랑 초록 주황 연두 빨강 노랑 
		
		System.out.println("----");
		// 하양 파랑 초록 주황 연두 빨강 노랑
		idxBlue = Collections.binarySearch(v, "파랑");
		System.out.printf("파랑 : %d번째 인덱스에 위치하고 있다.\n", idxBlue);
		//--==>> 파랑 : -8번째 인덱스에 위치하고 있다.
		//               『-』 → 검색 결과 없음  → 찾지 못했음 ★★
		
		System.out.println("----");
		// ※ 내림차순 정렬 후 검색 테스트
		idxBlue = Collections.binarySearch(v, "파랑", Collections.reverseOrder());
		System.out.printf("파랑 : %d번째 인덱스에 위치하고 있다.\n", idxBlue);
		//--==>> 파랑 : 1번째 인덱스에 위치하고 있다.
		
	}
}