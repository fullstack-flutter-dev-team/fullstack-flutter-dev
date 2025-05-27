/*===================================================================
	■■■ 배열 ■■■
	-  배열의 기본적 활용
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ ① ② ③ /* */ 

/* 
	임의의 정수들이 들어있는 배열
	그 배열의 숫자 데이터들 중
	짝수인 요소만 골라서 출력하고,
	3의 배수인 요소만 골라서 출력하는 
	프로그램을 구현한다.
	
	※ 배열을 구성하는 임의의 정수
		→ 4 7 9 1 3 2 5 6 8
	
	
	실행 예)
	배열 요소 정체 출력
	4 7 9 1 3 2 5 6 8
	짝수 선택적 출력
	4 2 6 8
	3의 배수 선택적 출력
	9 3 6
	계속하려면 아무 키나 누르세요...

*/

import java.util.Arrays;

public class Test084
{
	public static void main(String[] args)
	{
		/*
		// 변수 선언 및 초기화
		int[] arr = {4,7,9,1,3,2,5,6,8};
		
		
		System.out.println("배열 요소 전체 출력");
		for (int i=0; i < arr.length; i++)
		{
			System.out.printf("%2d ", arr[i]);
		}
		
		System.out.println(); // 개행
		
		System.out.println("짝수 선택적 출력");
		for (int i=0; i < arr.length; i++)
		{
			if (arr[i] % 2 == 0)
			{
				System.out.printf("%2d ", arr[i]);
			}
		}
		
		System.out.println(); // 개행
		
		System.out.println("3의 배수 선택적 출력");
		for (int i=0; i < arr.length; i++)
		{
			if (arr[i] % 3 == 0)
			{
				System.out.printf("%2d ", arr[i]);
			}
		}
		
		System.out.println(); // 개행
		System.out.printf("arr : %s, &arr : %s", arr, Arrays.toString(arr)); // 
		System.out.println(); // 개행
		//
		//배열 요소 전체 출력
		// 4  7  9  1  3  2  5  6  8
		//짝수 선택적 출력
		// 4  2  6  8
		//3의 배수 선택적 출력
		// 9  3  6
		//arr : [I@7d4991ad, &arr : [4, 7, 9, 1, 3, 2, 5, 6, 8]
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		// 배열 선언 및 초기화
		// 방법 ① 
		//int[] arr = new int[9];
		//arr[0] = 4;
		//arr[1] = 7;
		//arr[2] = 9;
		//arr[3] = 1;
		//arr[4] = 3;
		//arr[5] = 2;
		//arr[6] = 5;
		//arr[7] = 6;
		//arr[8] = 8;
		
		// 방법 ②
		int[] arr = {4, 7, 9, 1, 3, 2, 5, 6, 8};
		
		//System.out.println(arr);
		//--==>> [I@6d06d69c
		
		//※ 일반적인 변수에 담긴 내용을 출력하는 형식(방법)으로는
		//	  배열에 담긴 데이터들을 출력할 수 없다.
		
		System.out.println("배열 요소 전체 출력");
		//for (int i=0; i<9; i++)
		//{
		//	System.out.print(arr[i] + " ");
		//}
		
		
		System.out.println(arr);
		
		int[] arr2 = {1,2,3,4,5,6,7,8,9,8,7,6,5,4,3,2};
		System.out.println("arr2.length : " + arr2.length); // 개행
		//-- 실행 결과
		//arr2.length : 16

		//※ 배열 arr 의 길이(방의 갯수) 확인
		//	→ arr.length
	
		for (int i = 0; i < arr.length; i++)	// i → 0 1 2 3 4 5 6 7 8
		{
			System.out.print(arr[i] + " ");
		}
		//배열 요소 전체 출력
		//4 7 9 1 3 2 5 6 8 
		
		System.out.println(); // 개행
		
		System.out.println("짝수 선택적 출력"); // 개행
		for (int i = 0; i < arr.length; i++)	// i → 0 1 2 3 4 5 6 7 8
		{
			/*
			if (i%2)		// i가 짝수라면...	짝수번째 해당하는 요소라면...
			{
				// 출력해라	// 방 번호를...		해당 인덱스를...
				//System.out.print(i + " ");
			}
			//System.out.print(arr[i] + " ");
			*/
			if (arr[i] % 2 == 0)	//-- i번째 요소의 값이 짝수라면...
			{
				//출력해라			//-- 방 번호를...		→ 해당 인덱스를..
				//System.out.print(i + " ");
				
				//출력해라			//-- 방 번호에 해당하는 값을...→ 인덱스에 해당하는 값을...
				System.out.print(arr[i] + " ");
				
			}
		}
		//-- 실행 결과
		//짝수 선택적 출력
		//4 2 6 8 
		
		System.out.println(); // 개행
		
		System.out.println("3의 배수 선택적 출력"); // 개행
		for (int i = 0; i < arr.length; i++)	// i → 0 1 2 3 4 5 6 7 8
		{
			if (arr[i] % 3 == 0)	//-- i번째 요소의 값이 3의 배수라면...
			{
				//출력해라			//-- 방 번호에 해당하는 값을...→ 인덱스에 해당하는 값을...
				System.out.print(arr[i] + " ");
				
			}
		}
		//-- 실행 결과
		//3의 배수 선택적 출력
		//9 3 6 
	
	}
}