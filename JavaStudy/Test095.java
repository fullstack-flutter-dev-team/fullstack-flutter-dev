/*===================================================================
	■■■ 배열 ■■■
	-  다차원 배열(배열의 배열)
===================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛

/* 
	
*/

/* 
	다차원 배열(배열의 배열)을 활용하여,
	다음과 같은 데이터를 요소로 취하는 배열을 구성하고
	그 결과를 출력하는 프로그램을 구현한다.
	
	
	실행 예)
	  1  2  3  4  10
	  5  6  7  8  26
	  9 10 11 12  42
	 13 14 15 16  58
	 28 32 36 40 136
	계속하려면 아무 키나 누르세요....

*/

/*
 ▣ 힌트:
    반복문의 처리가 필요한 영역 vs. 반복문의 처리가 필요하지 않은 영역
                1  2  3  4  ┃ 10
                5  6  7  8  ┃ 26
                9 10 11 12  ┃ 42
               13 14 15 16  ┃ 58
               ────-──┛
               28 32 36 40    136
*/


public class Test095
{
	public static void main(String[] args)
	{
		/*
		//변수 선언 및 초기화
		int nRow, nCol, nNum, nSumRow, nSumCol;
		int[][] arr;
		
		nNum = 1;
		nRow = nCol = 5;
		nSumRow = nSumCol = 0;
		
		// 다차원 배열 메모리 할당
		arr = new int[nRow][nCol];
		
		//다차원 배열 요소 초기화
		for (int i = 0; i < arr.length; i++)
		{
			nSumRow = 0;
			for (int j = 0; j < arr[i].length; j++)
			{
				
				if (i != 4 && j != 4)
				{
					arr[i][j] = nNum;
					nSumRow += nNum;
					nNum++;
				} else if (i == 4) {
					nSumCol = 0;
					
					for (int n = 0; n < nCol-1; n++)
					{
						nSumCol += arr[n][j];
					}
					arr[i][j] = nSumCol;
				} else {
					arr[i][j] = nSumRow;
				}
			}
		}
		
		//다차원 배열 요소 출력
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%4d", arr[i][j]);
			}
			
			System.out.println(); // 개행
		}
		//--실행 결과
		//   1   2   3   4  10
		//   5   6   7   8  26
		//   9  10  11  12  42
		//  13  14  15  16  58
		//  28  32  36  40 136
		//계속하려면 아무 키나 누르십시오 . . .		
		
		*/
		
		// 변수 선언 및 초기화
		int[][] arr = new int[5][5];
		int n = 0;                                        // 1 ~ 16
		
		//테스트 변수
		int sum = 0;
		
		//배열 요소 구성
		for (int i = 0; i < arr.length-1; i++)            //-- outer →  웅~~~   → i : 0 1 2 3
		{
			for (int j = 0; j < arr[i].length-1; j++)     //-- inner →  쑝쑝쑝  → j : 0 1 2 3
			{
				n++;
				arr[i][j] = n;
				
				//sum += arr[i][j];
				
				arr[i][arr[i].length-1] += arr[i][j];
				//arr[0][4] += arr[0][0]; // → 1
				//          += arr[0][1]; // → 2
				//          += arr[0][2]; // → 3
				//          += arr[0][3]; // → 4
				
				arr[arr.length-1][j] += arr[i][j];
				//arr[4][0] += arr[0][0]; // →  1
				//          += arr[1][0]; // →  5
				//          += arr[2][0]; // →  9
				//          += arr[3][0]; // → 13
				
				arr[arr.length-1][arr.length-1] += arr[i][j];
			}
		}
		
		//테스트(확인)
		//System.out.println("sum : " + sum);
		//System.out.println("------------------------");
		
		
		//다차원 배열 요소 전체 출력
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%4d", arr[i][j]);
			}
			
			System.out.println(); // 개행
		}
	}
}

//-- 실행 결과
//   1   2   3   4  10
//   5   6   7   8  26
//   9  10  11  12  42
//  13  14  15  16  58
//  28  32  36  40 136
//계속하려면 아무 키나 누르십시오 . . .
