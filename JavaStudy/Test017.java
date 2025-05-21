/*===================================================================
	■■■ 자바의 개요 및 특징 ■■■
		- 자바 기본 입출력 : java.util.Scanner
		- ✨ [Class Scanner](https://docs.oracle.com/javase/8/docs/api/index.html)
===================================================================*/

// ※ 『java.util.Scanner』
//		단락 문자 패턴을 사용하여 입력은 토큰에 따라 분할하며
//		디폴트(default, 기본)로 사용되는 단락 문자는 공백(엔터)이다.
//		작성된 다음 토큰은 『next()』 메서드를 사용
//		다른 형태(자료형)의 값으로 변환할 수 있다.

//import java.util.Scanner;

public class Test017
{
	public static void main(String[] args)
	{
		
		// ✨ 주요 변수 선언
		java.util.Scanner sc = new java.util.Scanner(System.in);
		// 강원.횡성.승원 a
		// 서울.마포.승원 b
		
		String strName;
		int nKor, nEng, nMat, nTot;
		
		// 연산 및 처리
		//-- 사용자에게 안내 메세지 출력
		System.out.print(" 이름 국어 영어 수학 입력(공백 구분) : "); // 이동건 90 80 70
		//															"이동건 90 80 70"
		
		//-- 사용자가 입력한 데이터를 각각의 변수에 담아내기
		strName = sc.next();	//-- "이동건"
		nKor = sc.nextInt();	//-- 90
		nEng = sc.nextInt();	//-- 80
		nMat = sc.nextInt();	//-- 70
		
		//-- 총점 산출
		nTot = nKor + nEng  + nMat;
		
		// 결과 출력
		System.out.println();
		System.out.println(">> 이름 : " + strName);
		System.out.println(">> 총점 : " + nTot);
		//--결과 출력
		// 이름 국어 영어 수학 입력(공백 구분) : 이동건 90 80 70

		//>> 이름 : 이동건
		//>> 총점 : 240
		//계속하려면 아무 키나 누르십시오 . . .
	}
}