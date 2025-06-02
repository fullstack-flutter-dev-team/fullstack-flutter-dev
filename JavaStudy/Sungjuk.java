/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
	- 클래스와 인스턴스 활용
	-  static 변수(클래스 변수)와 static 메서드(클래스 메서드)
	   ------------------------   ----------------------------
	        정적 변수                      정적 메서드     
===================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ① ② ③ ④  ⑤ →  ←  ↓ ↑  …  ：  /*  */  ─ ┃ ┛

/* 
	
*/

/* 
    학생별로 국어,영어, 수학점수를 입력받아
	총점, 평균을 계산하는 프로그램을 구현한다.
	단, 클래스와 인스턴스의 개념을 활용하여 작성할 수 있도록 한다.
	또한, 이 과정에서 배열을 적극적으로 활용할 수 있도록 한다.
	클래스의 설계는 다음의 가이드라인에 따라 진행할 수 있도록 한다.
	
	[가이드 라인]
	프로그램을 구성하는 클래스
	1.Record클래스
	  - 속성만 존재하는 클래스로 설계할 것~!!! -----------------check~!!!
	2.Sungjuk 클래스
	  - 인원 수를 입력받아
	    그 인원 수 만큼 이름, 국어, 영어, 수학 점수를 입력받고
	    총점과 평균을 산출하는 클래스로 설계할 것~!!!
	     - 속성 : 인원 수, ★ Record타입의 배열 -------------------check~!!!
		 - 기능 : 인원 수 입력, 상세 데이터 입력, 총점 및 평균 연산, 결과 출력
	3. Test105 클래스
	   - main() 메서드가 존재하는 외부 클래스로 설계할 것~!!!
	   
	   
	실행 예)
	인원 수 입력(1~100) : 102
	인원 수 입력(1~100) : -2
	인원 수 입력(1~100) : 3
	
	1번째 학생의 이름 입력 : 이동건
	국어 점수 : 90
	영어 점수 : 80
	수학 점수 : 70
	2번째 학생의 이름 입력 : 유한
	국어 점수 : 90
	영어 점수 : 90
	수학 점수 : 70
	3번째 학생의 이름 입력 : 이채원
	국어 점수 : 90
	영어 점수 : 90
	수학 점수 : 80
	
	이동건 90 80 70 240 xx.xx  3
	유한   90 90 70 250 xx.xx  2
	이채원 90 80 80 260 xx.xx  1
	계속하면 아무 키나 누르세요....
	
*/

/*
    ▣ 추가 설명
	
	class Test
	{
		//Scanner sc = new Scanner(System.in); //-- 권장하지 않음
		Scanner sc;
		
	    메서드1()
		{
		   //Scanner sc = new Scanner(System.in);
		   sc = new Scanner(System.in);
		   sc.nextInt();
		}
		
	    메서드2()
		{
		   //Scanner sc = new Scanner(System.in);
		   sc = new Scanner(System.in);
		   sc.nextInt(); // 메서드1() 이 먼저 실행된 경우 가능
		}
	
	
	}

*/


import java.util.Scanner;

