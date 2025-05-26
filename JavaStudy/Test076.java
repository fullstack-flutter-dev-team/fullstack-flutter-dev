/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
===================================================================*/


/*
사용자로부터 임의의 정수를 입력받아
1부터 입력받은 수 까지의 합을 연산하여
결과값을 출력하는 프로그램을 구현한다.


단, 지금까지처럼 main() 메서드에모든 기능을 적용하는 것이 아니라
클래스와 신스턴스의 개념을 활용하여 처리할 수 있도록 한다.
( → Hap 클래스 설계)
또한, 입력 처리 과정에서 BufferedReader 의 readLine() 을 활용하며,
입력 데이터가 1보다 작거나 1000 보다 큰 경우
다시 입력받을 수 있는 처리를 포함하여 구현한 수 있도록 한다.

실행 예)

임의의 정수 입력(1~1000) ; 1050
임의의 정수 입력(1~1000) ; -50
임의의 정수 입력(1~1000) ; 100
>> 1 ~ 100 까지의 합 : 5050
계속하려면 아무 키나 누르세요...
*/


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class Hap
{
	//클래스 속성(glocal변수)
	int nNum;
	
	
	//정수 사용자 입력 처리
	void input() throws IOException
	{
		// 변수 선언
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nInNum;
		
		do
		{
			//사용자 입력 안내문구 출력
			System.out.print("임의의 정수 입력(1~1000) : ");
			nInNum = Integer.parseInt(br.readLine());
		}
		while (nInNum < 1 || nInNum > 1000);
		
		nNum = nInNum;
	}
	
	//정수합 연산
	int calSum()
	{
		int nSum = 0;
	
		for (int i = 1; i <= nNum; i++)
		{
			nSum += i;
		}
		
		return nSum;
	}
	
	void print(int sum)
	{
		//정수 합 출력
		//>> 1 ~ 100 까지의 합 : 5050
		System.out.printf(">> 1 ~ %d 까지의 합 : %d\n", nNum, sum);
	}

}

public class Test076
{
	public static void main(String[] args) throws IOException
	{
		// 변수 선언
		Hap ob = new Hap();
		int nSum;
		
		//정수 사용자 입력
		ob.input();
		
		//정수 합 연산
		nSum = ob.calSum();
		
		//정수 합 출력
		ob.print(nSum);
		
	}
}

//--실행 결과
/*

임의의 정수 입력(1~1000) : -10
임의의 정수 입력(1~1000) : 1050
임의의 정수 입력(1~1000) : 100
>> 1 ~ 100 까지의 합 : 5050
계속하려면 아무 키나 누르십시오 . . .

*/