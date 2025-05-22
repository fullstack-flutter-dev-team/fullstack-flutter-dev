/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- 반복문(while문) 실습 
===================================================================*/

/*
	○과제
	사용자로부터 임의의 정수를 입력받아
	1부터 입력받은 그 정수까지의
	전체 합과, 짝수의 합과, 홀수의 합을
	각각 결과값으로 출력하는 프로그램을 구현한다.
	
	실행 예)
	임의의 정수 입력 : 586
	>> 1 에서 586까지 정수의 합 : 
	>> 1 에서 586까지 짝수의 합 : 
	>> 1 에서 586까지 홀수의 합 :
	계속하려면 아무 키나 누르세요....
	
	
*/

public class Test056
{
	public static void main(String[] args)
	{
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nIndex, nInNum, nTotalSum, nEvenSum, nOddSum;
		nTotalSum = nEvenSum = nOddSum = 0;
		nIndex = 1;
		
		// 사용자 입력 안내문구 출력
		System.out.print("임의의 정수 입력 : ");
		nInNum = Integer.parseInt(br.readLine());
		
		// 연산
		if (nInNum > 0)
		{
			while ()
			{
			}
		} else {
			System.out.println("입력오류~!! (1보다 큰 정수 입력)");
		}
		
		// 결과 출력
	}
}