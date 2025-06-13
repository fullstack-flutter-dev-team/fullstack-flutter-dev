/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- Random 클래스 - 실습
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class Random](https://docs.oracle.com/javase/8/docs/api/java/util/Random.html) 
/// @see [Class Math](https://docs.oracle.com/javase/8/docs/api/java/lang/Math.html) 

/*
java.lang.Object
 ㄴjava.lang.Math
 
java.lang.Object
 ㄴjava.util.Random

java.lang.Object
 ㄴjava.util.Arrays

  ○  java.util.Random 클래스는
       여러 형태의 난수를 발생시켜 제공하는 클래스이다.    
       Math 클래스의 정적 메서드인 random() 메서드도 난수를 발생시켜 제공하는 메서드이지만   
       0.0 ~ 1.0 사이의 실수 형태만 발생하게 되므로
       필요한 여러 형태의 난수를 만들어내기 위해서는 추가적인 연산을 수행해야 한다.
       그래서 자바는 난수를 발생시켜주는 전용 클래스인
       Random 클래스를 별도로 제공하고 있다.
*/


/*
   스무 고개 → 열 고개
   
   다음과 같은 프로그램을 구현한다.
   
   실행 예)
   스무고개 10회(1~100)  → 사전에 난수 1개 발생 → 30
   input : 20
   20보다 큽니다.
   input : 54
   54보다 작습니다.
   input : 32
   32보다 작습니다.
   input : 30
   value = 30
   coount = 4
   계속하려면 아무 키나 누르세요....
   ：
   ：
    value = 30
   실해했습니다.
   계속하려면 아무키나 누르세요....
*/

// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.IOException;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test152  // extends Object
{
	public static void main(String[] args)
	{
		/*
		// 인스턴스 생성
		Game obj = new Game();
		// 스므고개 시작
		obj.startGame();
		*/
		
		
		Random rd = new Random();
		Scanner sc = new Scanner(System.in);
		
		int val = rd.nextInt(100) + 1; // 0~99 → 1~100
		int input;
		int cnt = 0;
		
		// 테스트(확인)
		//System.out.println("답 : " + val);
		// 답 : 52
		// 답 : 9
		
		System.out.println("스무고개 10회(1~100)");
		
		do
		{
			System.out.print("input : ");
			input = sc.nextInt();
			
			if (val > input) {
				System.out.printf("%d보다 큽니다.", input);
			} else if (val < input) {
				System.out.printf("%d보다 작습니다.", input);
			}
			
			cnt++;
		}
		while (input != val && cnt < 10);
		
		System.out.println("val = " + val);
		if (input != val)
		{
			System.out.println("실패했습니다.");
		} else {
			System.out.println("count = " + cnt);
		}
		
	}
}

class Game
{
	private int nValue, nCount, nInputNum;
	
	public void startGame()
	{
		Random rd = new Random();
		Scanner sc = new Scanner(System.in);
		
		nValue = rd.nextInt(100) + 1; 
		nCount = 0;
			
		System.out.println("스무고개 10회(1~100)");
		
		do
		{
			nCount++;
			System.out.print("input : ");
			nInputNum = sc.nextInt();
			
			if (nInputNum == nValue)
			{
				printResult(nCount, false, true, false);
				return;
			} else if (nInputNum > nValue) {
				printResult(nCount, true, false, false);
			} else {
				printResult(nCount, false, false, false);
			}
		}
		while (nCount < 10);
		
		// 상태 출력
		printResult(nCount, false, false, true);
		
	}
	
	private void printResult(int nCount, boolean isBig, boolean isSuccess, boolean isOver)
	{
		if (isSuccess)
		{
			System.out.printf("value = %d\n", nValue);
			System.out.printf("count = %d\n", nCount);
		} else if (isOver) {
			System.out.printf("value = %d\n", nValue);
			System.out.println("실패했습니다.");
		} else if (!isOver && isBig) {
			System.out.printf("%d보다 작습니다.\n", nInputNum);
		} else if (!isOver && !isBig) {
			System.out.printf("%d보다 큽니다.\n", nInputNum);
		}
	}
	
}//class Game