/*===================================================================
	■■■ 자바의 개요 및 특징 ■■■
		- 변수와 자료형
		- 자바 기본 입출력 : BufferedReader 클래스 활용
===================================================================*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

// ○ 사용자로부터 이름, 국어점수, 영어점수, 수학점수를 입력받아
//		이름과 총점을 출력하는 프로그램을 구현한다.

// 실행 예)
// 이름을 입력하세요 : 최규석
// 국어 점수 입력 : 90
// 영어 점수 입력 : 80
// 수학 점수 입력 : 70

//====[결과]====
// 이름 : 최규석
// 총점 : 240
// 계속하려면 아무 키나 누르세요....

public class Test014
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 작성한 코드
		// 변수 선언 및 초기화
		String name;
		int korScore, engScore, mathScore, totalSum;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 사용자 입력
		// 이름, 국어, 영어, 수학 점수 입력
		System.out.print("이름을 입력하세요 : ");
		name = br.readLine();
		
		System.out.print("국어 점부 입력 : ");
		korScore = Integer.parseInt(br.readLine());
		
		System.out.print("영어 점수 입력 : ");
		engScore = Integer.parseInt(br.readLine());
		
		System.out.print("수학 점수 입력 : ");
		mathScore = Integer.parseInt(br.readLine());
		ĥ
		// 총점 계산
		totalSum = korScore + engScore + mathScore;
		
		// 총점 연산 결과를 출력
		System.out.println();
		System.out.println("====[결과]====");
		System.out.printf("이름 : %s\n총점 : %d\n", name, totalSum);
		
		//--최종 결과 출력
		//이름을 입력하세요 : 최규석
		//국어 점부 입력 : 90
		//영어 점수 입력 : 80
		//수학 점수 입력 : 70

		//====[결과]====
		//이름 : 최규석
		//총점 : 240
		//계속하려면 아무 키나 누르십시오 . . .
		*/
	
	
	
		//주요 변수 선언
		
		// BufferedReader 인스턴스 생성 → InputStreamReader 인스턴스 생성
		// An InputStreamReader is a bridge from byte streams to character streams
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		
		// BufferedReader br = new BufferedReader(isr);
		//						↓
		// BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		String strName;			//-- 이름 변수(문자열 형)
		int nKor, nEng, nMat;	//-- 국어, 영어, 수학 점수(정수형)
		int nTot;				//-- 총점 변수(정수형)
		
		String strTemp;			//-- 문자열 임시 저장 변수
		
		
		// 연산 및 처리
		// - 사용자에게 안내 메세지 출력(이름 입력 안내)
		System.out.print("이름을 입력하세요 : ");
		
		// - 사용자가 입력한 값(외부 데이터 → 문자열)을 변수에 담아내기
		//br.readLine();
		strName = br.readLine();	// import java.io.IOException, throws IOException 추가, readLine()은 문자열 반환
		
		//-------------------------------
		// - 사용자에게 안내 메시지 출력(국어 점수 입력 안내)
		System.out.print("국어 점수 입력 : ");
		
		// - 사용자가 입력한 값(외부 데이터 → 문자열)을 변수에 담아내기
		//nKor = br.readLine();
		
		//nKor = Integer.parseInt(br.readLine()); // ⭕
		
		strTemp = br.readLine();
		//	담아낸 데이터(strTemp)를 변환한 후 필요한 변수에 다시 담기
		nKor = Integer.parseInt(strTemp);
		
		//-------------------------------
		//	- 사용자에게 안내 메세지 출력(영어 점수 입련 안내)
		System.out.print("영어 점수 입력 : ");
		
		//	- 사용자가 입력한 값(외부 데이터 → 문자열)을 변수에 담아내기
		strTemp = br.readLine();
		
		//	- 담아낸 데이터(strTemp)를 변환한 후 필요한 변수에 다시 담기
		nEng = Integer.parseInt(strTemp);
		
		//-------------------------------
		//	- 사용자에게 안내 메세지 출력(수학 점수 입력 안내)
		System.out.print("수학 점수 입력 : ");
		
		//	- 사용자가 입력한 값(외부 데이터 → 문자열)을 변수에 담아내기
		strTemp = br.readLine();
		
		//	- 담아낸 데이터()를 변환한 후 필요한 변수에 다시 담기
		nMat = Integer.parseInt(strTemp);
		
		//-------------------------------
		//	- 각 점수 변수에 담겨있는 데이터()들을
		//	종합하여 총점을 산출하고 그 결과를 총점 변수에 담아내기
		nTot = nKor + nEng + nMat;
		
		//-------------------------------
		//	결과 출력
		/*
		System.out.println();	//개행
		System.out.println("====[결과]====");
		System.out.println("이름 : " + strName);
		System.out.println("총점 : " + nTot);
		*/
		
		System.out.println("\n====[결과]====");
		//System.out.printf("이름 : ○\n", strName);
		//System.out.printf("총점 : ○\n", nTot);
		System.out.printf("이름 : %s\n", strName);
		System.out.printf("총점 : %d\n", nTot);
		
		
		// 스트림을 닫음
		br.close();
	}
}