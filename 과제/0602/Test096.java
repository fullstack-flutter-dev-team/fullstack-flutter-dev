/*===================================================================
	■■■ 배열 ■■■
	-  다차원 배열(배열의 배열)
===================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛

/* 
	
*/

/* 
	○ 과제
	다차원 배열(배열의 배열)을 활용하여,
	다음과 같은 데이터를 요소로 취하는 배열을 구성하고
	그 결과를 출력하는 프로그램을 구현한다.
	
	
	실행 예)
	A
	B C
	D E F
	G H I J
	K L M N O
	계속하려면 아무 키나 누르세요....

*/

/*
 ▣ 힌트:
    
*/


public class Test096
{
	public static void main(String[] args)
	{
		// 변수 선언 및 초기화
		char ch;
		int nRow, nCol;              // 다차워 배열 행/열 길이 값  
		char[][] arr;                // 다차원 배열 선언
			
		ch = 'A';
		nRow = nCol = 5;             // 행/열 길이 설정(5)
		arr = new char[nRow][nCol];  // 다차원 배열 메모리 할당
		
		
		// 다차원 배열 요소 값 설정
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				if (j <= i)
				{
					arr[i][j] = ch;
					ch++;
				} else {
					arr[i][j] = '\0';
				}
			}

		}
		
		// 다차원 배열 전체 요소 값 출력
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

//-- 실행 결과
/*

  A
  B  C
  D  E  F
  G  H  I  J
  K  L  M  N  O
계속하려면 아무 키나 누르십시오 . . .

*/