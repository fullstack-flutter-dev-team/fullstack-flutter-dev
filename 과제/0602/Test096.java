/*===================================================================
	■■■ 배열 ■■■
	-  다차원 배열(배열의 배열)
===================================================================*/

/* 
    ▣ 컴파일 에러 발생 시 
	    Test096.java:2: error: unmappable character (0xE2) for encoding x-windows-949
	    ?뼚?뼚?뼚 諛곗뿴 ?뼚?뼚?뼚
	
	  ==[Javac 인수(E)]==▶ javac -encoding UTF-8 $(FileName)
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
 
     i \ j → 0  1  2  3  4
    ──┯──────────────────
   ↓ 0 ┃    A               → j(0)   <= i(0) → arr[i][j] = ch++;
      1 ┃    B  C            → j(0~1) <= i(1) → arr[i][j] = ch++;
      2 ┃    D  E  F         → j(0~2) <= i(2) → arr[i][j] = ch++;
      3 ┃    G  H  I  J      → j(0~3) <= i(3) → arr[i][j] = ch++;
      4 ┃    K  L  M  N  O   → j(0~4) <= i(4) → arr[i][j] = ch++;
*/


public class Test096
{
	public static void main(String[] args)
	{
		// 변수 선언 및 초기화
		char ch;                     // 출력할 문자를 저장하는 변수
		int nRow, nCol;              // 다차워 배열 행/열 길이 값을 저장하는 변수
		char[][] arr;                // 다차원 배열의 참조형 변수 arr 선언
			
		ch = 'A';                    // 문자형 변수 ch를 'A' 로 초기화 (첫 문자 값)
		nRow = nCol = 5;             // 행/열 길이 설정(5)
		arr = new char[nRow][nCol];  // 다차원 배열 생성(메모리 할당)
		
		
		// 다차원 배열 요소 값 설정
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				if (j <= i)     // 조건이 성립되는 요소에 알파벳 문자 값 할당
				{
					arr[i][j] = ch;
					ch++;
				} else {        // 채우지 않는 요소는 널 문자로 저장
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