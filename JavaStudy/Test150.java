/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- Math 클래스
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class Math](https://docs.oracle.com/javase/8/docs/api/java/lang/Math.html) 

/*
java.lang.Object
 ㄴjava.lang.Math


  ○  java.lang.Math 클래스는
      수학(Mathematics)과 관련된 여러 속성들과 함수들을 제공하는 클래스로
      생성자가 있긴 하지만....『private』으로 선언되어 있기 때문에
      외부에서 객체(인스턴스)를 생성할 수 없다.
      단, 모든 메서드가 『static』으로 정의되어 있으므로
      객체를 생성하지 않고 바로 접근하여 사용하는 것이 가능하다.
      
     ○ java.lang.Math 클래스의 주요 상수 및 메서드 
         - public static final double E = 2.17...;
           : 자연 로그 상수
         - public static final double F = 3.14...;  
           : 원주율(π)  // ㅎ
         - public static double sin(double a)
         - public static double cos(double a)
         - public static double tan(double a)
           : sin(a), cos(a), tan(a) 값을 반환한다.(삼각함수)
 
         - public static double toRadians(double angdeg)
           : 각도(angdeg)를 라디안(radian)으로 바꾸어 반환한다.
         - public static double toDegress(double angrad)
           : 라디안(radian)을 각도(angdeg)로 바꾸어 반환한다.

         - public static double exp(double a)
           : e 의 a 승을 구하여 반환한다.
         - public static double log(double a)
           : 로그(log) 값을 구하여 반환한다.

         - public static double sqrt(double a)
           : a 의 제곱근을 구하여 반환한다.

         - public static double ceil(double a)
           : a 보다 크거나 같은 정수를 반환한다. (올림의 개념)

         - public static double floor(double a)
           : a 보다 작거나 같은 정수를 반환한다. (절삭의 개념)

         - public static double pow(double a, double b)
           : a 의 b 승을 구하여 반환한다.
           
         - public static int round(float a)
         - public static long round(double a)
           : a 를 반올림하여 결과값을 반환한다.
           
         - public static double random()
           : 0.0 ~ 1.0 사이의 난수(임의의 실수)를 발생시켜 반환한다.
*/


/*
    
*/

// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.IOException;
 

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test150  // extends Object
{

	public static void main(String[] args) throws IOException
	{
		System.out.println("원주율       : " + Math.PI);
		System.out.println("2의 제곱근   : " + Math.sqrt(2));
		//--
		//원주율       : 3.141592653589793
		//2의 제곱근   : 1.4142135623730951
		
		System.out.println("파이에 대한 Degree       : " + Math.toDegrees(Math.PI));
		System.out.println("2파이에 대한 Degree      : " + Math.toDegrees(2.0*Math.PI));
		//--
		//파이에 대한 Degree       : 180.0
		//2파이에 대한 Degree      : 360.0
		
		double redian45 = Math.toRadians(45);
		System.out.println("각도 45     : " + redian45);
		//--==>> 각도 45     : 0.7853981633974483
		
		System.out.println("sin 45     : " + Math.sin(redian45));
		System.out.println("cos 45     : " + Math.cos(redian45));
		System.out.println("tan 45     : " + Math.tan(redian45));
		//--
		//sin 45     : 0.7071067811865475
		//cos 45     : 0.7071067811865476
		//tan 45     : 0.9999999999999999		
		
		System.out.println("로그 25     : " + Math.log(25));
		//--=>>  로그 25     : 3.2188758248682006
		System.out.println("2의 4승     : " + Math.pow(2, 4));
		//--==>> 2의 4승     : 16.0
		
		
		for (int i = 0; i < 5 ; i++)
		{
			System.out.println("0.0 ~ 1.0 사이의 난수 : " + Math.random());
		}
		//--  실행 결과
		//0.0 ~ 1.0 사이의 난수 : 0.3690538422189925
		//0.0 ~ 1.0 사이의 난수 : 0.14700442085250398
		//0.0 ~ 1.0 사이의 난수 : 0.4793211732579228
		//0.0 ~ 1.0 사이의 난수 : 0.3636834344770411
		//0.0 ~ 1.0 사이의 난수 : 0.5258668804448814
		
		// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤  ⑥  ⑦   
		// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦





	}
	
	
	
}