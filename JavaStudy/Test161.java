/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class Stack<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Stack.html) 

/*

*/


/*

*/

/*

*/



// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Stack;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test161  // extends Object
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
			
	// 생성자(사용자 정의 생성자)
	public Test161()
	{
		// st 라는 Stack 자료구조 생성
		// 제네릭을 활용하여 자료구조에 담기는 데이터 표현 → 『String』
		Stack<String> st = new Stack<String>();
		
		System.out.println("capacity : " + st.capacity());
		
		// st 라는 Stack 자료구조에 데이터(colors) 담기
		//st = colors; //--(x)
		
		/*
		st.push(color[0]);
		st.push(color[1]);
		st.push(color[2]);
		st.push(color[3]);
		st.push(color[4]);
		st.push(color[5]);
		
		st.add(color[0]);
		st.add(color[1]);
		st.add(color[2]);
		st.add(color[3]);
		st.add(color[4]);
		st.add(color[5]);
		*/
		
		//for (int i = 0; i < colors.length; i++)   // i → 0 1 2 3 4 5
		//{
		//	st.push(colors[i]);                   // st.add(color[i]); 
		//}
		
		//for (String strColor : colors)
		//{
		//	//
		//	st.push(strColor);
		//}
		
		for (String color: colors)
		{
			st.push(color);    // st.add(color);
		}
		
		
		//st.push(10);
		//st.push(10.0);
		//--==?? 에러 발생(컴파일 에러)
		//  String 이 아닌 다른 자료형(int, double) 을
		//  스택 자료구조 st 에 push 하려고 했기 때문에 발생한 에러
		
		st.push("보라");
		
		//print(st);
		
		// 출력 메서드 호출
		popStack(st);
		
		
		//print(st);
		

		
		System.out.println("capacity : " + st.capacity());
	}
	
	// 출력 메서드
	private void popStack(Stack<String> st)
	{
		System.out.print("pop : ");
		while (!st.empty())    // isEmpty()
		{
			System.out.print(st.pop() + " ");
		}
		System.out.println(); // 개행
	}
	
	private void print(Stack<String> st)
	{
		int i = 0;
		while (!st.isEmpty())
		{
			//System.out.printf("%d - %s\n", i, st.get(i));
			System.out.printf("%d - %s\n", i, st.elementAt(i++));
		}
	}
	
	
	public static void main(String[] args)
	{
		// Test161 인스턴스 생성
		//Test161 obj = new Test161();
		new Test161();
	}
	
}