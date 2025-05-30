/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장. 실행흐름의 컨트롤
		- switch 구문
===================================================================*/

//사용자로부터 1 부터 3까지의 정수 중 하나를 입력받아
//입력받은 정수만큼의 별문자(★)가 출력되는 프로그램을 작성한다.
//단, 두 가지 방법으로 구현할 수 있도록 한다.

// ① switch문의 일반 모델을 사용하여 구현한다.
// ② switch문의 기본 모델을 사용하되,
//		『break』를 딱 한 번만 사용할 수 있도록 한다.

//실행 예)
//임의의 정수 입력(1~3) : 3
//★★★
//계속하려면 아무 키나 누르세요...

//임의의 정수 입력(1~3) : 1
//★
//계속하려면 아무 키나 누르세요...


//임의의 정수 입력(1~3) : 7
//입력 오류~!!!
//계속하려면 아무 키나 누루세요...
 
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test041
{
	public static void main(String[] args) throws IOException
	{
		//변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int nNum;
		String strResult;
		//String strResult = "입력 오류~!!!";
		
		
		// 사용자 입력 안내문구 출력
		System.out.print("임의의 정수 입력(1~3) : ");
		
		// 연산
		nNum = Integer.parseInt(br.readLine());
		
		
		/*
		// switch문
		switch (nNum)
		{
			case 3:
				strResult = "★★★";
				break;
			case 2:
				strResult = "★★";
				break;
			case 1:
				strResult = "★";
				break;
		}
		*/
		/*
			switch (nNum)
		{
			case 3:
				strResult = "★★★";
				break;
			case 2:
				strResult = "★★";
				break;
			case 1:
				strResult = "★";
				break;
			default:
				strResult = "입력 오류~!!!";
		}
		*/
		
		/*
		switch (nNum)
		{
			case 3:
				System.out.printf("★");
			case 2:
				System.out.printf("★");
			case 1:
				System.out.printf("★");
				break;
			default:
				System.out.printf("입력 오류~!!!");
		}
		
		System.out.println();
		*/
		
		// 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(InputStreamReader(System.in));
		
		System.out.print("임의의 정수 입력(1~3) : ");
		int n = Integer.parseInt(br.readLine());
		
		/*
		// ①
		switch (n)
		{
			case 1: System.out.println("★"); break;
			case 2: System.out.println("★★"); break;
			case 3: System.out.println("★★★"); break;
			default: System.out.println("입력 오류~!!!"); break;
		}
		*/
		// ②
		switch (n)
		{
			default: System.out.print("입력 오류~!!!");
					break;
			case 3: System.out.print("★");
			case 2: System.out.print("★");
			case 1: System.out.print("★");
		}
		
		System.out.println();
	}
}