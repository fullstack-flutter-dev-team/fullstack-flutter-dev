/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  벡터(Vector) - 검색 및 삭제
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

---------------------------------------
    - add
    - indexOf
    - contains
    - remove
    
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Vector;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test167  extends Vector// extends Object
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
		Vector<String> v = new Vector<String>();
		
		// 벡터 자료구조 v 에 colors 배열 데이터를 요소로 추가
		for (String strColor : colors)
		{
			v.add(strColor);
		}
		
		// 벡터 자료구조 v 의 전체 요소 출력
		System.out.print("전체 요소 출력 : ");
		for (String str: v)
		{
			System.out.print(str + " ");
		}
		System.out.println();
		//--==> 전체 요소 출력 : 검정 노랑 초록 파랑 빨강 연두 
		
		String s1 = "보라";
		
		// indexOf()
		int i = v.indexOf(s1);
		System.out.println(s1 + " →  index 위치 : " + i);
		System.out.println();
		//--==>> 보라 →  index 위치 : -1
		//                 → 반환 결과 음수 → 존재하지 않음
		
		
		String s2  = "노랑";
		
        // 『v.contains(s)』
        //-- 벡터 자료구조 v에 찾고자 하는 s가 포함되어 있는지의 여부
        //    → 포함되어 있다면 index 위치 확인
		if (v.contains(s2))
		{
			i = v.indexOf(s2);
			System.out.println(s2 + " →  index 위치 : " + i);
			//--==>> 노랑 →  index 위치 : 1
			// 존재하는지 여부를 확인하고
			// 어디에 있는지 확인하고
			// 확인했으면 제거해라(삭제하라)
			v.remove(i);
		}

		System.out.println("-----");
		
        // 찾아서 삭제한 후 전체 요소 출력
        System.out.print("삭제 후 전체 요소 출력 : ");
        for (String str : v)
            System.out.print(str + " ");
        System.out.println();
        //--==>> 삭제 후 전체 요소 출력 : 검정 초록 파랑 빨강 연두
 
        System.out.println(v);
        //--==>> [검정, 초록, 파랑, 빨강, 연두]
 
        // ※ 점검 확인용 더미 데이터는
        //    실제 요소(데이터)가 아니기 떄문에
        //    이를 활용하여 연산을 진행하고 처리해서는 안된다.  check~!!!
		
	}
	
	
}