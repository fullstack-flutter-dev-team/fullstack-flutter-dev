/*========================================================================
	■■■ 정렬(Sort) 알고리즘 ■■■
	- 버블 정렬(거품 정렬, Bubble Sort)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ㄷ

/* 

*/

/* 
    ○ 정렬
	    여러 데이터를 특정한 규칙(기준)에 맞게 순서대로 나열(오름차순, 내림차순)

	○ 정렬의 목적
	     데이터 처리 과정의 편의성이나 가독성을 높이기 위함
		 보기 좋게 찾아보기 쉽게 (검색하기 위함)
		 
	○ 정렬의 종류
		선택 정렬, 버블 정렬, 삽입 정렬, 힙 정렬, 퀵 정렬, 쉘 정렬, ...
		 
	
		▣ 버블 정렬(거품 정렬, Bubble Sort)
		
		실행 예)
		Source Data : 52 42 12 62 60
		Sorted Data : 12 42 52 60 62
		계속하려면 아무키나 누르세요.....
	
*/

/*
 ▣ 힌트: 
      ※ 
 
*/

public class Test112
{
	public static void main(String[] args)
	{
		/*
			{52, 42, 12, 62, 60}
		-----------------------------------
			52	42	12	62	60
			==	--
		
			42	52	12	62	60
				==	--
		
			42	12	52	62	60
					==	--
		
			42	12	52	62	60
						==	--
		----------------------------------- 1회전 (웅~)
			42	12	52	60	62
			==	--	
			
			12	42	52	60	62
				==	--	
			
			12	42	52	60	62
					==	--	
		----------------------------------- 2회전 (웅~)
			12	42	52	60	62
			==	--	
			
			12	42	52	60	62
				==	--	
		----------------------------------- 3회전 (웅~)
			12	42	52	60	62
			==	--	
		----------------------------------- 4회전 (웅~)
		*/
		
		/*
		int i, j;
		int[] arrOri = {52, 42, 12, 62, 60};
		int[] arrSorted = new int[arrOri.length];
		
		for (i = 0; i < arrOri.length-1; i++)
		{
			for (j = 0; j < arrOri.length-1; j++)
			{
				if (arrOri[j] > arrOri[j+1])
				{
					arrOri[j] = arrOri[j]^arrOri[j+1];
					arrOri[j+1] = arrOri[j+1]^arrOri[j];
					arrOri[j] = arrOri[j]^arrOri[j+1];
				}
			}
			arrSorted[i] = arrOri[i];
		}
		
		
		for (int n : arrOri)
		{
			System.out.printf("%4d", n);
		}
		System.out.println();
		
		*/
		
		int i, j;
		int[] a = {52, 42, 12, 62, 60};
		int[] arrOri = {52, 42, 12, 62, 60};
		int[] arrSorted = new int[arrOri.length];
		
		// 배열 a 전체 요소 출력
		System.out.print("Source Data : ");
		for (int n : arrOri)
		{
			System.out.printf("%4d", n);
		}
		System.out.println();
		
		// 정렬 → Bubble Sort 구현
		for (i = 1; i < a.length; i++)			//-- i → 1     2   3  4 → 뒤에서 비교 대상을 하나씩 줄여나가는 역활
		{										//        |     |   |  |
			for (j = 0; j < a.length - i; j++)	//-- j → 0123  012 01 0 → 비교 기준
			{									//        1234  123 12 1 → 비교 대상(비교기준 + 1)
				//if (a[j] < j[j+1])	//-- 비교 기준이 비교 대상보다 작다면...(내림차순 정렬)
				if (a[j] > a[j+1])	//-- 비교 기준이 비교 대상보다 작다면...(오름차순 정렬)
				{
					// 자리 바꿈
					a[j] = a[j]^a[j+1];
					a[j+1] = a[j+1]^a[j];
					a[j] = a[j]^a[j+1];
				}
			}
		}
		
		
		
		// 배열 a 전체 요소 출력
		System.out.print("Sorted Data : ");
		for (int n : a)
		{
			System.out.printf("%4d", n);
		}
		System.out.println();
		
	}
	
	
}

//--
//Source Data :   52  42  12  62  60
//Sorted Data :   12  42  52  60  62
//계속하려면 아무 키나 누르십시오 . . .