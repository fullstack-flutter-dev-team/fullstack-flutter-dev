/*===================================================================
	■■■ 배열 ■■■
	-  다차원 배열(배열의 배열)
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ ① ② ③ /* */ 

/* 
	
*/

import java.util.Scanner;
import java.io.IOException;

public class Test089
{
	public static void main(String[] args)
	{
		// 배열의 배열 선언과 초기화
		// 방법①
		//int[] arr1 = new int[3];
		int[][] arr1 = new int[3][3];
		
		//arr1[0] = 1;
		arr1[0][0] = 1;
		arr1[0][1] = 2;
		arr1[0][2] = 3;
		
		arr1[1][0] = 4;
		arr1[1][1] = 5;
		arr1[1][2] = 6;
		
		arr1[2][0] = 7;
		arr1[2][1] = 8;
		arr1[2][2] = 9;
		
		// 방법 ②
		//int[] arr2 = {1, 2 ,3};
		int[][] arr2 = {{1, 2 ,3}, {4, 5, 6}, {7, 8, 9}};
		
		// 방법 ③
		int [][] arr3 = new int[3][3];
		int n = 1;
		
		// 2차원 배열의 길이
		for (int i = 0; i < arr3.length; i++)			// 웅~~~  i → 0      1      2
		{
			for (int j = 0; j < arr3[i].length; j++)	// 쑝쑝쑝 j → 0 1 2  0 1 2  0 1 2
			{
				//테스트(확인)
				//System.out.println("i : " + i + ", j : " + j);
				//--실행결과
				//i : 0, j : 0
				//i : 0, j : 1
				//i : 0, j : 2
				//i : 1, j : 0
				//i : 1, j : 1
				//i : 1, j : 2
				//i : 2, j : 0
				//i : 2, j : 1
				//i : 2, j : 2
				//계속하려면 아무 키나 누르십시오 . . .
				arr3[i][j] = n;
				n++;
			}
		}
		
		
		// 배열의 배열(다차원 배열) 요소 전체 출력
		for (int i = 0; i < arr3.length; i++)
		{
			for (int j=0; j < arr3[i].length; j++)
			{
				System.out.printf("%2d", arr3[i][j]);
			}
			
			System.out.println();
		}
		//--실행결과
		// 1 1 1
		// 1 1 1
		// 1 1 1
		//계속하려면 아무 키나 누르십시오 . . .
		
	}
}

//-- 실행결과
// 1 2 3
// 4 5 6
// 7 8 9
//계속하려면 아무 키나 누르십시오 . . .
