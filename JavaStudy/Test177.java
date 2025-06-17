/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  Map → HashTable, ★HashMap
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
         
     ○ HashMap<K, V> 클래스
         - Hashtable 클래스와 마찬가지로 Map 인터페이스에서 상속받은
           HashMap 클래스의 기능은 Hashtable과 동일하지만,
           Synchronization 이 없기 때문에 동시성 문제가 없다면
           (즉, 멀티 스레드 프로그램이 아닌 경우라면)
           HashMap 을 사용하는 것이 성능을 향상시킬 수 있다.
         - 또한, HashMap은 Hashtable과는 달리 null을 허용한다. ★
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Map;
import java.util.HashMap;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test177  // extends Object
{
	
	
	public static void main(String[] args) throws IOException
	{
		// HashMap 자료구조 map 인스턴스 생성
		//HashMap<String, String> map = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		
		// map 이라는 HashMap 자료구조에 요소 추가
		// → put();
		map.put("영화", "중경삼림");
		map.put("드라마", "오징어게임");
		map.put("만화", "슬램덩크");
		
		// 테스트(확인) → 더미 확인
		System.out.println(map);
		//--==>> {드라마=오징어게임, 영화=중경삼림, 만화=슬램덩크}
		//-- 데이터 매핑 구조 확인
		//   데이터 요소 격납 순서가 구성된 순서와 관계 없음
		
		
		// ※ null 관련 추가 관찰
		map.put(null, null);    //-- key, value 가 null
		
		// 테스트(확인) → 더미 확인
		System.out.println(map);
		//--==>> {null=null, 드라마=오징어게임, 영화=중경삼림, 만화=슬램덩크}
		//        ---------
		//         check~!!!
		
		map.put("동화", null);  //-- value 가 null
		//--==>> {null=null, 드라마=오징어게임, 영화=중경삼림, 동화=null, 만화=슬램덩크}
		//                                                      ---------
		//                                                        check~!!!

		map.put(null, "모나리자"); //-- key 가 null
		
		// 테스트(확인) → 더미 확인
		System.out.println(map);
		//--==>> {null=모나리자, 드라마=오징어게임, 영화=중경삼림, 동화=null, 만화=슬램덩크}
		//       ---------------
		//       ----check~!!!
		
		//==>> 데이터 입력 유형()에 따라 모든 종류의 null 입력이 가능하지만
		//      마지막 null 을 key로 매핑딘 "모나리자"가
		//      최초 null을 key 로 매핑하는 null을 덮어쓰는 상황이 발생하게 된다.
		//      즉, HashMap은 null을 하나의 고유한 key로 간주한다. (처리한다.)
		//      
		
		System.out.println("-----------------------------------");
		
		// ctrl + z --> null 
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("카테고리, 타이틀 입력(컴마 구분) : ");
		String[] temp;
		
		for (String str; (str = br.readLine()) != null; )
		{
			temp = str.split(",");
			if (temp.length < 2)
			{
				System.out.print("카테고리, 타이틀 입력(컴마 구분) : ");
				continue;
			}
			
			map.put(temp[0].trim(), temp[1].trim());
			
			// 테스트(확인) → 더미 확인
			System.out.println(map);
		}
		
	}
}