/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  벡터(Vector) - 검색, 변경 및 삭제(실습)
=========================================================================*/

/* 
    ▣ 컴파일 에러 발생 시 
       Test097.java:2: error: unmappable character (0xE2) for encoding x-windows-949
	   ?뼚?뼚?뼚 諛곗뿴 ?뼚?뼚?뼚
	
	  ==[Javac 인수(E)]==▶ javac -encoding UTF-8 $(FileName)
*/


/// @see [Class System](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html)
/// @see [exit(int status)](https://docs.oracle.com/javase/8/docs/api/java/lang/System.html#exit-int-)

/// @see [Class Vector<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html)
/// @see [add(E e)](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html#add-E-)
/// @see [indexOf(Object o)](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html#indexOf-java.lang.Object-)
/// @see [removeElement(Object obj)](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html#removeElement-java.lang.Object-)
/// @see [removeElementAt(int index)](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html#removeElementAt-int-)
/// @see [set(int index, E element)](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html#set-int-E-)
/*
---------------------------------------
java.lang.Object
  ㄴjava.lang.System

java.lang.Object
  ㄴjava.util.AbstractCollection<E>
     ㄴjava.util.AbstractList<E>
        ㄴjava.util.Vector<E>
---------------------------------------

*/

// Test169 클래스를 완성하여 다음 기능을 가진 프로그램을 구현한다.
/*
     실행 예)
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	>> 메뉴 선택(1~6) : 7
	
	메뉴 선택 오류~!!!
	
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	>> 메뉴 선택(1~6) : 1
	>> 1번째 요소 입력 : 도우너
	1번째 요소 입력 성공~!!!
	>> 요소 입력 계속(Y/N) : y
	>> 2번째 요소 입력 : 마이콜
	2번째 요소 입력 성공~!!!
	>> 요소 입력 계속(Y/N) : N
	
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	 >> 메뉴 선택(1~6) : 2
	 
	 [요소 전체 출력]
	 도우너
	 마이콜
	 요소 전체 출력 완료~!!!
	 
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	 >> 메뉴 선택(1~6) : 3
	 
	 >> 검색할 요소 입력 : 희동이
	 [검색 결과 출력]
	 항목이 존재하지 않습니다.
	 
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	 >> 메뉴 선택(1~6) : 3
	 
	 >> 검색할 요소 입력 : 도우너
	 
	 [검색 결과 출력]
	 항목이 존재합니다.	
	 
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	 >> 메뉴 선택(1~6) : 4
	 
	 >> 삭제할 요소 입력 : 고길동
	 [삭제 결과 출력]
	 항목이 존재하지 않아 삭제할 수 없습니다.
	 
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	 >> 메뉴 선택(1~6) : 4 
	 
	 >> 삭제할 요소 입력 : 도우너
	 [삭제 결과 출력]
	 도우너 항목이 삭제되었습니다.
	 
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	 >> 메뉴 선택(1~6) : 5
	 
	 >> 변경할 요소 입력 : 도우너
	 
	 [변경 결과 출력]
	 도우너 대상이 존재하지 않습니다.
	 
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	 >> 메뉴 선택(1~6) : 5
	 
	 >> 변경할 요소 입력 : 마이콜
	 >> 수정할 내용 입력 : 둘리
	 
	 [변경 결과 출력]
	 변경이 완료되었습니다.
	 
	 
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	 >> 메뉴 선택(1~6) : 2
	 
	 [요소 전체 출력]
	 둘리
	 요소 전체 출력 완료~!!!
	 
	 
	 =====[메뉴 선택]=======
	 1. 요소 추가
	 2. 요소 출력
	 3. 요소 검색
	 4. 요소 삭제
	 5. 요소 변경
	 6. 종료
	 =======================
	 >> 메뉴 선택(1~6) : 6
	 
	 프로그램 종료~!!!
	 계속하려면 아무 키나 누르세요...
	 
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Vector;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;



class Menus    // → 완성
{
	public static final int E_ADD = 1;     //-- 요소 추가
	public static final int E_DISP = 2;    //-- 요소 출력
	public static final int E_FIND = 3;    //-- 요소 검색
	public static final int E_DEL = 4;     //-- 요소 삭제
	public static final int E_CHA = 5;     //-- 요소 변경
	public static final int E_EXIT = 6;    //-- 종료
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test169  // extends Object
{
	// 주요 속성 구성 → 완료
	private static final Vector<Object> vt;    //-- 자료구조
	private static BufferedReader br;          //-- 입력 시 활용
	private static Integer sel;                //-- 선택 값
	private static String con;                 //-- 계속 진행 여부
	
	// static 초기화 블럭 → 완료
	static
	{
		// Vector 자료구조 vt생성
		vt = new Vector<Object>();
		
		// BufferedReader 인스턴스 생성
		br = new BufferedReader(new InputStreamReader(System.in));
			
		// 사용자 입력 값 초기화
		sel = 1;
		con = "Y";
	}
	
	// 메뉴 출력 메서드
	public static void menuDisp()
	{
		/*
		 =====[메뉴 선택]=======
		 1. 요소 추가
		 2. 요소 출력
		 3. 요소 검색
		 4. 요소 삭제
		 5. 요소 변경
		 6. 종료
		 =======================
		*/
		
		System.out.println("=======[메뉴 선택]======");
		System.out.println("1. 요소 추가");
		System.out.println("2. 요소 출력");
		System.out.println("3. 요소 검색");
		System.out.println("4. 요소 삭제");
		System.out.println("5. 요소 변경");
		System.out.println("6. 종료");
		System.out.println("========================");
		
	}
	
	// 메뉴 선택 메서드
	public static void menuSelect() throws IOException, NumberFormatException
	{
		/*
		 >> 메뉴 선택(1~6) : 6
		*/
		
		try
		{
			do
			{
				System.out.print("메뉴 선택(1~6) : ");
				sel = Integer.parseInt(br.readLine());
				//System.out.println("sel : " + sel);
				if (sel < 1 || sel > 6)
				{
					System.out.print("\n메뉴 선택 오류~!!!\n\n");
					sel = -1;
					return;
				}
				System.out.println();
			}
			while (sel < 1 || sel > 6);
		}
		catch (NumberFormatException e)
		{
			sel = -1;
			System.out.print("\n메뉴 선택 오류~!!!\n\n");
			return;
		}
		
	}
	
	// 메뉴 실행에 따른 기능 호출 메서드
	public static void menuRun() throws IOException
	{
		/*
		 1. 요소 추가
		 2. 요소 출력
		 3. 요소 검색
		 4. 요소 삭제
		 5. 요소 변경
		 6. 종료
		*/
		switch (sel)
		{
			case 1: addElement(); break;
			case 2: dispElement(); break;
			case 3: findElement(); break;
			case 4: delElement(); break;
			case 5: chaElement(); break;
			case 6: exit(); break;
		}
	}
	
 
	
	// 자료구조에 요소 추가(입력) 메서드
	public static void addElement() throws IOException
	{
		/*
         1번째 요소 입력 : xxx
         1번째 요소 입력 성공~!!!
         >> 요소 입력 계속(Y/N) : y
		*/
		
		boolean isSuccess = false;
		char chYN =  'n';
		
		do
		{
			System.out.printf("%d번째 요소 입력 : ", vt.size()+1);
			isSuccess = vt.add(br.readLine());
			
			if (isSuccess == true)
			{
				System.out.printf("%d번째 요소 입력 성공~!!!\n", vt.size());
				System.out.print(">> 요소 입력 계속(Y/N) : ");
				chYN = (char)System.in.read();
				isSuccess = false;
				br.skip(2);
			}
		}
		while (chYN == 'y' || chYN == 'Y');
		
		System.out.println();
	}
	
	// 자료구조 전체 요소 출력 메서드
	public static void dispElement()
	{
		System.out.println("\n[요소 전체 출력]");
		for (Object obj : vt )
		{
			System.out.println((String)obj);
		}
		System.out.println("요소 전체 출력 완료~!!!");
		
		System.out.println();
	}
	
	// 자료구조 내 요소 검색 메서드
	public static void findElement() throws IOException
	{
		/*
		 >> 검색할 요소 입력 : 도우너
	 
		 [검색 결과 출력]
		 항목이 존재합니다.
		 항목이 존재하지 않습니다.
		*/
		
		String strName;
		int eleIdx;
		System.out.print(">> 검색할 요소 입력 : ");
		strName = br.readLine();
		eleIdx = vt.indexOf(strName);
		//System.out.println("eleIdx: " + eleIdx);
		
		System.out.println("\n[검색 결과 출력]");
		if (eleIdx < 0)
		{
			System.out.println("항목이 존재하지 않습니다.");
		} else {
			System.out.println("항목이 존재합니다.");
		}
		System.out.println();
	}
	
	// 자료구조 내 요소 삭제 메서드
	public static void delElement() throws IOException
	{
		/*
		 >> 삭제할 요소 입력 : 도우너
		 [삭제 결과 출력]
		 항목이 존재하지 않아 삭제할 수 없습니다.
		 도우너 항목이 삭제되었습니다.
		*/
		String strName;
		boolean isExisted;
		System.out.print(">> 삭제할 요소 입력 : ");
		strName = br.readLine();
		isExisted = vt.removeElement(strName);
		
		System.out.println("\n[삭제 결과 출력]");
		if (isExisted)
		{
			System.out.printf("%s 항목이 삭제되었습니다.\n", strName);
		} else {
			System.out.println("항목이 존재하지 않아 삭제할 수 없습니다.");
			
		}
		System.out.println();
		
	}
	
	// 자료구조 내 요소 수정(변경) 메서드
	public static void chaElement() throws IOException
	{
		/*
		 >> 변경할 요소 입력 : 마이콜
		 >> 수정할 내용 입력 : 둘리
		 
		 [변경 결과 출력]
		 변경이 완료되었습니다.
	 
		 >> 변경할 요소 입력 : 도우너
		 
		 [변경 결과 출력]
		 도우너 대상이 존재하지 않습니다.
		*/
		
		String strName, strNewName;
		int idxEle;
		boolean isExisted;
		System.out.print(">> 변경할 요소 입력 : ");
		strName = br.readLine();
		idxEle = vt.indexOf(strName);
		
		if (idxEle < 0)
		{
			System.out.println("\n[변경 결과 출력]");
			System.out.printf("%s 대상이 존재하지 않습니다.\n", strName);
		} else {
			System.out.print(">> 수정할 내용 입력 : ");
			strNewName = br.readLine();
			vt.set(idxEle, strNewName);
			System.out.println("\n[변경 결과 출력]");
			System.out.println("변경이 완료되었습니다.");
		}
		
		System.out.println();
	}
	
	// 프로그램 종료 메서드 → 완료
	public static void exit()
	{
		System.out.println("\n프로그램 종료~!!!");
		System.exit(-1);
		//System.exit(0);
	}
	
	// main() 메서드 → 완료
	public static void main(String[] args) throws IOException
	{
		int count = 2;
		// 
		do
		{
			menuDisp();
			menuSelect();
			menuRun();
		}
		while (true);
	}
}
