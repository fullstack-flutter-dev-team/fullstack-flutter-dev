/*===================================================================
	■■■ 배열 ■■■
	-  다차원 배열(배열의 배열)
===================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */ 

/* 
	
*/

/* 
	다차원 배열(배열의 배열)을 활용하여,
	다음과 같은 데이터를 요소로 취하는 배열을 구성하고
	그 결과를 출력하는 프로그램을 구현한다.
	
	
	실행 예)
	  E  J  O  T  Y
	  D  I  N  S  X
	  C  H  M  R  W
	  B  G  L  Q  V
	  A  F  K  P  U
	계속하려면 아무 키나 누르세요....

*/

/*


*/


public class Test094
{
	public static void main(String[] args)
	{
		/*
		// 변수 선언 및 초기화
		int nRow, nCol;
		char[][] arr;
		char ch = 'A';
		nRow = nCol = 5;
		arr = new char[nRow][nCol];
		
		// 다차원 배열 초기화
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = (nRow-1); j >= 0; j--)
			{
				arr[j][i] = ch;
				ch++;
			}
		}
		
		
		// 다차원 배열 요소 출력
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%3c", arr[i][j]);
			}
			
			System.out.println();   // 개행
		}
		
		//-- 실행결과
		//  E  J  O  T  Y
		//  D  I  N  S  X
		//  C  H  M  R  W
		//  B  G  L  Q  V
		//  A  F  K  P  U
		//계속하려면 아무 키나 누르십시오 . . .
		
		*/
		
		// 다차원 배열 선언 및 메모리 할당
		char[][] arr = new char[5][5];
		
		char start = 'A';                //-- 65
		
		
		
		// 배열 구성
		for (int i = 0; i < 5; i++)      // outer → 웅~~~  → i : 0     1     2     3     4
		{
			for (int j = 4; j >= 0; j--) // inner → 쑝쑝쑝 → j : 43210 43210 43210 43210 43210
			{
				arr[j][i] = start++;
			}
		}
		
		//전체 요소 출력
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%3c", arr[i][j]);
			}
			
			System.out.println();  // 개행
		}
	}
}
