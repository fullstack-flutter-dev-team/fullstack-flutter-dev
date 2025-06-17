/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  ArrayList 클래스
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Class ArrayList<E>](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html)
/// @see [Class Arrays](https://docs.oracle.com/javase/8/docs/api/java/util/Arrays.html)

/// @see [Class ArrayList<E>](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html)
/// @see [add(E e)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#add-E-)
/// @see [add(int index, E element)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#add-int-E-)
/// @see [clear()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#clear--)
/// @see [clone()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#clone--)
/// @see [get(int index)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#get-int-)
/// @see [isEmpty()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#isEmpty--)
/// @see [addAll(Collection<? extends E> c)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#addAll-java.util.Collection-)
/// @see [contains(Object o)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#contains-java.lang.Object-)
/// @see [indexOf(Object o)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#indexOf-java.lang.Object-)
/// @see [iterator()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#iterator--)
/// @see [lastIndexOf(Object o)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#lastIndexOf-java.lang.Object-)
/// @see [listIterator()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#listIterator--)
/// @see [listIterator(int index)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#listIterator-int-)
/// @see [remove(int index)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#remove-int-)
/// @see [remove(Object o)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#remove-java.lang.Object-)
/// @see [trimToSize()](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#trimToSize--)
/// @see []()
/// @see []()

/// @see [Class Arrays](https://docs.oracle.com/javase/8/docs/api/java/util/Arrays.html)

/*

java.lang.Object
  ㄴjava.util.Arrays

java.util
  ㄴInterface List<E>

java.lang.Object
  ㄴjava.util.AbstractCollection<E>
      ㄴjava.util.AbstractList<E>
          ㄴjava.util.ArrayList<E>


*/

/*
 
    List → String[] : List.toArray()
    String[] → List : Arrays.asList()
    
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;
import java.util.Vector;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test173  // extends Object
{
	
	public static void main(String[] args)
	{
		
		// List 자료구조 mList 인스턴스 생성
		List<String> mList = new ArrayList<String>();
		
		
		// List 자료구조 mList에 요소 추가
		mList.add("10");
		mList.add("20");
		mList.add("30");
		// check~!!!
		// List → String[]
		// mList.toArray(new String[100]);
		String[] strArr = mList.toArray(new String[mList.size()]);  // mList.toArray(new String[3]);
		for (String str: strArr)
		{
			System.out.print(str + " ");
		}
		System.out.println();
		//--==>> 10 20 30 
		
		
		// check~!!!
		// String[] → List
		// Arrays.asList();
		List<String> mNewList = Arrays.asList(strArr);
		// ※ 『Arrays.asList()』의 반환 자료형는 『List』
		
		for (String str : mNewList)
		{
			System.out.print(str + " ");
		}
		System.out.println();
		//--==>> 10 20 30 
		
// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦		
	}
}