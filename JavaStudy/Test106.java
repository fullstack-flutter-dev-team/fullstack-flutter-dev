/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
	-  클래스와 인스턴스 활용
===================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/* 
    ▣ 컴파일 에러 발생 시 
       Test097.java:2: error: unmappable character (0xE2) for encoding x-windows-949
	   ?뼚?뼚?뼚 諛곗뿴 ?뼚?뼚?뼚
	
	  ==[Javac 인수(E)]==▶ javac -encoding UTF-8 $(FileName)
*/

/* 
	1 ~ 3 사이의 난수를 발생시켜서
	가위, 바위, 보 게임을 구현한다.
	단, 클래스와 인스턴스의 개념을 활용하여 처리할 수 있도록 한다.
	또한, 배열을 활용하여 처리할 수 있도록 한다.
	최종적으로 RpsGame 클래스를 완성할 수 있도록 한다.
	
	※ 구현 과정에서의 기준 데이터  → 1: 가위, 2 : 바위, 3 : 보
	
	실행 예)
	1: 가위, 2:바위, 3:보 중 입력(1~3) : 4
	1: 가위, 2:바위, 3:보 중 입력(1~3) : -2
	1: 가위, 2:바위, 3:보 중 입력(1~3) : 2
	
	- 유저 : 바위
	- 컴퓨터 : 보
	
	>> 승부 최종 결과 : 컴퓨터가 승리했습니다~!!!
	cf >> 승부 최종 결과 : 무승부 상황입니다~!!!
	   >> 승부 최종 결과 : 당신이 승리했습니다~!!!
	계속하려면 아무 키나 누르세요...
*/

/*
 ▣ 힌트:
 
*/

import java.util.Random;
import java.util.Scanner;

/*

class RpsGame
{
	// 속성
	private String[] arr = {"가위", "바위", "보"};
	private int nUser, nCom;
	private int nWin; // 0-무승부, 1-승, 2-패
	
	// 메서드
	public void input()
	{
		// 변수 선언 및 초기화
		Scanner sc = new Scanner(System.in);
		Random rd = new Random();
		
		do
		{
			System.out.print("1:가위, 2:바위, 3:보 중 입력(1~3) :");
			nUser = sc.nextInt();
		}
		while (nUser < 0 || nUser > 3);
		
		nUser -= 1;
		nCom = rd.nextInt(2);
		
		//System.out.println("nUser 입력 값 : " + nUser + ", nCom : " + nCom);
		System.out.printf("- 유저  : %s\n", this.arr[nUser]);
		System.out.printf("- 컴퓨터  : %s\n", this.arr[nCom]);
		System.out.println(); // 개행
		
		// 게임 실행
		runGame();
	}
	
	//
	//                 0           1          2    
	//              1(가위)     2(바위)    3(보)
	//   1 (가위) 0   무          패         승     
	//   2 (바위) 1   승          무         패
	//   3 (보)   2   패          승         무        
	//
	private void runGame()
	{
		if (nUser == nCom)
		{
			this.nWin = 0; // 무승부
		} else if ((nUser == 0 && nCom == 2) || (nUser == 1 && nCom == 0) || (nUser == 2 && nCom == 1))
		{
			this.nWin = 1; // 승
		} else {
			this.nWin = 2; // 패
		}
		
		// 결과 출력
		printResult();
		
	}
	
	private void printResult()
	{
		//>> 승부 최종 결과 : 컴퓨터가 승리했습니다~!!!
		//cf >> 승부 최종 결과 : 무승부 상황입니다~!!!
		//   >> 승부 최종 결과 : 당신이 승리했습니다~!!!
		if (this.nWin == 0)
		{
			System.out.println(">> 승부 최종 결과 : 무승부 상황입니다~!!!");
		} else if (this.nWin == 1)
		{
			System.out.println(">> 승부 최종 결과 : 당신이 승리했습니다~!!!");
			
		} else {
			System.out.println(">> 승부 최종 결과 : 컴퓨터가 승리했습니다~!!!");
			
		}
	}
	
}

public class Test106
{
	public static void main(String[] args)
	{
		// RpsGame 클래스 인스턴스 생성
		RpsGame obj = new RpsGame();
		
		// 사용자 입력
		obj.input();
	}

}

//--실행결과
//1:가위, 2:바위, 3:보 중 입력(1~3) :4
//1:가위, 2:바위, 3:보 중 입력(1~3) :-2
//1:가위, 2:바위, 3:보 중 입력(1~3) :2
//- 유저  : 바위
//- 컴퓨터  : 가위

//>> 승부 최종 결과 : 당신이 승리했습니다~!!!
//계속하려면 아무 키나 누르십시오 . . .

//1:가위, 2:바위, 3:보 중 입력(1~3) :4
//1:가위, 2:바위, 3:보 중 입력(1~3) :-2
//1:가위, 2:바위, 3:보 중 입력(1~3) :3
//- 유저  : 보
//- 컴퓨터  : 바위

//>> 승부 최종 결과 : 당신이 승리했습니다~!!!
//계속하려면 아무 키나 누르십시오 . . .

*/

