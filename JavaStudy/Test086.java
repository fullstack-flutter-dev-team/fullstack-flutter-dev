/*===================================================================
	■■■ 배열 ■■■
	-  배열의 선언 및 초기화
	-  배열의 기본적 활용
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ ① ② ③ /* */ 

/* 
	사용자로부터 조건에 만족하는 인원수를 입력받고
	입력받은 인원수만큼의 학생 이름과 전화번호를 입력받아
	이렇게 입력받은 데이터를 이름 배열과 전화번호 배열로 구성하여
	결과를 출력할 수 있는 프로그램을 구현한다.
	
	실행 예)
	입력 처리할 학생 수 입력(명, 1~10) : 37
	입력 처리할 학생 수 입력(명, 1~10) : 0
	입력 처리할 학생 수 입력(명, 1~10) : 3
	이름 전화번호 입력[1] (공백 구분) : 최규석 010-1111-1111
	이름 전화번호 입력[2] (공백 구분) : 이승원 010-1111-1111
	이름 전화번호 입력[3] (공백 구분) : 조경진 010-1111-1111


	-------------------
	전체 학생 수 : 3명
	-------------------
	이름		전화번호
	최규석 010-1111-1111
	이승원 010-1111-1111
	조경진 010-1111-1111
*/

import java.util.Scanner;
import java.io.IOException;

public class Test086
{
	public static void main(String[] args) throws IOException
	{
		/*
		//변수 선언 및 초기화
		int nCount, nTemp;
		//String strTemp;
		String[] arrName, arrCellNum,strTemp;
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("입력 처리할 학생 수 입력 (명, 1~10) : ");
			nCount =  sc.nextInt();
			
			//확인(테스트)
			//System.out.println("nCount : " + nCount);
		}
		while (nCount < 1 || nCount > 10);
		

		sc.skip("\r\n");
		
		sc.useDelimiter(" ");
		arrName = new String[nCount];
		arrCellNum = new String[nCount];
			
		nTemp = 0;
		
		// 이름/전화번호 입력
		do
		{
			System.out.printf("이름 전화번호 입력[%d] (공백 구분) : " , nTemp+1);
			strTemp = (sc.nextLine()).split(" ");
			arrName[nTemp] = strTemp[0];
			arrCellNum[nTemp] = strTemp[1];
			//확인(테스트)
			//System.out.printf("arrName[%d] : %s, arrCellNum[%d] : %s\n", nTemp, arrName[nTemp], nTemp, arrCellNum[nTemp]);
			nTemp++;
		} while (nTemp < nCount);
		
		
		System.out.println(); // 개행
		
		
		// 결과 출력
		//-------------------
		//전체 학생 수 : 3명
		//-------------------
		//이름		전화번호
		//최규석 010-1111-1111
		//이승원 010-1111-1111
		//조경진 010-1111-1111
		
		System.out.println("----------------------");
		System.out.printf("전체 학생 수 : %d명\n", nCount);
		System.out.println("----------------------");
		System.out.printf("%3s   %s\n", "이름", "전화번호");
		
		for (int i = 0; i < arrName.length; i++)
		{
			System.out.printf("%3s %s\n", arrName[i], arrCellNum[i]);
		}
		
		System.out.println(); // 개행
		//---실행 결과
		//입력 처리할 학생 수 입력 (명, 1~10) : 3
		//이름 전화번호 입력[1] (공백 구분) : 최규석 010-1111-1111	//01011111111 ← 숫자 타입으로 선언하면 오류발생(8진수)
		//이름 전화번호 입력[2] (공백 구분) : 이승원 010-2222-2222
		//이름 전화번호 입력[3] (공백 구분) : 조경진 010-3333-3333

		//----------------------
		//전체 학생 수 : 3명
		//----------------------
		// 이름   전화번호
		//최규석 010-1111-1111
		//이승원 010-2222-2222
		//조경진 010-3333-3333

		//계속하려면 아무 키나 누르십시오 . . .			

		*/
		
		
		//Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);
		
		//사용자가 입력하는 학생 수를 담아낼 변수
		int memberCount = 0;
		
		do
		{
			System.out.print("입력 처리할 학생 수 입력 (명, 1~10) : ");
			memberCount = sc.nextInt();
		}
		while (memberCount < 1 || memberCount > 10);
		
		//테스트(확인)
		//System.out.println("사용자가 입력한 인원 수 : " + memberCount);
		
		//--실행 결과
		//입력 처리할 학생 수 입력 (명, 1~10) : 0
		//입력 처리할 학생 수 입력 (명, 1~10) : 100
		//입력 처리할 학생 수 입력 (명, 1~10) : 50
		//입력 처리할 학생 수 입력 (명, 1~10) : 11
		//입력 처리할 학생 수 입력 (명, 1~10) : 5
		//사용자가 입력한 인원 수 : 5
		//계속하려면 아무 키나 누르십시오 . . .
		
		//사용자가 입력한 인원 수 확정
		//이 인원 수를 토대로
		//이름 배열과 전화번호 배열을 생성해야 한다.
			
		// 인원 수 만큼의 이름 저장 배열 구성
		String[] names = new String[memberCount];
		
		// 인원 수 만큼의 전화번호 저장 배열 구성
		//String[] tesls = new String[memberCount];
		String[] tels = new String[names.length];
		
		//인원 수 만큼의 안내 메세지 출력 및 입력값 담아내기
		//for (int i = 0;i < memberCount ; i++)
		//for (int i = 0;i < names.length ; i++)
		for (int i = 0;i < tels.length ; i++)	//-- 입력받은 인원 수 만큼 반복
		{
			System.out.printf("이름 전화번호 입력[%d] (공백 구분) : ", (i+1));
			
			// 최규석 010-1111-2222
			// ------
			names[i] = sc.next();
			 
			// 최규석 010-1111-2222
			//        -------------
			tels[i] = sc.next();
		}
		
		
		//최종 결과(이름, 전화번호) 출력
		System.out.println();	//-- 개행
		System.out.println("----------------------");
		//System.out.printf("전체 학생 수 : %d명\n", names.length);
		//System.out.printf("전체 학생 수 : %d명\n", tels.length);
		System.out.printf("전체 학생 수 : %d명\n", memberCount);
		System.out.println("----------------------");
		System.out.println("이름   전화번호");
		
		//학생 리스트 반복 출력
		for (int i = 0; i < memberCount; i++)
		{
			System.out.printf("%3s %14s\n", names[i], tels[i]);
		}
		
		System.out.println("----------------------");
		
	}
}

//-- 실행 결과
/*
입력 처리할 학생 수 입력 (명, 1~10) : 3
이름 전화번호 입력[1] (공백 구분) : 최규석 010-1111-1111
이름 전화번호 입력[2] (공백 구분) : 이승원 010-2222-2222
이름 전화번호 입력[3] (공백 구분) : 조경진 010-3333-3333

----------------------
전체 학생 수 : 3명
----------------------
이름   전화번호
최규석  010-1111-1111
이승원  010-2222-2222
조경진  010-3333-3333
----------------------
계속하려면 아무 키나 누르십시오 . . .

*/