/*========================================================================
	■■■ 정렬(Sort) 알고리즘 ■■■
	- 선택 정렬(Selection Sort)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ㄷ

/* 

*/

/* 
    ○ 정렬(Sort)
	    여러 데이터를 특정한 규칙(기준)에 맞게 순서대로 나열(오름차순, 내림차순)

	○ 정렬의 목적
	    데이터 처리 과정의 편의성이나 가독성을 높이기 위함
		보기 좋게, 찾아보기 쉽게 (검색하기 위함)
		 
	○ 정렬의 종류
		선택 정렬, 버블 정렬, 삽입 정렬, 힙 정렬, 퀵 정렬, 쉘 정렬, ...
		 
	
		▣ 선택 정렬(Selection Sort)
		
		실행 예)
		Source Data : 52 42 12 62 60
		Sorted Data : 12 42 52 60 62
		계속하려면 아무키나 누르세요.....
	
*/

/*
 ▣ 힌트: 
      ※ 
 
*/

public class Test111
{
	public static void main(String[] args)
	{
		
		/*
			{52, 42, 12, 62, 60}
		---------------------------------------
			52	42	12	62	60
			==	--
		
			42	52	12	62	60
			==		--
		
			12	52	42	62	60
			==			--
		
			12	52	42	62	60
			==				--
		----------------------------------- 1회전 (웅~)
			12	52	42	62	60
				==	--	
			
			12	42	52	62	60
				==		--	
			
			12	42	52	62	60
				==			--	
		----------------------------------- 2회전 (웅~)
			12	42	52	62	60
					==	--	
			
			12	42	52	62	60
					==		--	
		----------------------------------- 3회전 (웅~)
			12	42	52	62	60
						==	--	
		----------------------------------- 4회전 (웅~)
			12	42	52	60	62	
		*/
		
		/*
		int[] arrOri = {52, 42, 12, 62, 60};
		int[] arrSorted = new int[arrOri.length];
		int nTemp;
		
		for (int i=0; i< arrOri.length; i++)
		{
			for (int j = i+1; j < arrOri.length; j++)
			{
				if (arrOri[i] > arrOri[j])
				{
					nTemp = arrOri[i];
					arrOri[i] = arrOri[j];
					arrOri[j] = nTemp;
				}
			}
					//arrSorted[i] = arrOri[i];
		}
		
		
		for (int i = 0; i < arrOri.length; i++)
		{
			System.out.printf("%3d", arrOri[i]);
		}
		
		System.out.println(); // 개행
		*/
		
		int[] a = {52, 42, 12, 62, 60};
		int i, j;
		
		
		// 향상된 for문(foreach 구문)
		System.out.print("Source Data : ");
		for (int n : a)
		{
			System.out.printf("%3d", n);
		}
		System.out.println(); // 개행
		
		// 정렬 → Selection Sort 구현 
		for (i = 0; i < (a.length-1); i++)		//-- 웅~~~	→ 비교 기준 데이터(0     1   2  3)
		{										//								|     |   |  |
			for (j = i+1; j < a.length; j++)	//-- 쑝쑝쑝	→ 비교 대상 데이터(1234  234 34 4)
			{
				// 크기 비교
				// if (a[i] < a[j]) 비교 기준이 비교 대상보다 작다면...(내림차순 정렬)
				if (a[i] > a[j])    //비교 기준이 비교 대상보다 크다면...(오름차순 정렬)
				{
					// 자리 바꿈 → a[i] 와 a[j]의 자리 바꿈
					a[i] = a[i]^a[j];
					a[j] = a[j]^a[i];
					a[i] = a[i]^a[j];
				}
			}
		}
		
		// 배열 a 전체 요소 출력
		//System.out.print("Source Data : ");

		//for (i = 0; i < a.length; i++)
		//{
		//	System.out.printf("%3d", a[i]);
		//}
		//System.out.println(); // 개행
		
		// 향상된 for문(foreach 구문)
		System.out.print("Sorted Data : ");
		for (int n : a)
		{
			System.out.printf("%3d", n);
		}
		System.out.println(); // 개행
		
	}
}

//--
//Source Data :  52 42 12 62 60
//Sorted Data :  12 42 52 60 62
//계속하려면 아무 키나 누르십시오 . . .