class RpsGame
{
	// 주요 속성 구성
	int user;    //-- 사용자의 가위 바위 보 결과값을 담아둘 속성
	int com;     //-- 컴퓨터의 가위 바위 보 결과값을 담아둘 속성
	
	
	// 컴퓨터의 가위 바위 보 수행
	public void runCom()
	{
		Random rd = new Random();
		com = rd.nextInt(3) + 1;    // 0 1 2 → +1  1 2 3
	}
		
	// 사용자의 가위 바위 보 수행
	public void input()
	{
		// 유저가 가위 바위 보를 하기 전에...컴퓨터(주최측) 먼저 가위 바위 보 수행
		runCom();
		
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("1:가위, 2:바위, 3:보 중 입력(1~3) : ");
			user = sc.nextInt();
		}
		while (user < 1 || user > 3);
	}
	
	// 중간 결과 출력
	public void middleCalc()
	{
		String[] str = {"가위", "바위", "보"};
		
		System.out.println();  // 개행
		System.out.println(" - 유저 : " + str[user-1]);
		System.out.println(" - 컴퓨터 : " + str[com-1]);
	}
	
	
	// 승부에 대한 최종 결과 연산
	public String resultCalc()
	{
		/*
		String result = "무승부 상황입니다~!!!";
		
		//( 유저 =="가위" && 컴=="바위") || (유저=="바위" && 컴="보") ||(유저=="보" && 컴=="가위")
		//→ 컴퓨터가 승리했습니다.~!!!
		//( 유저 =="가위" && 컴=="보") || (유저=="바위" && 컴="가위") ||(유저=="보" && 컴=="바위")
		//→ 당신이 승리했습니다.~!!!
		
		if (( user == 1 && com==2) || (user==2 && com==3) ||(user==3 && com==1))
		{
			//→ 컴퓨터가 승리했습니다.~!!!
			result = "컴퓨터가 승리했습니다.~!!!";
		}
		else if (( user == 1 && com==3) || (user==2 && com==1) ||(user==3 && com==2))
		{
			//→ 당신이 승리했습니다.~!!!
			result = "당신이 승리했습니다.~!!!";
		}
		*/
		
		// 가위 바위 보 판별 알고리즘
		// 1:가위, 2:바위, 3:보 중 입력(1~3) :3
		String result = "당신이 승리했습니다~!!!";
		
		if (user == com)
		{
			result = "무승부 상황입니다~!!!";
		} else if (user % 3 == (com+2)%3)
		{
			result = "컴퓨터가 승리했습니다~!!!";
		}
		
		
		return result;
	}
	
	// 결과 출력 
	public void print(String str)
	{
		System.out.printf("\n>> 승부 최종 결과 : %s\n", str);
	}
}

public class Test106
{
	public static void main(String[] args)
	{
		// RpsGame 클래스 인스턴스 생성
		RpsGame obj = new RpsGame();
		
		// 사용자 입력
		obj.input();
		obj.middleCalc();
		
		String result = obj.resultCalc();
		obj.print(result);
	}

}