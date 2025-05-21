/*===================================================================
	■■■ 연산자(Operator) ■■■
		- 조건 연산자 == 삼항 연산자
===================================================================*/


/*
					 -------------------
					|					|
	피연산자	연산자	피연산자	연산자	피연산자
	--------			-------				--------
		1항					2항					3항


	피연산자		?	피연산자	:		피연산자
	--------			-------				--------
		1항					2항					3항
		
		
		1항의 연산 결과 →  true	→	2항 수행(치환)
		1항의 연산 결과 →  false	→	3항 수행(치환)


*/

// 사용자로부터 임의의 정수를 입력받아
// 입력받은 정수가 짝수인지 홀수인지를 판별하는 프로그램을 구현한다.
// 단, 조건연산자(삼항연산자)를 활용하여 문제를 해결할 수 있도록 한다.


// 실행 예)
// 임의의 정수 입력 : 371

// ====[판별 결과]====
// 371 → 홀수
// ====================
// 계속하려면 아무 키나 누르세요.

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test026
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		int nNum;
		String strRes;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 사용자 입력 안내 
		System.out.print("임의의 정수 입력 : ");
		
		// 연산
		nNum = Integer.parseInt(br.readLine());
		strRes = (nNum % 2) == 0 ? "짝수" : "홀수";
		
		// 결과 출력
		System.out.printf("\n====[판별 결과]====\n");
		System.out.printf("%d → %s\n", nNum, strRes);
		System.out.printf("=====================\n");
		//--결과 출력
		//임의의 정수 입력 : 176

		//====[판별 결과]====
		//176 → 짝수
		//=====================
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		// 주요 변수 선언
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int n;				//-- 사용자로부터 입력받은 임의의 정수를 받아둘 변수
		String strResult;	//-- 홀수인지 짝수인지 대한 판별 결과를 담게 될 변수
		
		// 연산 및 처리
		System.out.print("임의의 정수 입력 : ");
		n = Integer.parseInt(br.readLine()); //-추가:: import java.io.IOException, throws IOException
		
		// 홀수인지 짝수인지에 대한 판별 연산
		// ________  ? _______ : ___________
		//  수식-1		수식-2		수식-3
		// 수식-1 : 참(true) 또는 거짓(false)을 반환할 수 있는 수식 형태로 작성 
		// 수식-2 : 수식-1의 처리 결과가 참(true)일 경우 수행하는 영역
		// 수식-3 : 수식-1의 처리 결과가 거짓(false)일 경우 수행하는 영역
		
		// 입력받은 정수(n)가 홀수인지, 짝수인지 확인하기 위한 연산
		// → n을 2로 나누어 나머지가 0이면			→ n은 짝수
		//							  0이 아니면	→ n은 홀수
		
		// n을 2로 나눈 나머지가 0 이다 ? _______  : _______;

		// n을 2로 나눈 나머지가 0 이다 ?  "짝수"  : "홀수";
		
		//  n % 2 == 0 ?  "짝수"  : "홀수";
		
		// 371 % 2 == 0 ? "짝수" : "홀수";
		
		strResult = (n % 2 == 0) ? "짝수" : "홀수";
		
		// 결과 출력
		System.out.printf("\n====[판별 결과]====\n");
		System.out.printf("%d → %s\n", n, strResult);
		System.out.printf("=====================\n");
		
	}
}