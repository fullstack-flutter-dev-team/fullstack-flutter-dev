/*===================================================================
	■■■ 배열 ■■■
	-  배열의 복사
===================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛

/* 
	
*/

// Test100.java 파일과 비교~!!!

/* 
    ※ 자바에서 배열 변수의 복사에는 데이터 복사, 주소값 복사 두 가지 형태가 존재한다.
          
          주소값 복사  → 얕은 복사
          원본을 수정하면 복사본에 영향을 미치게 되는 복사 방법
          (자바의 배열 뿐 아니라 모든 참조형 데이터에 해당하는 복사 방법)
          
          
          데이터 복사 → 깊은 복사
          실제 요소로 들어있는 값에 대한 복사로
          원본을 수정해도 복사본에 영향을 미치지 않는 복사방법
		  
	▣ 데이터 복사
	  → int형 배열에 대한 깊은 복사를 처리하는
	     메서드를 정의하는 형태로 실습 진행
*/

/*
 ▣ 힌트:
    
*/

import java.util.Scanner;
import java.util.Random;

public class Test101
{
	public static void main(String[] args)
	{
		int[] nums = {10, 20, 30, 40, 50};       //-- 배열 원본 구성
		
		int[] copys1 = nums;                      //-- 얕은 의미의 배열 복사 수행
		                                         //    (주소값 복사)
		
		int[] copys2 = copyArray(nums);          //-- 깊은 의미의 배열 복사 수행
		                                         //    (사용자 정의 메서드 호출)
												 
						
		int[] copys3 = (int[])nums.clone();      //-- 깊은 복사
		 
		// check~!!!!
		// 원본 배열의 요소 수정 발생~!!!(위치 주목)
		nums[1] = 2000;                     //-- int[] nums = {10, 20, 30, 40, 50};
		
		// nums 배열 확인
		for (int i = 0; i < nums.length; i++)
		{
			System.out.print(nums[i] + " ");
		}
		System.out.println();
		//--==>> 10 2000 30 40 50 
	
		// copys1 배열 확인
		for (int i = 0; i < copys1.length; i++)
		{
			System.out.print(copys1[i] + " ");
		}
		System.out.println();
		//--==>> 10 2000 30 40 50 
		
		// copys2 배열 확인
		for (int i = 0; i < copys2.length; i++)
		{
			System.out.print(copys2[i] + " ");
		}
		System.out.println();
		//--==>> 10 20 30 40 50 
		
		// copys3 배열 확인
		for (int i = 0; i < copys3.length; i++)
		{
			System.out.print(copys3[i] + " ");
		}
		System.out.println();
		//--==>> 10 20 30 40 50 
	}
	
	
	// 매개변수로 int형 배열 타입을 넘겨받아
	// 이 배열을 복사한 후,
	// 복사한 배열을 결과값으로 반환하는 기능을 가진 메서드 정의
	public static int[] copyArray(int[] os)
	{
		// ①
		// 매개변수로 넘겨받은 배열(os)
		// 즉, 원본 배열만큼의 배열방(메모리 공간)을 확보한
		// 복사할 배열 생성
		int[] result = new int[os.length];
		
		
		// ②
		// 원본 배열(os)에 담겨있는 각각의 요소들을
		// 복사할 배열에 담아내기(→ 반복 구문 수행)
		// result = os;     //-- (X)
		//for (int i = 0; i < os.length; i++)
		for (int i = 0; i < result.length; i++)
		{
			result[i] = os[i];
		}
		
		// ③
		// 복사한(대상 값으로 구성된) 배열 반환
		return result;
	}
	
	
	
}