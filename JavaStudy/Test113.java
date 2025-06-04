/*========================================================================
	■■■ 정렬(Sort) 알고리즘 ■■■
	- 향상된 버블 정렬(거품 정렬, Bubble Sort)
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
		 
	
		▣ 향상된 버블 정렬(거품 정렬, Bubble Sort)
			▶ 대상 데이터 배열에 따라서 성능이 달라질 수 있음.
		
		※ 앞에서 본 Selection Sort(Test111) 나 Bubble Sort(Test112)의 성능은 같다.
		    ( → 성능의 추정 근거 : 반복을 수행한 횟수)
		    하지만, 향상된 Bubble Sort는 대상 데이터의 구조에 따라
		    일반 Bubble Sort나 Selection Sort에 비해 성능이 더 좋을 수 있다.
		
		
		실행 예)
		Source Data : 62 12 20 22 30
		Sorted Data : 12 20 22 30 62
		계속하려면 아무키나 누르세요.....
	
*/

/*
 ▣ 힌트: 
      ※ 
 
*/

public class Test113
{
	public static void main(String[] args)
	{
		/*
		{62, 12, 20, 22, 30}
		-----------------------------
		61	12	20	22	30
		==	--
		
		12	62	20	22	30
			==	--
		
		12	20	62	22	30
				==	--
			
		12	20	22	62	30
					==	--
		
		------------------------------ 1 회전 (웅~)
		                               swap 발생  → true  → 다음 회전 진행 O
		12	20	22	30	62
		==	--
		
		12	20	22	30	62
			==	--
			
		12	20	22	30	62
				==	--
		------------------------------ 2 회전 (웅~)
		                               swap 발생  → false  → 다음 회전 진행 X
		*/
		
		/*
		int i, j;
		int[] a = {62, 12, 20, 22, 30};
		boolean isSwap = false;
		
		// 배열 a 전체 출력
		System.out.print("Source Data : ");
		for (int n : a)
		{
			System.out.printf("%4d", n);
		}
		System.out.println();
		
		// 향상된 Bubble Sort
		for (i = 1; i < a.length; i++)
		{
			for (j = 0; j < a.length - i ; j++)
			{
				if (a[j] > a[j+1])
				{
					isSwap = true;
					a[j] = a[j]^a[j+1];
					a[j+1] = a[j+1]^a[j];
					a[j] = a[j]^a[j+1];
				}
			}
			
			if (!isSwap)
			{
				break;
			}
		}
		
		
		// 배열 a 전체 출력
		System.out.print("Sorted Data : ");
		for (int n : a)
		{
			System.out.printf("%4d", n);
		}
		System.out.println();
		
		*/
		
		int[] a = {62, 12, 20, 22, 30};
		boolean flag;
		int pass = 0;
		
		// 배열 a 전체 출력
		System.out.print("Source Data : ");
		for (int n : a)
		{
			System.out.printf("%4d", n);
		}
		System.out.println();
		
		
		// 향상된 버블 정렬
		do						//-- 웅
		{
			flag = false;		//-- 이번 회전에서 자리 바꿈이 발생하지 않을 것이다...
			pass++;
			
			for (int i = 0; i < a.length-pass; i++)
			{
				// 테스트(확인)
				System.out.print("쑝 ");
				
				// 조건
				// if (a[i] < a[i+1])		//-- 비교 기준이 비교 대상보다 작다면    (내림차순 정렬)
				//
				if (a[i] > a[i+1])			//-- 비교 기준이 비교 대상보다 크다면    (오름차순 정렬)
				{
					// 조건
					// 자리바꿈
					a[i] = a[i]^a[i+1];
					a[i+1] = a[i+1]^a[i];
					a[i] = a[i]^a[i+1];
					
					// 자리 바꿈 발생 시 flag = true;
					flag = true;
					// 단, 한 번이라도 스왑(자리바꿈)이 발생하게 되면,
					// flag 변수는 true로 변경~!!!
				}
				
				
			}
			System.out.println(); // 개행
			
		}
		while (flag);			// flag == true
		//-- flag 변수가 false 라는 것은
		//   회전이 구분적으로 발생하는 동안 스왑이 일어나지 않는 경우로
		// 더이상의 반복문 수행은 무의미한 것으로 판단 가능~!!!
		
		
		
		// 배열 a 전체 출력
		System.out.print("Sorted Data : ");
		for (int n : a)
		{
			System.out.printf("%4d", n);
		}
		System.out.println();
		
	}
	
}