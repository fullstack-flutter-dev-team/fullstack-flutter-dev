/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- return 실습
===================================================================*/

/*
	※ return 키워드가 지니는 의미
		1. 값의 반환
		2. 메서드 종료
		→ 	
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test071
{
	public static void main(String[] args) throws IOException
	{
		// BufferedReader 인스턴스(→ 객체) 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int n, s;
		
		System.out.print("임의의 정수 입력(10 이상) : ");
		n = Integer.parseInt(br.readLine());
		
		if (n < 10)
		{
			System.out.println("10 이상의 정수를 입력해야 합니다.");
			return;					// return xxx;
			//-- 메서드 종료 → return 문을 포합하고 있는 메서드
			//	→ main() 메서드  → 프로그램 종료
			
		}
		
		s = 0;
		
		for (int i = 1; i <= n; i++)
		{
			s += i;
		}
		
		System.out.println(">> 연산 결과 : " + s);
	}
}