/*===================================================================
	■■■ 배열 ■■■
	-  배열의 선언 및 초기화
	-  배열의 기본적 활용
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ ① ② ③ /* */ 

/* 
	사용자로부터 임의의 학생 수를 입력받고
	입력받은 학생 수 만큼의 점수(정수 형태)를 입력받아
	전체 학생 점수의 합, 평균, 편차를 구하여
	결과를 출력하는 프로그램을 구현한다.
	단, 배열을 활용하여 처리할 수 있도록 한다.
	
	실행 예)
	학생 수 입력 : 5
	1번 학생의 점수 입력 : 90
	2번 학생의 점수 입력 : 82
	3번 학생의 점수 입력 : 64
	4번 학생의 점수 입력 : 36
	5번 학생의 점수 입력 : 98
	
	>> 합 : 370
	>> 평균 : 74.0
	>> 편차
	90 : -16.0
	82 : -8.0
	64 : 10.0
	36 : 38.0
	98 : -24.0
	계속하려면 아무키나 누르세요...
*/

import java.util.Scanner;
import java.io.IOException;

public class Test088
{
	public static void main(String[] args)
	{
		/*
		// 변수 선언 및 초기화
		int nSum, nTemp, nCount;
		int[] arrScore;
		double average = 0.0;
		double[] arrDiff;
		Scanner sc = new Scanner(System.in);
		nSum = nTemp = 0;
		
		System.out.print("학생 수 입력 : ");
		nCount = sc.nextInt();
		arrScore = new int[nCount];
		//System.out.println("학생 수 : " + nCount);
		
		// 학생 수 입력
		do
		{
			System.out.printf("%d번 학생의 점수 입력 : ", (nTemp+1));
			arrScore[nTemp] = sc.nextInt();
			nTemp++;
		}
		while (nTemp < nCount);
		
		// 총합 연산
		for (int i = 0; i < arrScore.length; i++)
		{
			nSum += arrScore[i];
		}
		
		//평균 연산
		average = (double)nSum / (arrScore.length);
		
		//결과 출력
		System.out.printf(">> 총합 : %d\n", nSum);
		System.out.printf(">> 평균 : %.1f\n", average);
		
		//편차 출력
		System.out.println(">> 편차");
		for (int i = 0; i < arrScore.length; i++)
		{
			nSum += arrScore[i];
			System.out.printf("%d : %.1f\n", arrScore[i], (average - arrScore[i]));
		}
		//-- 실행 결과
		//학생 수 입력 : 5
		//1번 학생의 점수 입력 : 90
		//2번 학생의 점수 입력 : 82
		//3번 학생의 점수 입력 : 64
		//4번 학생의 점수 입력 : 36
		//5번 학생의 점수 입력 : 98
		//>> 총합 : 370
		//>> 평균 : 74.0
		//>> 편차
		//90 : -16.0
		//82 : -8.0
		//64 : 10.0
		//36 : 38.0
		//98 : -24.0
		//계속하려면 아무 키나 누르십시오 . . .		
		*/
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("학생 수 입력 : ");
		int count = sc.nextInt();			//-- ex) 5
		
		//배열의 선언 및 정의(메모리 할당)
		int[] a = new int[count];			//-- new int[5]; → 0 ~ 4 가능, 5 불가능.
		
		// 총합
		int tot = 0;		//-- 누적합 연산을 위한 초기화
		double avg;
		
		
		//반복해서 입력받는 과정 수행
		for (int i = 0; i < count; i++)
		{
			System.out.print("학생의 점수 확인 : ");
			a[i] = sc.nextInt();
			tot += a[i];
		}
		
		
		// (총점 / 인원수) → 평균
		//avg = tot / count;
		avg = (double)tot / a.length;

		System.out.println("\n>> 총합 : " + tot);
		System.out.printf(">> 평균 : %.1f\n", avg);
		System.out.println(">> 편차");
	
		/*
		for (int i = 0; i < a.length; i++)
		{
			System.out.printf("%d : %.1f\n",a[i], (avg - a[i]));
		}
		*/
		
		//향상된 for 문(forEach 구문)
		/*
		for (타입 변수명 : 자료구조 )  → 우측의 자료구조 부터 기입 권장
		{
			변수명을 이용한 처리;
		}
		*/
		
		/*
		for (int n : a)
		{
			System.out.println("for문이 회전");
			System.out.println("n : " + n);
		}
		*/
		
		for (int n : a)
		{
			//System.out.println(n + " : " + (avg - n));
			System.out.printf("%d : %.1f\n", n, (avg - n));
		}
	}
}