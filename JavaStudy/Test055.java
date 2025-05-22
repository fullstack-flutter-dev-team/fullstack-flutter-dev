/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- 반복문(while문) 실습 - 소수 체크
===================================================================*/

/*
	사용자로부터 임의의 두 정수를 입력받아
	입력받은 두 정수 중
	작은 수 부터 큰 수 까지의 합을 구하여
	결과를 출력하는 프로그램을 구현한다.
	
	
	실행 예)
	첫 번째 정수 입력 : 100
	두 번째 정수 입력 : 200
	>> 100 ~ 200 까지의 합 : xxx
	계속하려면 아무 키나 누르세요....
	
	첫 번째 정수 입력 : 1000
	두 번째 정수 입력 : 2
	>> 2 ~ 1000 까지의 합 : xxx
	계속하려면 아무 키나 누르세요...
	
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test055
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nFirstNum, nSecondNum, nStartNum, nFinalNum, nTemp, nSum = 0;
		
		
		// 사용자 안내문구 출력
		System.out.print("첫 번째 정수 입력 : ");
		nFirstNum = Integer.parseInt(br.readLine());
		System.out.print("두 번째 정수 입력 : ");
		nSecondNum = Integer.parseInt(br.readLine());
		
		nStartNum = (nFirstNum >= nSecondNum) ? nSecondNum : nFirstNum;
		nFinalNum = (nFirstNum >= nSecondNum) ? nFirstNum : nSecondNum;
		nTemp = nStartNum;
		
		// 연산
		while (nTemp <= nFinalNum)
		{
			
			// 테스트(확인)
			//System.out.printf("nTemp : %d , nFinalNum : %d\n", nTemp, nFinalNum);
			
			// 누적합 계산
			nSum += nTemp;
			
			nTemp++;
		}
		
		
		// 결과 출력
		System.out.printf(">> %d ~ %d 까지의 합 : %d\n", nStartNum, nFinalNum, nSum);
		*/
		
		// 주요 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int n;			//-- 루프 변서로 활용할 변수
		int su1, su2;	//-- 첫 번째, 두 번째 사용자 입력값을 담아낼 변수
		int result = 0;	//-- 누적합을 담아낼 변수
		
		
		// 연산 및 처리
		System.out.print("첫 번째 정수 입력 : ");
		su1 = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		su2 = Integer.parseInt(br.readLine());
		
		
		//입력받은 두 수의 크기 비교 및 자리 바꿈
		//	즉, su1 이 su2보다 큰 경우 두 수의 자리를 바꿀 수 있도록 처리
			
		if (su1 > su2)
		{
			// 자리 바꿈;
			su1 = su1^su2;
			su2 = su2^su1;
			su1 = su1^su2;
		}
		
		
		//반복 연산 수행
		//반복 연산을 수행하기 전에
		//작은 수를 따로 저장하여 루프 변수로 활용한다.
		//	(결과 출력 과정에서 입력받은 작은 수가 필요한데...
		//	그 수를 직접 연산에 개입시켜 사용하게 되면...
		//	원래의 값을 확인할 수 없기 때문에...)
		
		n = su1;
		
		while (n <= su2)
		{
			result += n;
			n++;
		}
		
		
		// 결과 출력
		System.out.printf(">> %d ~ %d 까지의 합 : %d\n", su1, su2, result);
	}
}