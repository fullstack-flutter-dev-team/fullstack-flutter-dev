/*===================================================================
	■■■ 배열 ■■■
	-  배열의 선언 및 초기화
	-  배열의 기본적 활용
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ ① ② ③ /* */ 

/* 
	『char』 자료형의 배열을 만들어
	그 배열의 각 방에 알파벳 대문자를 채우고
	채워진 그 배열의 전체 요소를 출력하는 프로그램을 구현한다.
	단, 채우는 구문과 출력하는 구문은 따로 분리하여 처리할 수 있도록 한다.
	
	실행 예)
	A B C E F ... X Y Z
	계속하려면 아무키나 누르세요...

*/

import java.util.Arrays;

public class Test085
{
	public static void main(String[] args)
	{
		/*
		// 배열 선언 및 초기화
		char[] cArr = new char[26];
		
		
		// 배열 초기화
		for (int i = 0; i< cArr.length; i++)
		{
			cArr[i] = (char)(i+65);
 		}
		
		// 배열요소 출력
		for (int i = 0; i< cArr.length; i++)
		{
			System.out.print(cArr[i] + " ");
 		}
		
		System.out.println();
		*/
		
		// 영문 알파벳 대문자 배열 구성
		// 방법 ①
		char[] arr1;
		arr1 = new char[26];
		
		//arr1 = 'A';
		arr1[0] = 'A';
		arr1[1] = 'B';
		// ...
		arr1[24] = 'Y';
		arr1[25] = 'Z';
		
		
		// 방법 ②
		char[] arr2 = {'A', 'B', /*...*/ 'Y','Z'};
		
		// 방법 ③
		char[] arr3 = new char[26];
		for (int i = 0, ch = 65; i < arr3.length; i++, ch++)	// i → 0 1 2 ... 24 25
		{
			arr3[i] = (char)ch;
		}
			
			
		// 배열 요소 전체 출력
		for (int i = 0; i < arr3.length; i++)
		{
			System.out.print(arr3[i] + " ");
		}
		
		System.out.println();	// 개행
	}
}

//// 실행 결과
//A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
//계속하려면 아무 키나 누르십시오 . . .