/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- Object 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

// Test130.java 파일과 비교~!!!
/// @see [Test130.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test130.java)

/*
	○
	
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)



class NewCar  // extends Object
{
	/*
		......
	*/
	
	private int velocity;		//-- 자동차의 속도
	private int wheelNum;		//-- 자동차의 바퀴 갯수
	private String carName;		//-- 자동차의 이름
	
	// 생성자(사용자 정의 생성자)
	NewCar(int speed, String name, int wheel)
	{
		velocity = speed;
		carName = name;
		wheelNum = wheel;
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test133  // extends Object
{
	public static void main(String[] args)
	{
		NewCar nCar0 = new NewCar(320, "제네시스", 4);
		NewCar nCar1 = new NewCar(310, "BMW", 4);
		NewCar nCar2 = new NewCar(300, "포르쉐", 4);
		
		// Object 클래스
		// equals()
		System.out.println("1-0 : " + nCar0.equals(nCar1));
		System.out.println("1-1 : " + nCar1.equals(nCar2));
		System.out.println("1-2 : " + (nCar1 == nCar2));
		//-- 실행 결과
		//1-0 : false
		//1-1 : false
		//1-2 : false
		
		NewCar nCar3 = nCar1;	//-- 객체 복사 → 얕은 복사(참조형) 
								//				→ 주소값 복사
		System.out.println("2-1 : " + nCar1.equals(nCar3));
		System.out.println("2-2 : " + (nCar1 == nCar3));
		//-- 실행 결과
		//2-1 : true
		//2-2 : true
		
		// toString()
		System.out.println("3-1 : " + nCar1.toString());
		System.out.println("3-2 : " + nCar2.toString());
		System.out.println("3-3 : " + nCar3.toString());
		//-- 실행 결과
		//3-1 : NewCar@6d06d69c
		//3-2 : NewCar@7852e922
		//3-3 : NewCar@6d06d69c
		
		// hashCode()
		System.out.println("4-1 : " + nCar1.hashCode());
		System.out.println("4-2 : " + nCar2.hashCode());
		System.out.println("4-3 : " + nCar3.hashCode());
		//-- 실행 결과
		//4-1 : 1829164700 → 16진수 → 6d06d69c
		//4-2 : 2018699554
		//4-3 : 1829164700
		//-- 결과값을 16진수 형태로 변환하게 되면,
		//		『toString()』메서드가 반환한 결과값 확인 가능
		
		// getClass()
		System.out.println("5-1 : " + nCar1.getClass());
		System.out.println("5-2 : " + nCar2.getClass());
		System.out.println("5-3 : " + nCar3.getClass());
		//-- 실행 결과
		//5-1 : class NewCar
		//5-2 : class NewCar
		//5-3 : class NewCar
		//-- 생성된 객체를 통해(활용하여)
		//    해당 객체의 기반 설계도(클래스)를 확인할 수 있는 기능을 가진 메서드.
		
		// clone()		//-- 객체 복사, 깊은 복사
		
		// finalize()	//-- 객체 직렬화
		
		// 기타(wait()...) 나머지 메서드는 스레드 처리와 관련이 있다.
		
	}
	
}