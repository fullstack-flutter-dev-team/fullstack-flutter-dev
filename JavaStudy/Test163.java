/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  큐(Queue)
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Interface Queue<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Queue.html) 

/*
   
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Queue;
import java.util.LinkedList;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test163  // extends Object
{	
	// 정적 문자열 배열 선언 및 초기화
	private static final String[] colors = {
			"검정",
			"노랑",
			"초록",
			"파랑",
			"빨강",
			"연두",
		};
			
	public static void main(String[] args)
	{
		// Queue 자료구조 생성
		//-- Queue 인터페이스 기반의 인스턴스를 생성하기 위해서는
		//   new 연산자를 이용하여  Queue 인터레시스를 implements 한
		//   하위 클래스의 생성자를 호출해야 한다.
		
		Queue<String> qu = new LinkedList<String>();
		
		// Queue 자료구조에 colors 배열의 데이터 입력
		for (String color : colors)
		{
			qu.offer(color);
		}
		
		// Queue 자료구조 요소 전체 출력
		// peek()
		// : 큐의 head요소를 반한하고 삭제하지 않으며,
		//    큐의 자료구조가 비어있는 상태가 되면(empty) null 반환
		// poll()
		// : 큐의 head요소를 반한하고 삭제하며,
		//    큐의 자료구조가 비어있는 상태가 되면(empty) null 반환
		while (qu.peek() != null)
		{
			System.out.print(qu.poll() + " ");
		}
		System.out.println();
		
	}
			
}