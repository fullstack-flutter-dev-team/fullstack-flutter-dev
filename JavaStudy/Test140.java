/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- String 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯


// 추가 관찰

/*
	○ String 클래스는 내부 문자열 데이터에 대한 수정이 불가능하다.
		(즉, 내용 불변 : Immutable)
		문자열의 내용이 변경되면 새로운 객체를 생성하며,
		참조 대상을 잃어버린 객체는 가비지 컬렉션의 대상이 되고,
		새로운 객체에 새 주소를 활당하게 되므로
		해시코드도 변하게 된다.
		
	○ String 클래스 간에 『+』 연산자를 사용하게 되면
		문자열 간의 결합이 가능하며,
		String 클래스와 다른 클래스의 객체, 또는 기본형 데이터 간에 
		『+』 연산자를 사용하는 경우에도 
		내부적으로 자동 String 클래스로 변환이 가능하다.
		
		※ 눈으로(시각적, 표면적으로) 확인되는 결과는 이렇지만...
			String은 내용을 변경할 수 없기 때문에
			내부적으로 StringBuffer를 생성하여
			append() 메서드를 이용해 문자열 결합을 수행하게 된다.
			따라서 동적인 문자열을 많이 사용하는 servlet 등에서는
			되도록이면 String을 사용하는 것 보다
			StringBuffer나 char[] 을 사용하는 것이 효율적일 수 있다.
		
		==> 정적인 문자열을 처리하는 경우에는 주로 String클래스를 사용
			동적인 문자열을 처리하는 경우에는
			런 타임 시 동적으로 처리해주는 StringBuuffer 클래스를 
			사용하는 것이 효율적이다.
			
	○ String 객체의 생성 및 특징
	
		String 객체를 생성하는 방법은
		 ① 문자열 상수를 지정하는 방법과
		 ② String 클래스의 생성자를 이용하는 방법
		 이렇게 두 가지 방법이 있다.
		
		String str1 = "Java";
		String str2 = "Java";
		
		String str3  = new String("Java");
		String str4  = new String("Java");
	
		하지만, 『문자열 상수』 를 대입 연산자를 이용하여
		지정하는 방법을 통해 객체를 생성하는 경우와
		『new』 연산자를 이용하여 객체를 생성하는 것은
		내부적으로 의미가 다르다.
	
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.math.BigDecimal;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test140  // extends Object
{
	public static void main(String[] args)
	{
		String s1 = "seoul";	//-- 
		String s2 = "seoul";
		String s3 = new String("seoul");	//-- new →  새롭게 메모리에 저장공간 생성
		String s4 = new String("seoul");
		
		System.out.println("s1 : " + s1);
		System.out.println("s2 : " + s2);
		System.out.println("s3 : " + s3);
		System.out.println("s4 : " + s4);
		
		System.out.println("s1 == s2 : " + (s1 == s2));	// s1 과 s2는 같은 메모리 주소를 참조
		System.out.println("s2 == s3 : " + (s2 == s3));
		System.out.println("s3 == s4 : " + (s3 == s4));
		System.out.println("s4 == s1 : " + (s4 == s1));
		//-- 실행 결과
		//s1 == s2 : true
		//s2 == s3 : false
		//s3 == s4 : false
		//s4 == s1 : false
		
		/*
			※ s1과 s2객체가 참조하는 문자열 상수가 동일한 경우
				문자열이 저장된 기억장소의 영역이 동일하기 때문에
				s1 객체와 s2객체는 동일한 기억 장소를 참조하게 된다.
				하지만,
				s3와 s4는 동일한 영역이 아닌 다른 기억 공간을
				새롭게(→ new) 확보하여 문자열 상수를 그 기억 공간에 대입한 경우이므로
				두 인스턴스는 같은 영역을 참조하는 것이 아니다.
				따라서, 『s3 ==s4』 는 거짓이 되며,
				만약, 같은 문자열 상수인지의 여부를 비교해야 할 상황이라면
				『equals()』메서드를 이용해야 한다.
		*/
		

		System.out.println("s1.equals(s2) : " + s1.equals(s2));
		System.out.println("s2.equals(s3) : " + s1.equals(s3));
		System.out.println("s3.equals(s4) : " + s1.equals(s4));
		System.out.println("s4.equals(s1) : " + s1.equals(s1));
		//--
		//s1.equals(s2) : true
		//s2.equals(s3) : true
		//s3.equals(s4) : true
		//s4.equals(s1) : true
		
		//※ String클래스는 Object 클래스의 equals() 를 Overriding~!!!
		
		System.out.println("s1.hashCode() : " + s1.hashCode());
		System.out.println("s2.hashCode() : " + s2.hashCode());
		System.out.println("s3.hashCode() : " + s3.hashCode());
		System.out.println("s4.hashCode() : " + s4.hashCode());
		//--
		//s1.hashCode() : 109324212
		//s2.hashCode() : 109324212
		//s3.hashCode() : 109324212
		//s4.hashCode() : 109324212
		
		//※ 객체가 같으면 hashcode가 같지만...
		// hashcode 가 같다고 해서 같은 객체를 의미하는 것이 아니다~!!!
		
		
		 s2 += " korea";
		 System.out.println("s2 : " + s2);
		 //--==>> s2 : seoul korea
		 
		 s2 = " korea";
		 System.out.println("s2 : " + s2);
		 //--==>> s2 :  korea
		 
		 /*
			이와 같은 경우
			s2가 참조한 "seoul"이 저장된 영역은
			『s2 += " korea";』가 수행되는 시점에서
			해당 영역의 값이 변경되는 것이 아니라
			가비지 컬렉션의 대상이 되며,
			"seoul korea" 상수가 저장된 영역을
			s2가 참조하게 되었다가
			다시 s2가 참조한 "seoul korea"가 저장된 영역은
			『s2 = "korea";』가 수행되는 시점에서
			가비지 컬렉션의 대상이 되며,
			"korea" 문자열 상수가 새롭게 저장된 영역을
			s2가 참조하게 된다.
			
			
			==>> ※ String 객체의 내용은 불변이다~!!!
		 */
		 
	}
	
}