/*
class Sungjuk
{
	// 클래스 속성
	public int nCount;
	public Record[] arrRecords;
	
	// 클래스 메서드
	public void inputCount()
	{
		//System.out.println("=====[ Sungjuk > inputCount() 메서드 ]======");
		//인원 수 입력(1~100) : 102
		//인원 수 입력(1~100) : -2
		//인원 수 입력(1~100) : 3
		
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("인원 수 입력(1~100) : ");
			nCount = sc.nextInt();
		}
		while (nCount < 1 || nCount > 100);
		
		//확인(테스트)
		//System.out.println("인원수 : " + this.nCount);
	}
	
	public void inputRecords()
	{
		//System.out.println("=====[ Sungjuk > inputRecords() 메서드 ]======");
		//1번째 학생의 이름 입력 : 이동건
		//국어 점수 : 90
		//영어 점수 : 80
		//수학 점수 : 70
				
			
		// 변수 선언 및 초기화
		int nIndex = 0;
		int nTempSum = 0;
		Scanner sc = new Scanner(System.in);
		
		// 참조형 변수 메모리  
		arrRecords = new Record[nCount];
		
		do
		{
			// nKorScore, nEngScore, nMatScore
			arrRecords[nIndex] = new Record();
			System.out.printf("%d번째 학생의 이름 입력 : ", (nIndex+1));
			arrRecords[nIndex].name = sc.nextLine();
			
			System.out.printf("국어 점수 : ");
			arrRecords[nIndex].score[0] = sc.nextInt();
			
			System.out.printf("영어 점수 : ");
			arrRecords[nIndex].score[1] = sc.nextInt();
			
			System.out.printf("수학 점수 : ");
			arrRecords[nIndex].score[2] = sc.nextInt();
			
			arrRecords[nIndex].tot = arrRecords[nIndex].score[0] + arrRecords[nIndex].score[1] + arrRecords[nIndex].score[2];
			arrRecords[nIndex].avg = arrRecords[nIndex].tot / 3.0;
				
			sc.skip("\r\n");
			
			nIndex++;
		}
		while (nIndex < nCount);
		
	}
	
	public void calcRank()
	{
		//System.out.println("=====[ Sungjuk > calcRank() 메서드 ]======");
		
		int nTempScore, nRank = 1;
		
		for (int i = 0; i < this.nCount; i++)
		{
			nTempScore = arrRecords[i].tot;
			nRank = 1;
			
			for (int j = 0; j < this.nCount; j++)
			{
				if (i != j)
				{
					if (nTempScore < arrRecords[j].tot)
					{
						nRank++;
					}
				}
			}
			
			// 등수 설정
			arrRecords[i].rank = nRank;
			
			//확인(테스트)
			//System.out.printf(">> 등위 : %d\n", nRank);
		}
				
	}
	
	public void print()
	{
		//System.out.println("=====[ Sungjuk > print() 메서드 ]======");
		//   이름 국어 영어 수학 총점  평균 등수
		//  이동건 90   80   70  240  xx.xx   3
		for (int i = 0; i < this.nCount; i++)
		{
			System.out.printf("%5s  %3d  %3d  %3d  %4d  %.2f   %-2d\n", 
				arrRecords[i].name, 
				arrRecords[i].score[0], 
				arrRecords[i].score[1], 
				arrRecords[i].score[2],
				arrRecords[i].tot,
				arrRecords[i].avg,
				arrRecords[i].rank
				);
		}
	}
	
}

*/
class Sungjuk
{
	// 주요 속성 구성
	int inwon;           //-- 인원 수
	Record[] rec;        //-- Record 타입을 적재할 수 있는 배열
	                     //    (학생 한 명 당 Record 배열 방 한 개 활용)
 	                     //   Record를 기반으로 생성된 객체만 담아낼 수 있는 배열
						 
	// 기능 정의(기능 구성)
	// → 주요 메서드 정의
	
	// ① 인원 수 입력
	void set()
	{
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("인원 수 입력(1~100) : ");
			inwon = sc.nextInt();
		}
		while (inwon < 1 || inwon > 100);
		
