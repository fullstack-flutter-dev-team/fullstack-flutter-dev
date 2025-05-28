/*===================================================================
	■■■ 배열 ■■■
	-  다차원 배열(배열의 배열)
===================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →   ←  ↓  …  ： ↑ /* */ 

/* 
	
*/

/* 
	다차원 배열(배열의 배열)을 활용하여,
	다음과 같은 데이터를 요소로 취하는 배열을 구성하고
	그 결과를 출력하는 프로그램을 구현한다.
	
	
	실행 예)
	 1  8   9  16  17
	 2  7  10  15  18
	 3  6  11  14  19
	 4  5  12  13  20
	계속하려면 아무 키나 누르세요....
	
	00 - 1   
	10 - 2
	20 - 3
	30 - 4
	
	31 - 5
	21 - 6
	11 - 7
	01 - 8
	
	03 - 9
	13 - 10
	23 - 11
	33 - 12
	
	34 - 13
	24 - 14
	14 - 15
	04 - 16
	
	05 - 17
	15 - 18
	25 - 19
	35 - 20
*/

public class Test093
{
	public static void main(String[] args)
	{
		// 변수 선언 및 초기화
		int nTemp = 1, nRow, nCol, jj;
		int[][] arr;
		
		nRow = 4;
		nCol = 5;
		arr = new int[nRow][nCol];
		
		//
		for (int i = 0; i < 5; i++)
		{
			
			//
			for (int j = 0, n = 3; j < 4; j++, n--)
			{
				
				if ((nTemp >= 5 && nTemp <= 8) || (nTemp >= 13 && nTemp <= 16))
				{
					jj	= n;
				} else {
					jj = j;
				}
				//System.out.printf("%2d  ", nTemp);
				arr[jj][i] = nTemp;
				nTemp++;
			}
			
			
		}
		
		System.out.println();
		
		/*
			 1   5   9  13   0
			 2   6  10  14   0
			 3   7  11  15   0
			 4   8  12  16   0
			계속하려면 아무 키나 누르십시오 . . .
		*/

		
		//
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%2d  ", arr[i][j]);
			}
			
			System.out.println();
		}
		
		
	}
}