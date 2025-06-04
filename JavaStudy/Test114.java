/*========================================================================
	■■■ 정렬(Sort) 알고리즘 ■■■
	-  
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ㄷ

/* 

*/

/* 
    사용자로부터 여러 학생의 성적 데이터를 입력받아
	점수가 높은 학생부터 낮은 순으로 등수를 부여하여
	결과를 출력하는 프로그램을 구현한다.
	단, 배열과 정렬 알고리즘을 활용하여 작성할 수 있도록 한다.
	
	실행 예)
	인원 수 입력 : 5
	이름 점수 입력(1, 공백 구분) : 김주x 90
	이름 점수 입력(2, 공백 구분) : 유x 88
	이름 점수 입력(3, 공백 구분) : 이동x 85
	이름 점수 입력(4, 공백 구분) : 이민x 75
	이름 점수 입력(5, 공백 구분) : 이승x 95
	
	----------------------
	1등		이승x		95
	2등		김주x		90
	3등		이동x		85
	4등		 유x		80
	5등		이민x		75
	----------------------
	계속하려면 아무 키나 누르십시오 . . .
*/

/*
 ▣ 힌트: 
      ※ 
 
*/

import java.io.IOException;
import java.util.Scanner;

public class Test114
{
	private String[] arrName;	//-- 학생 이름을 저장하는 배열
	private int[] arrScore;		//-- 학생 점수를 저장하는 배열
	private int nCount;			//-- 학생 인원 수
	
	public void input() throws IOException
	{
		// 참조형 변수 선언 및 인스턴스 생성
		Scanner sc = new Scanner(System.in);
		
		do
		{
			// 사용자 입력문구 출력(인원 수)
			System.out.print("인원 수 입력 : ");
			nCount = sc.nextInt();
		}
		while (nCount < 1);
		
		//확인(테스트)
		//System.out.println("nCount: " + nCount);
		
		// 배열 참조형 변수 인스턴스 생성
		arrName = new String[nCount];
		arrScore = new int[nCount];
		
		for (int i = 0; i < nCount; i++)
		{
			// 사용자 입력문구 출력(이름 점수)
			System.out.printf("이름 점수 입력(%d, 공백 구분) : ", i+1);
			arrName[i] = sc.next();
			arrScore[i] = sc.nextInt();
		}
		
		// close scanner
		sc.close();
		
		// 점수 기준으로 정렬(이름배열 요소도 함께 자리바꿈)
		sortData();
	}
	
	private void sortData()
	{
		// 이름 배열(arrName) 요소 swap시 사용할 임시변수
		String strTemp;
			
		// 점수 기준으로 점수 배열 요소를 내림차순으로 정렬(버블 정렬)
		// 점수 정렬 과정에서 발생하는 swap 시 이름 배열 요소도 함께 swap시킴
		for (int i = 1; i < arrScore.length; i++)
		{
			for (int j = 0; j < arrScore.length - i; j++)
			{
				if (arrScore[j] < arrScore[j+1])
				{
					// 점수 배열요소 자리바꿈
					arrScore[j] = arrScore[j]^arrScore[j+1];
					arrScore[j+1] = arrScore[j+1]^arrScore[j];
					arrScore[j] = arrScore[j]^arrScore[j+1];
					
					// 이름 배열요소 자리바꿈
					strTemp = arrName[j+1];
					arrName[j+1] = arrName[j];
					arrName[j] = strTemp;
				}
			}
		}
		
		
		// 석차 출력
		print();
	}
	
	private void print()
	{
		System.out.println(); // 개행
		
		// 라인 삽입
		drawLine('-', 20);
		
		for (int i = 0; i < nCount; i++)
		{
			System.out.printf("%d등\t%s\t%d\n", i+1, arrName[i], arrScore[i]);
		}
		
		// 라인 삽입
		drawLine('-', 20);
	}
	
	public void drawLine(char ch, int count)
	{
		for (int i=0; i < count; i++)
		{
			System.out.print(ch);
		}
		
		System.out.println();
	}
	
	public static void main(String[] args) throws IOException
	{
		// 인스턴스 생성
		Test114 obj = new Test114();
		
		// 학생 인원 수, 이름, 점수 입력 & 석차 출력
		obj.input();
	}
	
}
//-- 실행 결과
//인원 수 입력 : 5
//이름 점수 입력(1, 공백 구분) : 김주x 90
//이름 점수 입력(2, 공백 구분) : 유x 80
//이름 점수 입력(3, 공백 구분) : 이동x 85
//이름 점수 입력(4, 공백 구분) : 이민x 75
//이름 점수 입력(5, 공백 구분) : 이승x 95

//--------------------
//1등     이승x  95
//2등     김주x  90
//3등     이동x  85
//4등     유x    80
//5등     이민x  75
//--------------------
//계속하려면 아무 키나 누르십시오 . . .