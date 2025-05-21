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

import java.util.Scanner;

public class Test018
{
	public static void main(String[] args)
	{
		// 주요 변수 선언
		Scanner sc = new Scanner(System.in); // .useDelimiter(",");
		//                       ---------
		//                     [입력 스트림]
		String strName;
		int nKor, nEng, nMat, nTot;
		
		
		// 연산 및 처리
		System.out.print("이름,국어,영어,수학 입력(『,』구분) : ");
		// 이름,국어,영어,수학 입력(『,』구분) : 유한,90,80,70
		
		// 테스트 확인
		//String strTemp = sc.next();
		//System.out.println(">> temp : " + strTemp);
		//--
		//이름,국어,영어,수학 입력(『,』구분) : 유한,90,80,70
		//>> temp : 유한,90,80,70
		//계속하려면 아무 키나 누르십시오 . . .
		
		
		sc = new Scanner(sc.next()).useDelimiter(",");
		//               ---------
		//                [문자열] "유한,90,80,70"
		
		strName = sc.next();
		nKor =  sc.nextInt();
		nEng =  sc.nextInt();
		nMat =  sc.nextInt();
		
		nTot = nKor + nEng + nMat;
		
		// 결과 출력
		System.out.println("\n>> 이름 : " + strName);
		System.out.println(">> 총점 : " + nTot);
		//--
		//이름,국어,영어,수학 입력(『,』구분) : 유한,90,80,70

		//>> 이름 : 유한
		//>> 총점 : 240
		//계속하려면 아무 키나 누르십시오 . . .
		
	}
}