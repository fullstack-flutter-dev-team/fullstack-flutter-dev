/*===================================================================
	■■■ 배열 ■■■
	-  배열의 선언과 초기화
	-  배열의 기본적 활용
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ ① ② ③ /* */ 

/* 
	사용자로부터 임의의 정수를 임의의 갯수만큼 입력받아
	입력받은 수 중에서 가장 큰 수를 출력하는 프로그램을 구현한다.
	단, 배열을 활용하여 구현할 수 있도록 한다.
	
	
	실행 예)
	입력할 데이터의 갯수   : 12
	데이터 입력(공백 구분) : 74 65 12 198 36 67 42 88 50 25 17 46

	
	>> 전체 출력 : 74 65 12 198 36 67 42 88 50 25 17 46
	>> 가장 큰 수 → 98
	계속하려면 아무 키나 누르세요...
*/

import java.util.Scanner;
import java.io.IOException;

public class Test087
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		int[] arr;
		int nCount, nTemp, nMaxNum;
		Scanner sc = new Scanner(System.in);
		nTemp = nMaxNum = 0;
		
		System.out.print("입력할 데이터의 갯수 : ");
		nCount = sc.nextInt();
		//nCount = System.in.read() - '0'; // 한자리 문자 입력에 사용
		System.out.println("nCount : " + nCount);
			
		arr = new int[nCount];
		
		System.out.print("데이터 입력(공백 구분) : ");
		
		do
		{
			arr[nTemp] = Integer.parseInt(sc.next());
			//System.out.println("nTemp : " + nTemp + ", nCount :" + nCount);
			nTemp++;
		}
		while(nTemp < nCount);
		
		System.out.println();
		System.out.print(">> 전체 출력 : ");
		
		//전체 출력 & 가장 큰 수 
		for (int i = 0; i < arr.length; i++)
		{
			if (arr[i] > nMaxNum)
			{
				nMaxNum = arr[i];
			}
			
			System.out.print(arr[i] + " ");
		}

		System.out.printf("\n>> 가장 큰 수 →  %d\n", nMaxNum);
		//---실행 결과
		//입력할 데이터의 갯수 : 12
		//데이터 입력(공백 구분) : 74 65 2 198 36 67 42 8 50 25 17 46

		//>> 전체 출력 : 74 65 2 198 36 67 42 8 50 25 17 46
		//>> 가장 큰 수 → 198
		//계속하려면 아무 키나 누르십시오 . . .		
		*/
		
		// 변수 선언 및 초기화
		Scanner sc = new Scanner(System.in);
		
		System.out.print("입력할 데이터의 갯수 : ");
		int size = sc.nextInt();
		
		
		// 입력받은 수 만큼의 길이를 갖는 배열 생성
		int[] arr = new int[size];
		
		// 사용자에게 안내 메세지 출력
		System.out.print("데이터 입력(공백 구분) : ");
		
		//  입력받아오는 항목의 갯수만큼 반복할 수 있는 코드 구성
		//  → 공백으로 구분되어 입력된 데이터를 배열에 담아내기
		//for (int a = 0; a < size; a++)
		for (int a = 0; a < arr.length; a++)
		{
			arr[a] = sc.nextInt();
		}
		
		
		// 배열 요소 전체 출력
		System.out.print("\n>> 전체 출력 : ");				// 30 20 10 50 40
		
		int max = arr[0];			//--최대값을 담을 변수	// 30
		
		for (int a = 0; a < arr.length; a++)
		{
			System.out.print(arr[a] + " ");					// 30 20 10 50 40
			
			// 배열 요소를 출력하는 동안 가장 큰 값 저장	// 30 30 30 50 50
			if (max < arr[a])
			{
				max = arr[a];
			}
		}
		
		System.out.println();	//개행
		
		//가장 큰 수 출력
		System.out.printf(">> 가장 큰 수  →  %d\n", max);
	}
}

//-- 실행 결과
/*
입력할 데이터의 갯수 : 5
데이터 입력(공백 구분) : 30 20 10 50 40

>> 전체 출력 : 30 20 10 50 40
>> 가장 큰 수  →  50
계속하려면 아무 키나 누르십시오 . . .

*/