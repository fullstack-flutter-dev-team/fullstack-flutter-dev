/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- Wrapper 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/*
	○ 
	
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.math.BigDecimal;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test138  // extends Object
{
	public static void main(String[] args)
	{
		boolean bl = true;
		byte b = 3;
		int i = 256;
		
		Boolean bl2 = new Boolean(bl);
		Byte b2 = new Byte(b);
		Integer i2 = new Integer(i);
		
		//System.out.println(b2);
		//System.out.println(i2);
		//-- 실행 결과
		//3
		//256
		
		print(b2);
		print(i2);
	}
	
	/*
		static void print(Byte b)
		{  }
		
		static void print(Integer i)
		{  }
		
		static void print(Short b)
		{  }
		
		static void print(Long i)
		{  }
		
		static void print(Float b)
		{  }
		
		static void print(Double i)
		{  }
	*/
	
	/*
		static void print(Object obj)
		{
			
		}
	*/
	
	//static void print(Object obj)
	//{
	//	System.out.println("===print==>>> " + obj.getClass());
	//	
	//	Object ob = obj.getClass();
	//	
	//	if (ob == Boolean.class)
	//	{
	//		System.out.println(Boolean.valueOf((Boolean)obj));
	//		System.out.println(((Boolean)obj).booleanValue());
	//	} else if (ob == Byte.class) {
	//		System.out.println(((Byte)obj).byteValue());
	//		System.out.println(Byte.valueOf((Byte)obj));
	//	} else if (ob == Short.class) {
	//		System.out.println(Short.valueOf((Short)obj));
	//		System.out.println(((Short)obj).shortValue());
	//	} else if (ob == Integer.class) {
	//		System.out.println(Integer.valueOf((Integer)obj));
	//		System.out.println(((Integer)obj).intValue());
	//	} else if (ob == Long.class) {
	//		System.out.println(Long.valueOf((Long)obj));
	//		System.out.println(((Long)obj).longValue());
	//	} else if (ob == Double.class) {
	//		System.out.println(Double.valueOf((Double)obj));
	//		System.out.println(((Double)obj).doubleValue());
	//	} else if (ob == Float.class) {
	//		System.out.println(Float.valueOf((Float)obj));
	//		System.out.println(((Float)obj).floatValue());
	//	}

	//}
	
	// java.lang.Number 클래스(추상 클래스)는
	// 모든 숫자형 Wrapper 클래스의 부모 클래스
	// (상위 클래스, 슈퍼 클래스)이다.
	// b2, i2 변수의 Byte, Integer 자료형이 Number에 넘어오면서
	// 내부적으로 업캐스팅이 일어나게 된다.
	static void print(Number n)	// Byte → Number, Integer → Number 
	{
		System.out.println(n);
		//--
		//3
		//256
		
		/*
		if (n instanceof Integer)
		{
			System.out.println(n + "은 Integer 객체");
		} else if (n instanceof Byte) {
			System.out.println(n + "은 Byte 객체");
		}
		*/
	}
	
	
}