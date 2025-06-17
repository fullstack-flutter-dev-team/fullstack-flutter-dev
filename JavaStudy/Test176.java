/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  Map → ★HashTable, HashMap
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


/// @see [Interface Map<K,V>](https://docs.oracle.com/javase/8/docs/api/java/util/Map.html)
/// @see [Class Hashtable<K,V>](https://docs.oracle.com/javase/8/docs/api/java/util/Hashtable.html)
/// @see [Class HashMap<K,V>](https://docs.oracle.com/javase/8/docs/api/java/util/HashMap.html)
/// @see []()


/*

java.util
  ㄴInterface Map<K,V>

java.lang.Object
  ㄴjava.util.Dictionary<K,V>
      ㄴjava.util.Hashtable<K,V>

java.lang.Object
   ㄴjava.util.AbstractMap<K,V>
       ㄴjava.util.HashMap<K,V>

*/

/*
    Map → HashTable, HashMap
     º key 와 value 의 쌍으로 구성
*/

/*
     ○ java.util.Map 인터페이스
         키(key)를 값(value)에 매핑(mapping)하여
         동일한 키를 등록할 수 없고, 유일해야 하며,
         각 키는 한 개의 값만 매핑해야 한다.
         즉, 하나의 키에 대응하는 하나의 값을 갖는 형태의 자료구조이다.
         
     ○ Hashtable<K, V> 클래스
         - 해시테이블 구조를 객체 모델링한 클래스로
           검색이 용이하기 때문에 사용 빈도가 높은 편에 속한다.
         - 해시테이블이란 키(key)와 상응하는 데이터(value)로
           구분된 데이터 구조이다.
         - 데이터를 저장하고, 검색하기 위해서 키(key)로 접근하며
           이 구조에서는 키 값을 부여하면 해당 데이터(value)가 변환된다.
         - 또한, Hashtable클래스는 key 또는 value 의 값으로 null을 허용하지 않는다.
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Hashtable;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test176  // extends Object
{
	private static final String[] names = 
	{
		"김한국-1",
		"김한국-2",
		"김한국-3",
		"김한국-4"
	};
	
	private static final String[] tels =
	{
		"010-1111-5678",
		"010-2222-5678",
		"010-3333-5678",
		"010-4444-5678",
		"010-5555-5678"
	};
		
	
	public static void main(String[] args)
	{
		// Hashtable 자료구조 ht 인스턴스 생성
		Hashtable<String, String> ht = new Hashtable<String, String>();
		
		// ht라는 Hashtable 자료구조에
		// 각각의 배열(names, tels)에 담겨있는 데이터를 요소로 담아내기
		// → put(k, v);
		for (int i = 0; i < names.length; i++)    // names.length == tels.length ==> 5
		{
			//ht.put("도우너", "010-1111-1111");
			ht.put(names[i], tels[i]);
		}
		
		// Hashtable 자료구조 ht에서
		// key 를 이용한 데이터 검색
		// → get(k);
		String findName1 = "김한국-1";
		String str = ht.get(findName1);
		if (str != null)
		{
			System.out.println(findName1 + " 전화번호 : " + str);
		}
		System.out.println();
		//--==>> 김한국-1 전화번호 : 010-1111-5678
	}
}