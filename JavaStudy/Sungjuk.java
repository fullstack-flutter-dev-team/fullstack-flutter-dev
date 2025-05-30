
import java.util.Scanner;

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
		System.out.println("인원수 : " + this.nCount);
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
			System.out.printf("%s %2d  %2d  %2d  %4d  %3.2f   %2d\n", 
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