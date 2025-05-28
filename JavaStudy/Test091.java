/*===================================================================
	■■■ 배열 ■■■
	-  다차원 배열(배열의 배열)
===================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →   ←  ↓  …  ： ↑ /* */ 

/* 
	
*/

/* 
	다차원 배열(배열의 배열)을 활용하여,
	다음과 같은 데이터를 요소로 취하는 배열(5x5)를 구성하고
	그 결과를 출력하는 프로그램을 구현한다.
	
	
	실행 예)
	 1  2  3  4  5
	 2  3  4  5  6
	 3  4  5  6  7
	 4  5  6  7  8
	 5  6  7  8  9
	계속하려면 아무 키나 누르세요....
*/

public class Test091
{
	public static void main(String[] args)
	{
		/*
		// 변수 선언 및 초기화
		int nRow, nCol, nTemp;
		int[][] arr;
		nRow = nCol = 5;
		arr = new int[nRow][nCol];
		
		
		// 다차원 배열 요소 초기화
		for (int i = 0; i < arr.length; i++)
		{
			nTemp = i+1;
			
			for (int j = 0; j < arr[i].length; j++)
			{
				arr[i][j] = nTemp++;
			}
		}
		
		
		// 다차원 배열의 전체 요소 출력
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%d ", arr[i][j]);
			}
			
			System.out.println(); // 개행
		}
		//-- 실행결과
		//1 2 3 4 5
		//2 3 4 5 6
		//3 4 5 6 7
		//4 5 6 7 8
		//5 6 7 8 9
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		
		// 배열의 배열 선언 및 메모리 할당
		int[][] arr = new int[5][5];
		
		// 주요 변수 선언
		int n;
		
		//배열 구성
		for (int i = 0; i < arr.length; i++)
		{
			n = i + 1;
			
			for (int j = 0; j < arr[i].length; j++)			//-- 웅
			{
				//테스트(확인)
				//System.out.print(i + " , " + j + "   ");	//-- 쑝
				//System.out.print("[ " + n + " ] ");
				arr[i][j] = n;
				n++;
			}
			
			//System.out.println();						//--확인 과정에서의 개행
		}
		
		//System.out.println("-----------------");
		
		//배열 요소 전체 출력
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%3d", arr[i][j]);
			}
			
			System.out.println();
		}
		
	}
}

//--실행결과
//  1  2  3  4  5
//  2  3  4  5  6
//  3  4  5  6  7
//  4  5  6  7  8
//  5  6  7  8  9
//계속하려면 아무 키나 누르십시오 . . .