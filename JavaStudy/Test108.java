/*========================================================================
	■■■ 클래스와 인스턴스 ■■■
	-  메서드 오버로딩(Method Overloading)이 가능한 형태와 불가능한 형태
=========================================================================*/
// ※ ○ ★ 『  』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/* 
    ▣ 컴파일 에러 발생 시 
       Test097.java:2: error: unmappable character (0xE2) for encoding x-windows-949
	   ?뼚?뼚?뼚 諛곗뿴 ?뼚?뼚?뼚
	
	  ==[Javac 인수(E)]==▶ javac -encoding UTF-8 $(FileName)
*/

/* 

*/

/*
 ▣ 힌트:
 
*/

import java.util.Random;
import java.util.Scanner;

public class Test108
{
	public static void main(String[] args)
	{
		print();
		print(10);
		print('a');  // 자동 형변환 규칙 check~!!!!
		
		print(3.14);
		double result = print(3.14); // java 는 우측[print(3.14);]부터 해석한다.
	}
	
	public static void print() {}
	
	//public static void print() {}       //--(x)
	
	public static void print(int i) {}    //--(o)
	
	//public static void print(int j) {}    //--(x)
	
	public static void print(char c) {}    //--(o), 자동 형변환 규칙 check~!!!!
	
	public static void print(int i, int j) {}    //--(o)
	
	public static void print(double d) {}    //--(o), 자동 형변환 규칙 check~!!!!
	
	//public static void print(double e) { return 10.0; }    //--(x) 정의 불가
	
	public static double print(double e) { return 10.0; }    //--(x), ★★★#51, #55 충돌 발생
	
}