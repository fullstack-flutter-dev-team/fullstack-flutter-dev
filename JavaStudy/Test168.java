/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  벡터(Vector) - 검색 및 삭제
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class Vector<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html) 

/*
---------------------------------------
java.lang.Object
  ㄴjava.util.AbstractCollection<E>
     ㄴjava.util.AbstractList<E>
        ㄴjava.util.Vector<E>


---------------------------------------
    
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Vector;


// 클래스 → 사용자 정의 자료형으로 활용
class UserData
{
	// 주요 속성 구성 → 주요 변수 선언(멤버 변수)
	private String name; //-- 이름
	private int age;     //-- 나이
	
	// 생성자(매개변수 2개인 생성자) →  사용자 정의 생성자
	public UserData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}
	
	/**
	  사용자 정의 생성자가 구성될 경우
	   default 생성자가 자동으로 삽입되지 않기 때문에
	   default 생성자 형태의 생성자를 사용자 정의 생성자로 
	   추가 구성하게 되는 것이 일반적인 클래스 설계 과정
	   (반드시 설계해야 한다는 문법적인 규칙은 없다.)
	*/
	// 생성자(매개변수 없는 default생성자 형태의 생성자) → 사용자 정의 생성자
	public UserData()
	{
		//this("", 0);
		name = "";   //-- this.name = "";
		age = 0;     //-- this.age = 0;
		
	}
	
	// getter/setter 구성
	public String getName()
	{
		return this.name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public int getAge()
	{
		return this.age;
	}
	
	public void setAge(int age)
	{
		this.age = age;
	}

}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test168  // extends Object
{

	public static void main(String[] args)
	{
		
		// UserData 인스턴스 생성
		// 김한국-1 3세 / 김한국-2 17세 / 김한국-3 49세
		/*
		UserData ob1 = new UserData();
		ob1.setName("김한국-1");
		ob1.setAge(3);
		
		UserData ob2 = new UserData();
		ob2.setName("김한국-2");
		ob2.setAge(17);
		
		UserData ob3 = new UserData();
		ob3.setName("김한국-3");
		ob3.setAge(49);
		*/
		
		// 벡터 자료구조 v 생성
		Vector<UserData> v = new Vector<UserData>();
		
		// 벡터 자료구조 v에
		// 김한국-1 3세 / 김한국-2 17세 / 김한국-3 49세
		// 담아내기
		
		// ①
		/*
		UserData ob1 = new UserData();
		ob1.setName("김한국-1");
		ob1.setAge(3);
		v.add(ob1);
		
		UserData ob2 = new UserData();
		ob2.setName("김한국-2");
		ob2.setAge(17);
		v.add(ob2);
		
		UserData ob3 = new UserData();
		ob3.setName("김한국-3");
		ob3.setAge(49);
		v.add(ob3);
		*/
		
		// ②
		/*
		UserData ob1 = new UserData("김한국-1", 3);
		v.add(ob1);
		UserData ob2 = new UserData("김한국-2", 17);
		v.add(ob2);
		UserData ob3 = new UserData("김한국-3", 49);
		v.add(ob3);
		*/
		
		// ③
		v.add(new UserData("김한국-1",3));
		v.add(new UserData("김한국-2",17));
		v.add(new UserData("김한국-3",49));
		
		// 벡터 자료구조 v에 담긴 내용(요소) 전체 출력하기
		// 실행 예)
		/*
		  이름 : 김한국-1, 나이 :  3세
		  이름 : 김한국-2, 나이 : 17세
		  이름 : 김한국-3, 나이 : 49세
		*/
		
		// ①
		for (UserData obj : v)
		{
			System.out.printf("이름 : %3s , 나이 : %2d세\n", obj.getName(), obj.getAge());
		}
		//-- 실행 결과
		//이름 : 김한국-1 , 나이 :  3세
		//이름 : 김한국-2 , 나이 : 17세
		//이름 : 김한국-3 , 나이 : 49세
		
		System.out.println("--[2]---");
		// ②
		for (int i = 0; i < v.size(); i++)
		{
			System.out.printf("이름 : %4s, 나이 : %2d세 \n", v.elementAt(i).getName(), v.elementAt(i).getAge());
		}
		System.out.println();
		//-- 실행 결과
		//이름 : 김한국-1, 나이 :  3세 
		//이름 : 김한국-2, 나이 : 17세 
		//이름 : 김한국-3, 나이 : 49세 
		
		System.out.println("--[3]---");
		// ③
		for (int i = 0; i < v.size(); i++)
		{
			System.out.printf("이름 : %4s, 나이 : %2d세 \n", v.get(i).getName(), v.get(i).getAge());
		}
		System.out.println();
		//-- 실행 결과
		//이름 : 김한국-1, 나이 :  3세 
		//이름 : 김한국-2, 나이 : 17세 
		//이름 : 김한국-3, 나이 : 49세 
		
		System.out.println("--[4]---");
		// ④
		for (Object temp : v)   // Object obj = v.get(0); //-- Up_Casting
		{
			//  ((UserData)temp).getName(); //-- Down_Casting
			System.out.printf("이름: %4s , 나이: %d세 \n", ((UserData)temp).getName(), ((UserData)temp).getAge());
		}
		//--실행결과
		//이름: 김한국-1 , 나이: 3세 
		//이름: 김한국-2 , 나이: 17세 
		//이름: 김한국-3 , 나이: 49세 
		
	}


}