/*===================================================================
	■■■ 배열 ■■■
	-  배열과 난수 처리(※ Random 클래스 활용) ★
===================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛

/* 
	
*/

/* 
	사용자로부터 임의의 정수를 입력받아
	그 정수의 갯수만큼 난수(1~100)를 발생시켜 a 배열에 담고,
	다시 사용자가 입력하는 값을 공백으로 구분하여 b 배열을 구성한 후
	두 배열의 요소를 합집합 형태로 출력하는 프로그램을 구현한다.
	
	실행 예)
	발생시킬 난수의 갯수 입력 : 5
	 (내부적으로 무작위 난수 발생  → 10 7 2 11 20)
	 (배열에 담아내기 → int[] a = {10, 7, 2, 11, 20})
	 
	구성할 배열의 길이 입력 : 4
	임의의 정수로 배열 구성(공백 구분) : 2 10 14 6
	>> 10 7 2 11 20 14 6
	계속하려면 아무키나 누르세요...
*/

/*
 ▣ 힌트:
    
*/

import java.util.Scanner;
import java.util.Random;

public class Test099
{
	public static void main(String[] args)
	{
		/*
		//변수 선언 및 초기화
		int[] a, b;
		int nArrLengthA, nArrLengthB, nTemp, count;
		Scanner sc = new Scanner(System.in);
		Random rd = new Random();
		
		//사용자 입력문구 출력 & 난수의 갯수 입력
		System.out.print("발생시킬 난수의 갯수 입력 : ");
		nArrLengthA = sc.nextInt();
		a = new int[nArrLengthA];
		
		//확인(테스트)
		//System.out.printf("난수 개수: %d\n", nArrLengthA);
		
		
		// 배열 a 초기화
		for (int i = 0; i < nArrLengthA; i++)
		{
			a[i] = rd.nextInt(100) + 1;
		}
		
		//확인(테스트)
		System.out.print("(내부적으로 무작위 난수 발생 → a = {");
		for (int i = 0; i < nArrLengthA; i++)
		{
			if (i == nArrLengthA-1)
			{
				System.out.printf("%3d", a[i]);
			} else {
				System.out.printf("%3d,", a[i]);
			}
			
		}
		System.out.println("})");  // 개행
		
		//------------------------
		
		System.out.print("구성할 배열의 길이 입력 : ");
		nArrLengthB = sc.nextInt();
		b = new int[nArrLengthB];
		//System.out.printf("난수 개수: %d\n", nArrLengthB);
		
		
		System.out.print("임의의 정수로 배열 구성(공백 구분) : ");
		
		for (int i = 0; i < nArrLengthB; i++)
		{
			b[i] = sc.nextInt();
		}
		
		//확인(테스트)
		//System.out.print("array b : ");
		//for (int i = 0; i < nArrLengthB; i++)
		//{
		//	System.out.printf("%3d ", b[i]);
		//}
		//System.out.println();  // 개행
	
		// 배열 a 와 배열 b 요소 합집합 출력
		System.out.print(">> ");
		for (int i = 0; i < nArrLengthA; i++)
		{
			System.out.printf("%3d ", a[i]);
		}
		
		// 배열 b에서 배열 a에 없는 요소만 출력
		for (int i = 0; i < nArrLengthB; i++)
		{
			count = 0;
			nTemp = b[i];
			
			for (int j = 0; j < nArrLengthA; j++)
			{
				if (nTemp == a[j])
				{
					count++;
				}
			}
			
			if (count == 0)
			{
				System.out.printf("%3d ", b[i]);
			}
		}
		
		System.out.println();  // 개행
		//--실행 결과
		//발생시킬 난수의 갯수 입력 : 10
		//(내부적으로 무작위 난수 발생 → a = { 49, 38, 69, 52, 39, 55, 60, 42, 19, 17})
		//구성할 배열의 길이 입력 : 3
		//임의의 정수로 배열 구성(공백 구분) : 19 17 100
		//>>  49  38  69  52  39  55  60  42  19  17 100
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		// 두 배열 구성
		int[] a = {10, 7, 2, 11,20};
		int[] b = {2, 10, 14, 6};
		
		// 집합 a(→ a 배열) 전체 출력
		for (int n = 0; n < a.length; n++)
		{
			System.out.print(a[n] + " ");
		}
		
		
		// 집합 b(→ b 배열) 선.택.적 출력
		for (int n = 0; n < b.length; n++)                    //-- b 배열의 길이만큼 반복
		{
			// 사전 확인 과정
			// b 배열에서 현재 출력할 요소를 a배열의 각 요소와 비교
			// 같은 값이 발견된다면... 현재 위치에서 뒷 부분 무시

			boolean flag = false;
			
			// a 배열의 각각의 요소들과 비교하여 확인
			for (int m = 0; m < a.length; m++)  //--  a 배열의 길이만큼 반복
			{
				if (b[n] == a[m])               //-- 같은 값 발견
				{
					flag = true;
					break;  // ★성능 개선★     b 배열의 해당 요소를 출력하기 전에
					        //                   a 배열의 특정 요소에서 같은 값이 발견되면
							//                   더 이상의 반복은 무의미하다고 판단하여
							//                   남아있는 다른 요소들과 더이상 비교하지 않도록 처리
				}
			}
			
			if (flag)                         // flag == true
			{
				continue;                     // ★(뒷부분 무시하고 +) 계속해라
			}
			
			System.out.print(b[n] + " ");     //-- 뒷부분
		}
		
		System.out.println();
		//--실행결과
		//10 7 2 11 20 14 6
		//계속하려면 아무 키나 누르십시오 . . .		
	}
}