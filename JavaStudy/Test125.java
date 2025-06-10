/*========================================================================
	■■■ 클래스 고급 ■■■
	- 인터페이스(Interface) 간의 상속
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/* 
	성적 처리 프로그램을 구현한다.
	단, 인터페이스를 활용할 수 있도록 한다.
	
	
	실행 예)
	인원 수 입력(1~10) : 11
	인원 수 입력(1~10) : 0
	인원 수 입력(1~10) : 2
	
	1번째 학생의 학번 이름 입력(공백 구분) : 2505123 최xx
	국어 영어 수학 점수 입력   (공백 구분) : 90 100 85
	
	2번째 학생의 학번 이름 입력(공백 구분) : 2505236 조xx
	국어 영어 수학 점수 입력   (공백 구분) : 95 80 95
	
	2505123	최xx	90	100	85	xxx	xxx.xx
					수	수	우
	2250236	조xx	95	80	95	xxx	xxx.xx
					수	수	우
	계속하려면 아무 키나 누르세요...
*/

 
/*
 ▣ 힌트: 
 	90 ~ 100 : 수
	80 ~ 89 : 우
	70 ~ 79 : 미
	60 ~ 69 : 양
	나머지  : 가
*/

import java.util.Scanner;
import java.io.IOException;

// 속성만 존재하는 클래스  → 자료형 활용
class Record
{
	// 주요 속성 구성
	private String hak, name;		//-- 학번, 이름
	//private int kor, eng, mat;	//-- 국어, 영어, 수학 점수
	private int[] score = new int[3];
	
	private int tot;				//-- 총점
	private double avg;				//-- 평균
	
	// getter / setter 구성
	//-------------[hak]---------------------
	public String getHak()
	{
		//return hak;
		return this.hak;
	}
	
	public void setHak(String hak)
	{
		this.hak = hak;
	}
	
	//-------------[name]---------------------
	public String getName()
	{
		return this.name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
		
	//-------------[score]---------------------
	public int[] getScore()
	{
		return this.score;
	}
	
	public void setScore(int[] score)
	{
		this.score = score;
	}
	
	//-------------[tot]---------------------
	public int getTot()
	{
		return this.tot;
	}
	
	public void setTot(int tot)
	{
		this.tot = tot;
	}
	
	//-------------[avg]---------------------
	public double getAvg()
	{
		return this.avg;
	}
	
	public void setAvg(double avg)
	{
		this.avg = avg;
	}
	
}

// 인터페이스 → 가이드라인 활용(그대로 둔다~~)
interface Sungjuk
{
	public void set();     //-- 인원 세팅
	public void input();   //-- 데이터 입력
	public void print();   //-- 결과 출력
	
}

// 문제 해결 과정에서 설계해야 할 클래스 → Sungjuk 인터페이스를 구현하는 클래스
//class SungjukImpl
//
// 추상 클래스
//abstract class SungjukImpl implements Sungjuk
//
// 클래스
class SungjukImpl implements Sungjuk
{
	// 주요 속성 구성
	private int inwon;     //-- 인원 수(사용자가 입력하게 될 값)
	private Record[] rec;
	//-- Record클래스를 기반으로 생성되는 객체를
	//		담을 수 있는 배열의 이름을 rec라고 하겠다.
	
	// public abstract void set();
	// public abstract void input();
	// public abstract void print();
	
	@Override
	public void set()
	{
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("인원 수 입력(1~10) : ");
			inwon = sc.nextInt();
		}
		while (inwon < 1 || inwon > 10);
		
		// 이원 수 만큼의 배열방 구성
		rec = new Record[inwon];
	}
	
