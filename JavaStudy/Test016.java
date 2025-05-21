/*===================================================================
	■■■ 자바의 개요 및 특징 ■■■
		- 자바 기본 입출력 : java.util.Scanner
===================================================================*/

// ※ 『java.util.Scanner』
//		단락 문자 패턴을 사용하여 입력은 토큰에 따라 분할하며
//		디폴트(default, 기본)로 사용되는 단락 문자는 공백(엔터)이다.
//		작성된 다음 토큰은 『next()』 메서드를 사용
//		다른 형태(자료형)의 값으로 변환할 수 있다.

import java.util.Scanner;
//import java.io.IOException;

// [Class Scanner](https://docs.oracle.com/javase/8/docs/api/index.html)

public class Test016
{
	public static void main(String[] args) //throws IOException
	{
		// 주요 변수 선언
		// Scanner 클래스 기반의 인스턴스 생성
		Scanner sc = new Scanner(System.in);
		
		String strName;			//-- 이름 변수
		int nKor, nEng, nMat;	//-- 국어, 영어, 수학 점수 변수
		
		
		// 연산 및 처리
		System.out.print("이름을 입력하세요 : ");
		strName = sc.next();
		
		
		// 테스트(확인)
		//System.out.println("입력한 이름 : " + strName);
		//--출력
		//이름을 입력하세요 : 조경진
		//입력한 이름 : 조경진
		//계속하려면 아무 키나 누르십시오 . . .
		
		System.out.print("국어 점수 입력 : ");
		//nKor = Integer.parseInt(br.readLine());
		//nKor = Integer.parseInt(sc.next());
		nKor = sc.nextInt();
		
		System.out.print("영어 점수 입력 : ");
		nEng = sc.nextInt();
		
		System.out.print("수학 점수 입력 : ");
		nMat = sc.nextInt();
		
		
		// 결과 출력
		System.out.println();			//-- 개행
		System.out.println(">> 이름 : " + strName);
		//System.out.println(">> 총점 : " + nKor + nEng + nMat);	// 문자열 + 연산
		System.out.println(">> 총점 : " + (nKor + nEng + nMat));
		//-- 실행 결과
		//이름을 입력하세요 : 이유빈
		//국어 점수 입력 : 80
		//영어 점수 입력 : 90
		//수학 점수 입력 : 20

		//>> 이름 : 이유빈
		//>> 총점 : 190
		//계속하려면 아무 키나 누르십시오 . . .
	}
}