		// ★ check~!!! ★
		// Record 클래스를 기반으로 생성된 객체(인스턴스)를 담을 수 있는
		// 배열방을 inwon만큼 생성한 것이지
		// Record 클래스의 인스턴스를 생성한 것은 아니다.
		rec = new Record[inwon];
	}
	
	
	// ② 상세 데이터 입력 + ③ 총점 및 평균 산출
	public void input()
	{
		Scanner sc = new Scanner(System.in);  // 지역변수로 사용 권장
		
		String[] title = {"국어 점수 : ", "영어 점수 : ", "수학 점수 : "};
		
		// 인수 수 만큼 반복 → 인원 수에 기반하여 만들어진 배열의 길이만큼 반복
		//for (int i = 0; i < rec.length; i++)
		for (int i = 0; i < inwon; i++)                                 // 웅~~~~
		{
			// Record 클래스의 인스턴스 생성
			rec[i] = new Record();
			
			System.out.printf("%d번째 학생의 이름 입력 : ", (i + 1));
			rec[i].name = sc.next();               //-- 이름 입력
			
			//System.out.print("국어 점수 : ");
			//rec[i].score[0] = sc.nextInt();        //-- 국어 점수 입력
			//System.out.print("영어 점수 : ");
			//rec[i].score[1] = sc.nextInt(); 
			//System.out.print("수학 점수 : ");
			//rec[i].score[2] = sc.nextInt(); 
			
			//for (int j = 0; j < title.length; j++)                       // 쑝쑝쑝
			for (int j = 0; j < 3; j++)                                  // j → 0 1 2
			{
				System.out.print(title[j]);                              // j → 0 → "국어 점수 : "
				                                                         // j → 1 → "영어 점수 : "
				                                                         // j → 2 → "수학 점수 : "
				 
				rec[i].score[j] = sc.nextInt();
				// rec[i].score[0] = sc.nextInt(); → 국어 점수
				// rec[i].score[1] = sc.nextInt(); → 영어 점수
				// rec[i].score[2] = sc.nextInt(); → 수학 점수
				
				// 국어, 영어, 수학 점수 데이터를
				// 반복적으로 입력받는 과정을 통핵 총점에 대한 누적합 산출
				rec[i].tot += rec[i].score[j];
			}
			
			// 평균 산출
			//rec[i].avg = rec[i].tot / 3; // rec[i].score.length  → 3
			//rec[i].avg = rec[i].tot / rec[i].score.length;
			
			//rec[i].avg = (double)rec[i].tot / 3;
			//rec[i].avg = rec[i].tot / (double)rec[i].score.length;
			rec[i].avg = (double)rec[i].tot / 3.0;
			
			
		}//end outer loop
		
	}//close input()
	
	
	
	
	// ④  결과 출력 →
	//이동건 90 80 70 240 xx.xx  3
	//유한   90 90 70 250 xx.xx  2
	//이채원 90 80 80 260 xx.xx  1
	public void print()
	{
		// 개행
		System.out.println();
		
		// check~!!
		// 출력 기능 수행 전에 석차 산출 메서드 호출
		ranking();
		
		// 학생 한 명 당 반복 출력 구문 구성
		//for (int i = 0; i < rec.length; i++)
		for (int i = 0; i < inwon; i++)
		{
			// 이름 출력
			System.out.printf("%5s", rec[i].name);
			
			// 성적 출력 과목의 수(국어, 영어, 수학)만큼 반복
			//for (int j = 0; j < rec[i].score.length; j++)   // 유지보수 차원에서 권장
			for (int j = 0; j < 3; j++)
			{
				System.out.printf("%4d", rec[i].score[j]);
			}
			
			// 총점, 평균 출력
			System.out.printf("%5d", rec[i].tot);
			System.out.printf("%8.2f", rec[i].avg);
			
			// check~!!
			// 석차 출력 구문 추가~!!!
			System.out.printf("%5d", rec[i].rank);
			
			// 개행 (석차 정보 추가를 위해 사용)
			System.out.println();
		}//end loop
		
	}//close print()
	
	// ⑤ 석차 산출 메서드 추가
	//    - 산출 과정에서 연산에 필요한 데이터가 이미 존재하는 상황 → 매개변수 필요하지 않음
	//    - 결과에 대한 처리 → Record 배열의 rank 속성 활용 → 반환 자료형 → void
	//    - 클래스 내부에서 활용할 메서드로 정의 → 접근 제어 지시자 → private
	private void ranking()
	{
		
		// 모든 학생들의 등수(석차, rank)를 1로 초기화
		for (int i = 0; i < inwon; i++)
		{
			rec[i].rank = 1;
		}
		
		// 등수 산출
		for (int i = 0; i < inwon-1; i++)          // 웅~~~~ 비교 기준
		{ 
			for (int j = i+1; j < inwon; j++)      // 쑝쑝쑝 비교 대상
			{
				if (rec[i].avg > rec[j].avg)       // 비교 기준이 대상의 평균보다 크다면
				{
					rec[j].rank++;                 // 대상의 rank를 1 만큼 증가
				} 
				else if (rec[j].avg > rec[i].avg)  // 비교 대상이 기준의 평균보다 크다면
				{
					rec[i].rank++;                 // 기준의 rank를 1 만큼 증가
					
				}
			}
		}
	}
	
}//class Sungjukd