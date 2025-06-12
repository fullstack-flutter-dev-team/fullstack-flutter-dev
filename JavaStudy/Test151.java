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
    로또 번호 생성(난수 발생) 프로그램

    프로그램이 실행되면...
    기본적으로 로또를 5게임 수행하는 프로그램을 구현한다.
    
    실행 예)
    12 16 19 29 31 
     5 14 28 30 34 
     1  4  7 18 45 
    10 20 23 36 45 
     1 15 28 37 44 
    계속하련 아무키나 누르세요.
*/

// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.IOException;
import java.util.Arrays;
import java.util.Random;


class Lotto
{
	// 주요 속성 구성
	// 로또 번호를 담아둘 배열방 6칸
	// → 배열 변수 선언 및 메모리 할당
	private int[] num; //-- private 정보은닉.
	
	// 생성자 → 사용자 정의 생성자
	Lotto()
	{
		num = new int[6];
	}
	
	// getter
	public int[] getNum()
	{
		return this.num;
	}
	
	// 6개의 난수를 발생시키는 메서드 정의
	// → 중복 없도록 처리
	public void start()
	{
		// Random 인스턴스 생성
		Random rd = new Random();
		int n;
		int cnt = 0;
		
		jump:
			
		while (cnt < 6)  // cnt → 0 1 2 3 4 5 
		{
			n  = rd.nextInt(45) + 1;  // {0 ~ 44} → 『+1』 → { 1 ~ 45}
			
			for (int i = 0; i < cnt; i++)   //-- cnt
			{
				//각각 비교
				if (num[i] == n)       // 앞쪽에서 이미 만들어진 값들 둥 같은 값 발견
				{
					continue jump;     // → 
				}
			}
			num[cnt++] = n;
		}
		
		// 정렬 메서드 호출
		sorting();
		
	}//end srart()
	
	// 정렬 메서드 정의
	private void sorting()
	{
		// 
		Arrays.sort(num);
	}
	
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test151  // extends Object
{
	
	private int[][] arrLotto;
	private final static int LOTTO_NUM_COUNT = 6;  // 로또 번호 갯수
	
	public void genLotto(int nGameNum)
	{
		int nTemp, nIdxCol;
		boolean isContain;
		
		Random rd = new Random();
		arrLotto = new int[nGameNum][Test151.LOTTO_NUM_COUNT];
		
		for (int i = 0; i < nGameNum; i++)
		{
			nIdxCol = 0;
			
			do
			{
				nTemp = rd.nextInt(45) + 1; //-- 랜덤번호 생성
				isContain = isContains(arrLotto[i], nTemp); //-- 동일한 값 존재여부 체크
				
				if (!isContain)
				{
					//System.out.printf("%d - (%b)\n", nTemp, isContain);
					arrLotto[i][nIdxCol] = nTemp;
					nIdxCol++;
				}
			}
			while (nIdxCol < Test151.LOTTO_NUM_COUNT);
		}
		
		// 생성된 로또번호 출력
		print();
	}
	
	private void print()
	{
		for (int[] arr : arrLotto)
		{
			// 오름차순 정렬
			//Arrays.sort(arr);
			
			for (int n : sortArr(arr))
			{
				System.out.printf("%2d ", n);
			}
			System.out.println();
		}
	}
	
	private boolean isContains(int[] arr, int key)
	{
		boolean result = false;
		
		// 확인(테스트)
		//System.out.println("arr : " + Arrays.toString(arr) + " , key = " + key);
		
		for (int i = 0 ; i< arr.length ; i++)
		{
			if (arr[i] == key)
			{
				return true;
			}
		}
		
		return result;
	}
	
	public int[] sortArr(int[] arr)
	{
		int[] arrTemp = arr;
		int nTemp;
		
		// 확인(테스트)
		//System.out.println("-----------------");
		//for (int n : arr)
		//{
		//	System.out.printf("%2d ", n);
		//}
		//System.out.println();
		//System.out.println("-----------------");
		
		for (int i = 0; i < arrTemp.length; i++)
		{
			for (int j = i+1; j < arrTemp.length; j++)
			{
				if (arrTemp[i] > arrTemp[j])
				{
					nTemp = arrTemp[i];
					arrTemp[i] = arrTemp[j];
					arrTemp[j] = nTemp;
				}
			}
		}
		
		// 확인(테스트)
		//System.out.println("-----------------");
		//for (int n : arrTemp)
		//{
		//	System.out.printf("%2d ", n);
		//}
		//System.out.println();
		//System.out.println("-----------------");
		
		return arr;
	}
	
	public static void main(String[] args) throws IOException
	{
		/*
		// Test151 클래스의 인스턴스 생성
		Test151 obj = new Test151();
		int nGameCount;
		
		// 로또번호 생성 횟수 설정
		nGameCount = 5;
		
		// 로또번호 생성
		obj.genLotto(nGameCount);
		
		// 확인(테스트)
		//int[] arr = {33, 22, 11, 44 ,1};
		//obj.sortArr(arr);
		*/
		
		// Lotto 인스턴스 생성
		Lotto lotto = new Lotto();
		
		// 기본 5게임
		for (int i = 1; i <= 5; i++)  // i →  1 2 3 4 5
		{
			// Lotto 게임 수행
			lotto.start();
			
			for (int n : lotto.getNum() )
			{
				System.out.printf("%4d", n);
			}
			System.out.println();
			
		}
		
	}
	
	
}