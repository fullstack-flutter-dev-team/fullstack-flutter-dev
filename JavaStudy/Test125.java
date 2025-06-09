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
		//return name;
		return this.name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	//-------------[score]---------------------
	public int[] getScore()
	{
		//return score;
		return this.score;
	}
	
	public void setScore(int[] score)
	{
		this.score = score;
	}			
	
	//-------------[tot]---------------------
	public int getTot()
	{
		//return tot;
		return this.tot;
	}
	
	public void setTot(int tot)
	{
		this.tot = tot;
	}
	
	//-------------[avg]---------------------
	public double getAvg()
	{
		//return avg;
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
	public void set();		//-- 인원 세팅
	public void input();	//-- 데이터 입력
	public void print();	//-- 결과 출력
	
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
	private int inwon;			//-- 인원 수(사용자가 입력하게 될 값)
	private Record[] rec;
	//-- Record클래스를 기반으로 생성되는 객체를
	//		담을 수 있는 배열의 이름을 rec라고 하겠다.
	
	//???
	@Override
	public void set()
	{
		//인원 수 입력(1~10) : 11
		//인원 수 입력(1~10) : 0
		//인원 수 입력(1~10) : 2
		
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("인원 수 입력(1~10)  : ");
			inwon = sc.nextInt();
		}
		while (inwon < 1 || inwon > 10);
		
		rec = new Record[inwon];
		
		for (int i = 0; i < inwon; i++)
		{
			rec[i] = new Record();
		}
		
		//for (Record r : rec)
		//{
		//	System.out.println("r : " + r.getHak());
		//}
		System.out.println();	//-- 개행
	}
	
	@Override
	public void input()
	{
		
	
		//1번째 학생의 학번 이름 입력(공백 구분) : 2505123 최xx
		//국어 영어 수학 점수 입력   (공백 구분) : 90 100 85
		
		//2번째 학생의 학번 이름 입력(공백 구분) : 2505236 조xx
		//국어 영어 수학 점수 입력   (공백 구분) : 90 100 85
		Scanner sc = new Scanner(System.in);
		int[] scoreTemp = new int[3];
		int tot = 0;
		double avg = 0.0;
		
		for (int i = 0 ; i < inwon; i++)
		{
			System.out.printf("%d번째 학생의 학번 이름 입력(공백 구분): ", (i+1));
			rec[i].setHak(sc.next());
			rec[i].setName(sc.next());
			
			System.out.print("국어 영어 수학 점수 입력   (공백 구분) : ");
			scoreTemp[0] = sc.nextInt();
			scoreTemp[1] = sc.nextInt();
			scoreTemp[2] = sc.nextInt();
			tot = scoreTemp[0] + scoreTemp[1] + scoreTemp[2];
			avg = tot / 3.0;
			
			rec[i].setScore(scoreTemp);
			rec[i].setTot(tot);
			rec[i].setAvg(avg);
			
			System.out.println();	//-- 개행
		}
	}

	
	@Override
	public void print()
	{
		//2505123	최xx	90	100	85	xxx	xxx.xx
		//					수	수	우
		//2250236	조xx	95	80	95	xxx	xxx.xx
		//					수	수	우
		int kor, eng, mat;
		
		System.out.println();	//--개행
		
		for (int i = 0; i < inwon; i++)
		{
			kor = rec[i].getScore()[0];
			eng = rec[i].getScore()[1];
			mat = rec[i].getScore()[2];
			System.out.printf("%8s %4s %3d %3d %3d %3d %.2f\n", rec[i].getHak(), rec[i].getName(), kor, eng, mat, rec[i].getTot(), rec[i].getAvg());
			System.out.printf("%19s%3s%3s\n", getGrade(kor), getGrade(eng), getGrade(mat));
			
		}
	}
	
	public String getGrade(int score)
	{
		String strGrade;
		
		if (score >= 90)
		{
			strGrade = "수";
		} else if (score >= 80) {
			strGrade = "우";
		} else if (score >= 70) {
			strGrade = "미";
		} else if (score >= 60) {
			strGrade = "양";
		} else {
			strGrade = "가";
		}
		
		return strGrade;
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