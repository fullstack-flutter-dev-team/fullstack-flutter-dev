/*===================================
	■■■ 자바의 개요 및 특징 ■■■
	- 변수와 자료형
	- 키워드 및 식별자
===================================*/

public class Test004
{
	public static void main(String[] args)
	{
		//double height = 171;//double: 8-바이트 정수형
		//System.out.println(height);
		//-->> 171.0
		
		double height = 171.7;
		int age = 25;
		char grade = 'A';
		
		String name = "김철수";
		
		//String name = "이영희";
		//-- 스코프 영역 안에서 변수명은 식별자!!!
		
		//String #name = "조영희";
		//-- $ _ 를 제외한 다른 특수문자는
		//	변수의 이름으로 활용할 수 없다.
		//	그나마, 사용 가능한 이들 특수문자도
		//	함부로 사용하지 말아야 한다.
		//	(일반적으로 규칙을 갖고 사용할 수 있도록 처리)
		
		//int tel = 01023451234;// ❌ - 접두어 0은 8진수를 의미한다.
		//long tel = 01023451234;// ❌
		//long tel = 01023451234L;// ❌
		// 0014110 → 14110
		// 01023451234L 1023451234L
		//--숫자로만 구성된 데이터라 할지라도,
		//	맨 앞에 0이 올 수 있는 구조라면 숫자 형식으로 처리해서는 안된다.
		
		String _tel = "01023451234";
		System.out.println("_tel: " + _tel);
		
		String 주소 = "강서구 마두동";
		
		// 결과 출력
		System.out.println("name : " + name);
		System.out.println("age : " + age);
		System.out.println("_tel : " + _tel);
		System.out.println("주소 : " + 주소);
		
	}
}
//--실행 결과
/*
_tel: 01023451234
name : 김철수
age : 25
_tel : 01023451234
주소 : 강서구 마두동
 */