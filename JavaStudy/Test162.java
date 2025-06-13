/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  큐(Queue)
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Interface Queue<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Queue.html) 

/*
   ○ 큐(Queue)
       큐(Queue)는 선입선출(FIFO) 구조로 먼저 입력된 자료를 먼저 출력하며,
       Queue 인터페이스를 구현한 클래스는 큐와 관련한 다양한 기능을 제공한다.
       
   ※ Queue 인터페이스 기반의 인스턴스를 생성하기 위해서는
      new 연산자를 이용하여 Queue 인터페이스를 구현한(implements)
      클래스의 생성자를 호출한다.
     
      ex) Queue ob = new LinkedList();

   ○ 주요 메서드  
     - E element()
         큐의 head 요소를 반환하며 삭제하지 않는다.
     - boolean offer(E o)
         지정된 요소를 큐에 삽입한다.
     - E peek()
         큐의 head 요소를 반환하고 삭제하지 않으며, (head : 출구에 있는 요소)
         큐 자료구조가 empty인 경우 null을 반환한다.
     - E poll()
         큐의 head 요소를 반환하고 삭제하며
         큐 자료구조가 empty인 경우 null을 반환한다.
     - E remove()  
         큐의 head 요소를 반환하고 삭제한다.
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Queue;
import java.util.LinkedList;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test162  // extends Object
{
 
	public static void main(String[] args)
	{
		// Queue 자료구조 생성
		// Queue myQue = new Queue();  //--(x)
		Queue<Object> myQue = new LinkedList<Object>();
		
		// 데이터 준비
		String str1 = "1";
		String str2 = "2";
		String str3 = "3";
		String str4 = "4";
		
		// myQue 라는 Queue 자료구조에 데이터 추가
		// → offer()
		myQue.offer(str1);
		myQue.offer(str2);
		myQue.offer(str3);
		//myQue.offer(str4);
		boolean test = myQue.offer(str4);
		
		// 테스트(확인)
		System.out.println("test : " + test);
		//--==>> test : true
		
		// 테스트 (확인) -- 더미 데이터 ★
		System.out.println(myQue);  //-- 더미
		//--==>> [1, 2, 3, 4]       ★ check~!!!
		// ※ 실재 데이터처럼 처리하고 활용해서는 안된다.
		
		System.out.println("값1 : " + myQue.element());
		System.out.println("값2 : " + myQue.element());
		System.out.println("값3 : " + myQue.element());
		//
		//값1 : 1
		//값2 : 1
		//값3 : 1
		//-- Queue 자료구조 myQue에
		//   요소를 제거하지 않으면서 head 요소 반환
		
		System.out.println("--------------------------");
		
		String val;
		
		// ①
		//while (myQue.peek() != null)
		//{
		//	val = (String)myQue.poll();
		//	System.out.println("요소 : " + val);
		//}
		//System.out.println();
		//-- 실행 결과
		//요소 : 1
		//요소 : 2
		//요소 : 3
		//요소 : 4
		
		// ②
		//while (true)
		//{
		//	val = (String)myQue.poll();
		//	if (val == null)
		//	{
		//		break;
		//	} else {
		//		System.out.println("요소-2 : " + val);
		//	}
		//}
		//System.out.println();
		//-- 실행 결과
		//요소-2 : 1
		//요소-2 : 2
		//요소-2 : 3
		//요소-2 : 4
		
		// ③
		while (!myQue.isEmpty())
		{
			val = (String)myQue.poll();
			if (val == null)
			{
				break;
			} else {
				System.out.println("요소-3 : " + val);
			}
		}
		//-- 실행 결과
		//요소-3 : 1
		//요소-3 : 2
		//요소-3 : 3
		//요소-3 : 4

	}
	
}