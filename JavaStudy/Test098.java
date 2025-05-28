/*===================================================================
	■■■ 배열 ■■■
	-  배열과 난수 처리(※ Random 클래스 활용)
===================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛

/* 
	
*/

/* 
	사용자로부터 임의의 정수를 입력받아
	그 정수의 갯수만큼 난수(1~100)를 발생시켜
	이 값들을 배열에 담고,
	배열에 담겨있는 데이터들 중
	가장 큰 값과 가장 작은 값을 선택하여
	결과를 출력하는 프로그램을 구현한다.
	
	※ 난수 발생 전용 객체  → 『java.util.Random』
	
	실행 예)
	발생시킬 난수의 갯수 입력 : 10
	(내부적으로 무작위 난수 발생    → 50 78 93 61 13 5 46 1 35 22)
	(발생한 난수를 배열에 담아내기  →  int[] arr = {50, 78, 93, 61, 13, 5, 46, 1, 35, 22})
	배열 전체 출력 : 50 78 93 61 13 5 46 1 35 22
	가장 큰 값 : 93, 가장 작은 값 : 1
	계속하려면 아무 키나 누르세요....

*/

/*
 ▣ 힌트:
    
*/

import java.util.Scanner;
import java.util.Random;

public class Test098
{
	public static void main(String[] args)
	{
		//Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);
		
		// 주요 변수 선언
		int size, nMax,nMin, nTemp; //-- 사용자의 입력값을 담아낼 변수 → 배열의 길이 결정
		
		System.out.print("발생시킬 난수의 갯수 입력 : ");
		size = sc.nextInt();
		
		//확인(테스트)
		//System.out.println("난수 갯수 : " + size);
		
		//size 변수에 담아낸 수 만큼의 방(길이)를 가진 배열 만들기
		//즉, 배열 선언 및 메모리 할당
		int[] arr  = new int[size];
		
		// 무작위 정수(난수)를 발생시키기 위해서는
		// 난수 발생 전용 객체가 필요하다.
		// → 『java.util.Random』 
		Random rd = new Random();
		//-- Random 클래스 인스턴스 생성
		
		
		// ※ Random 객체의 『nextInt(n)』 메서드
		//    0 ~ 매개변수로 넘겨받은 정수 n → (n-1) 까지의 수 중
		//    무작위 정수(난수) 1개를 발생시킨다.
		//    ex)
		//      rd.nextInt(10); // → 0 ~ 9 중 1개 발생
		
		//테스트(확인)
		//System.out.println("발생한 난수 확인 : " +  rd.nextInt(10));
		// 0 ~ 9 사이의 범위 내에서 무작위 정수 한 개 발생~~
		
		for (int i = 0; i < arr.length; i++)
		{
			int temp = rd.nextInt(100);
			arr[i] = (temp == 0) ? rd.nextInt(100) : temp;
		}
		
		// 변수 초기화
		nMax = nMin = arr[0];
		
		// 배열요소 전체 출력
		System.out.print("배열 전체 출력 : ");
		
		for (int i = 0; i < arr.length; i++)
		{
			System.out.printf("%3d", arr[i]);
			
			nTemp = arr[i];
			nMax = (nTemp > nMax) ? nTemp : nMax;
			nMin = (nTemp < nMin) ? nTemp : nMin;
		}
		
		System.out.println();
		System.out.printf("가장 큰 값 : %2d, 자장 작은 값 : %2d\n", nMax, nMin);
		//--실행 결과
		//발생시킬 난수의 갯수 입력 : 15
		//배열 전체 출력 :  15 30 25 52 16 90 98 96  6 57 26 81 84 73 26
		//가장 큰 값 : 98, 자장 작은 값 :  6
		//계속하려면 아무 키나 누르십시오 . . .
		
	}
}