	@Override
	public void input()
	{
		Scanner sc = new Scanner(System.in);
		
		//for (int i = 0; i < rec.length; i++)	//-- 인원 수(rec 배열의 길이) 만큼 반복
		for (int i = 0; i < inwon; i++)	//-- 인원 수(rec 배열의 길이) 만큼 반복
		{
			// check~!!!
			// 학생 객체(인스턴스) 생성 → Record 객체
			//Record ob = new Record();
			//rec[0] = new Record();
			rec[i] = new Record();
			
			System.out.println();	//-- 개행
			System.out.printf("%d번째 학생의 학번 이름 입력(공백 구분) : ", (i+1));
			
			// 250123 김한국
			// ------ ------
			//rec[i].hak = sc.next();
			rec[i].setHak(sc.next());	//-- 학번
			
			//rec[i].name = sc.next();
			rec[i].setName(sc.next());	//-- 이름
			
			System.out.print("국어 영어 수학 점수 입력 (공백 구분) : ");
			// 70 80 90
			
			int[] temp = new int[rec[i].getScore().length];
			int total = 0;
			
			//for (int j = 0; j < 3; j++)
			//for (int j = 0; j < rec[i].getScore().length; j++)
			for (int j = 0; j < temp.length; j++)
			{
				//rec[i].score[j] = sc.nextInt();
				temp[j] = sc.nextInt();	//-- 국,영,수학 점수
				total += temp[j];			//-- 총점
			}
			
			//rec[i].score = temp;
			rec[i].setScore(temp);		//-- 국,영,수학 점수
			
			//rec[i].tot = total;
			rec[i].setTot(total);		//-- 총점
			
			//rec[i].avg = total/3.0;
			//rec[i].setAvg(total/3.0);
			rec[i].setAvg(total/(double)temp.length);	//-- 평균
		}
		
	}//close input()
	
	@Override
	public void print()
	{
		System.out.println();			//-- 개행
		for (int i = 0; i < inwon; i++)	//-- 학생 수 만큼 반복~!!!
		{
			// 학생 한 명 분 출력
			// i번째 학생
			
			//-- 학번, 이름 출력
			//System.out.printf("%8s %5s", 학번, 이름);
			//System.out.printf("%8s %5s", i번째 학생의 학번, i번째 학생의 이름);
			//System.out.printf("%8s %5s", rec[i].hak, rec[i].name);
			System.out.printf("%8s %5s", rec[i].getHak(), rec[i].getName());
			
			//-- 국어, 영어, 수학 점수 출력
			for (int scoreTemp : rec[i].getScore())
			{
				System.out.printf("%6d", scoreTemp);
			}
			
			//-- 총점
			//System.out.printf("%7d", i번째 학생의 총점);
			//System.out.printf("%7d", rec[i].tot);
			System.out.printf("%7d", rec[i].getTot());
			
			//-- 평균
			//System.out.printf("%8.2f", i번째 학생의 평균);
			//System.out.printf("%8.2f", rec[i].avg);
			System.out.printf("%8.2f\n\t\t", rec[i].getAvg());
			
			//-- "수, 우, 미, 양, 가" 출력..
			for (int scoreTemp : rec[i].getScore())
			{
				System.out.printf("%5s", panjung(scoreTemp));
			}
			System.out.println();	//-- 개행
			
		}
		
	}//close print()
	
	// 내부적(private)으로 등급에 대한 판정을 수행할 메서드 정의
	private String panjung(int score)
	{
		String result = "가";
		
		if (score >= 90) {
			result = "수";
		} else if (score >= 80) {
			result = "우";
		} else if (score >= 70) {
			result = "미";
		} else if (score >= 60){
			result = "양";
		}
		
		return result;
	}
	
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test125
{
	public static void main(String[] args)
	{
		//Sungjuk obj = new Sungjuk();	//-- 인스턴스 생성 불가 → 인터페이스
		
		// check~!!!
		// Sungjuk 은 인터페이스
		Sungjuk ob;
		
		
		// 문제 해결 과정에서 작성해야 할 ob 구성 및 객체 생성
		//ob = new Sungjuk();
		ob = new SungjukImpl();
		
		ob.set();
		ob.input();
		ob.print();
	}
	
}

//-- 실행 결과
/* ===========================================================
인원 수 입력(1~10) : 2

1번째 학생의 학번 이름 입력(공백 구분) : 2501234 김한국
국어 영어 수학 점수 입력 (공백 구분) : 90 100 85

2번째 학생의 학번 이름 입력(공백 구분) : 2502345 이미국
국어 영어 수학 점수 입력 (공백 구분) : 95 80 95

 2501234   김한국    90   100    85    275   91.67
                    수    수    우
 2502345   이미국    95    80    95    270   90.00
                    수    우    수
계속하려면 아무 키나 누르십시오 . . .

=========================================================== */
