/*===================================================================
	■■■ 자바의 개요 및 특징 ■■■
		- 변수와 자료형
		- 자바 기본 입출력 : System.in.read()
===================================================================*/
import java.io.IOException;

/*
	⌈System.in.read()⌋ 메소드는 (입력 대기열로부터) 한 문자만 가져온다.
	단, 입력받은 하나의 문자를 그대로 가져오는 거이 아니라.
	ASCII Code 값으로 반환하게 된다.
*/

// 실행 예)
// 한 문자 입력			: B
// 한 자리 정수 입력	: 7

// >> 입력한 문자	: B
// >> 입력한 정수	: 7
// 계속하려면 아무 키나 누르세요...

public class Test015
{
	public static void main(String[] args) throws IOException
	{
		
		/*
		// 주요 변수 선언
		char ch;			//-- 문자
		int nCh;
		
		// 연산 및 처리
		//System.out.print("문자 하나를 입력하세요 :");
		//ch = System.in.read();	// import java.io.IOException, throws IOException 추가, 컴파일 에러 발생
		//Test015.java:33: error: incompatible types: possible lossy conversion from int to char
		//ch = System.in.read();	// import java.io.IOException, throws IOException 추가
		//ch = 66;	// 데이터형이 다름
		//ch = (char)66;	// 명시적 형변환
		//ch = (char)System.in.read();	// 
		//nCh = System.in.read();
		
		// 결과 출력
		//System.out.println("ch : " + ch);
		//System.out.println("nCh : " + nCh);
		*/
		
		
		// 주요 변수 선언
		char ch, ch2;		//-- 입력받은 문자를 담을 변수
		int n;			//-- 입력받은 정수를 담을 변수
		
		
		// 연산 및 처리
		// - 사용자에게 안내 메세지 출력
		System.out.print("한 문자 입력 : ");
		
		// - 사용자가 입력한 데이터를 변수에 담아내기
		ch = (char)System.in.read(); // Enter : (\r + \n)
		
		//  ▼
		//-------------------------------
		//	A 엔터
		//------------------------------
		//	  =====
		//	(\r + \n)
		
		//  ▼
		//-------------------------------
		//	A + \r + \n
		//------------------------------
		
		
		// - 사용자에게 안내 메세지 출력
		System.out.print("한 자리 정수 입력 : ");
		//System.in.read();
		//System.in.read();
		// check~!!!
		// 입력 대기열에 남아있는 엔터()를 건너뚜기(skip)
		System.in.skip(2);
		//-- 매개변수 (2)
		//              ▼
		//-------------------------------
		//	A + \r + \n
		//------------------------------
		
		// - 사용자가 입력한 데이터를 변수에 담아내기
		//ch2 = (char)System.in.read();
		n = System.in.read() - 48;
		// 1 → 49
		// 2 → 50
		//   ....
		
		// 결과 출력
		System.out.println();
		System.out.printf(">> 입력한 문자 : %c\n", ch);
		//System.out.printf(">> 입력한 정수 : %d\n", ch2);
		System.out.printf(">> 입력한 정수 : %d\n", n);
	}
}