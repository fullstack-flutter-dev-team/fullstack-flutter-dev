/*========================================================================
	■■■ 컬렉션 (Collection) ■■■
	-  Set → HashSet, ★TreeSet(정렬), ★Interface Comparator<T>
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

/// @see [Interface Comparator<T>](https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html)
/// @see [compare(T o1, T o2)](https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html#compare-T-T-)
/// @see []()

/// @see [Interface Set<E>](https://docs.oracle.com/javase/8/docs/api/java/util/Set.html)
/// @see [Class TreeSet<E>](https://docs.oracle.com/javase/8/docs/api/java/util/TreeSet.html)
/// @see [TreeSet(Comparator<? super E> comparator)](https://docs.oracle.com/javase/8/docs/api/java/util/TreeSet.html#TreeSet-java.util.Comparator-)
/// @see [TreeSet(SortedSet<E> s)](https://docs.oracle.com/javase/8/docs/api/java/util/TreeSet.html#TreeSet-java.util.SortedSet-)
/// @see [comparator()](https://docs.oracle.com/javase/8/docs/api/java/util/TreeSet.html#comparator--)
/// @see []()

/// @see [Class String](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html)
/// @see [compareTo(String anotherString)](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html#compareTo-java.lang.String-)
/// @see [compareToIgnoreCase(String str)](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html#compareToIgnoreCase-java.lang.String-)
/// @see []()


/*

java.util
  ㄴInterface Set<E>

java.util
  ㄴInterface Comparator<T>

java.lang.Object
  ㄴjava.util.AbstractCollection<E>
      ㄴjava.util.AbstractSet<E>
          ㄴjava.util.TreeSet<E>

java.lang.Object
  ㄴjava.lang.String

*/

/*
    Set → HashSet, TreeSet
    - 순서 없음
    - 중복을 허용하지 않는 구조(기본)
*/

/*
     ○ TreeSet<E> 클래스
         java.util.TreeSet<E> 클래스는
         Set 인터페이스를 상속한 SortedSet 인터페이스를 구현한 클래스로
         데이터를 추가하면 데이터들이 자동으로 오름차순 정렬이 된다.
       
       ※ 성능 때문에 사용 빈도가 많지 않음
       
*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.util.Comparator;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;


// main() 메서드를 포함하는 외부의 다른 클래스
public class Test175  // extends Object
{
	
	public static void main(String[] args)
	{
		// TreeSet 자료구조 set 인스턴스 생성
		TreeSet<String> set = new TreeSet<String>();
		
		// TreeSet 자료구조 set에 요소 추가
		// →  add()
		set.add("미션임파서블");
		set.add("범죄도시");
		set.add("이터널선샤인");
		set.add("마스터");
		set.add("너의결혼식");
		set.add("베테랑");
		set.add("타짜");
		set.add("인터스텔라");
		set.add("해리포터");
		set.add("에이아이");
		
		// Iterator를 활용하여 set요소 전체 출력
		Iterator<String> it1 = set.iterator();
		
		System.out.print("set 요소 전체 출력 : ");
		while (it1.hasNext())
		{
			System.out.print(it1.next() + " ");
		}
		System.out.println();
		//--==>> set 요소 전체 출력 : 너의결혼식 마스터 미션임파서블 범죄도시 베테랑 에이아이 이터널선샤인 인터스텔라 타짜 해리포터
		//-- 요소를 문자열로 구성하여 적재할 경우
		//    가나다순  → 문자열 오름차순 정렬 화인
		
		System.out.println("------------------------------------");
		
		/*
		// TreeSet 자료구조 set2 인스턴스 생성
		TreeSet<GradeDTO> set2 = new TreeSet<GradeDTO>();
		
		// TreeSet 자료구조 set2에 요소 추가
		set2.add(new GradeDTO("2505123", "김한국-1", 90, 80, 70));
		set2.add(new GradeDTO("2505337", "김한국-2", 91, 81, 71));
		set2.add(new GradeDTO("2505048", "김한국-3", 88, 78, 68));
		set2.add(new GradeDTO("2505156", "김한국-4", 99, 88, 77));
		set2.add(new GradeDTO("2505452", "김한국-5", 56, 86, 76));
		
		Iterator<GradeDTO> it3 = set2.iterator();
		
		// Iterator를 활용하여 set2 요소 전체 출력
		System.out.println("set2 요소 전체 출력 : ");
		while (it3.hasNext())
		{
			System.out.println((it3.next()));
		}
		System.out.println();
		*/
		//--==>> 에러 발생(런타임 에러)
		/*
		  Exception in thread "main" java.lang.ClassCastException: GradeDTO cannot be cast to java.lang.Comparable
		  at java.util.TreeMap.compare(TreeMap.java:1294)
		*/
		
		System.out.println("------------------------------------");
		// ※ MyComparator 클래스를 생성하여
		//    compare() 메서드를 재정의한 후 다시 구성
		TreeSet<GradeDTO> set2 = new TreeSet<GradeDTO>(new MyComparator<GradeDTO>());
		
		// TreeSet 자료구조 set2에 요소 추가
		set2.add(new GradeDTO("2505123", "김한국-1", 90, 80, 70));
		set2.add(new GradeDTO("2505337", "김한국-2", 91, 81, 71));
		set2.add(new GradeDTO("2505048", "김한국-3", 88, 78, 68));
		set2.add(new GradeDTO("2505156", "김한국-4", 99, 88, 77));
		set2.add(new GradeDTO("2505452", "김한국-5", 56, 86, 76));
		
		Iterator<GradeDTO> it3 = set2.iterator();
		
		// Iterator를 활용하여 set2 요소 전체 출력
		System.out.println("set2 요소 전체 출력 : ");
		while (it3.hasNext())
		{
			System.out.print((it3.next()) + " ");
		}
		System.out.println();
		//---
		//set2 요소 전체 출력 : 
		//GradeDTO@6d06d69c GradeDTO@7852e922 GradeDTO@4e25154f GradeDTO@70dea4e GradeDTO@5c647e05 
		
		System.out.println("-------------");
		
		// 위와 같이 객체 자체를 출력하는 것이 아니라
		// 객체가 갖고 있는 속성에 접근하여 출력할 수 있도록 처리
		Iterator<GradeDTO> it4 = set2.iterator();
		while (it4.hasNext())
		{
			GradeDTO dto = it4.next();
			System.out.printf("%7s %7s %4d %4d %4d %6d\n", 
				dto.getHak(),
				dto.getName(),
				dto.getKor(),
				dto.getEng(),
				dto.getMat(),
				dto.getTot()
				);
		}
		System.out.println();
		//-- 실행 결과(학번 기준 오름차순)
		/*
		  2505048   김한국-3   88   78   68    234
		  2505123   김한국-1   90   80   70    240
		  2505156   김한국-4   99   88   77    264
		  2505337   김한국-2   91   81   71    243
		  2505452   김한국-5   56   86   76    218
		*/
		//-- 실행 결과(학번 기준 내림차순)
		/*
		  2505452   김한국-5   56   86   76    218
		  2505337   김한국-2   91   81   71    243
		  2505156   김한국-4   99   88   77    264
		  2505123   김한국-1   90   80   70    240
		  2505048   김한국-3   88   78   68    234
		*/
		
		
		
		
// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
	}
}

// ※ 금융권 외에는 VO, DTO 혼용해서 사용, 
// VO   - Value Object
// DTO  - Data Transfer Object
// DAO  - Data Access Object

class GradeDTO
{
	
	// 주요 속성 구성
	private String hak;        //-- 학번
	private String name;       //-- 이름
	private int kor, eng, mat; //-- 국어, 영어, 수학 점수
	
	// 생성자(사용자 정의 생성자) → 5개의 매개변수를 가진 생성자
	public GradeDTO(String hak, String name, int kor, int eng, int mat)
	{
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	// ※ default 생성자 자동 삽입되지 않음~!!!
	
	// 생성자(사용자 정의 생성자) → default 생성자 형태(매개변수 없는 생성자)
	public GradeDTO()
	{
		this("", "", 0, 0, 0);
		/*
		     this.hak = "";
		     this.name = "";
		     this.kor = 0;
		     this.eng = 0;
		     this.mat = 0;
		*/
		
	}
	
	
	// getter / setter 구성
	//--------[hak]----
	public String getHak()
	{
		return this.hak;
	}
	
	public void setHak(String hak)
	{
		this.hak = hak;
	}
	
	//--------[name]----
	public String getName()
	{
		return this.name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public int getKor()
	{
		return this.kor;
	}
	
	public void setKor(int kor)
	{
		this.kor = kor;
	}
	
	public int getEng()
	{
		return this.eng;
	}
	
	public void setEng(int eng)
	{
		this.eng = eng;
	}
	
	public int getMat()
	{
		return this.mat;
	}
	
	public void setMat(int mat)
	{
		this.mat = mat;
	}
	
	// 추가 메서드 정의
	// → 추가 업무로직 구성 → 총점 산출
	public int getTot()
	{
		//return kor + eng + mat;
		return this.kor + this.eng  + this.mat;
	}
	
}



class MyComparator<T> implements Comparator<T>
{
	// 비교 기능을 수행하는 메서드 재정의
	@Override
	public int compare(T o1, T o2)
	{
		GradeDTO s1 = (GradeDTO) o1;
		GradeDTO s2 = (GradeDTO) o2;
		
		// 학번 기준(오름차순)
		//return Integer.parseInt("2505123") - Integer.parseInt("2505337");
		//return 2505123 - 2505337;
		//return -214
		//return Integer.parseInt(s1.getHak()) - Integer.parseInt(s2.getHak());
		
		// 학번 기준(내림차순)
		//return Integer.parseInt(s2.getHak()) - Integer.parseInt(s1.getHak());
		
		// 총점 기준(오름차순)
		//return s1.getTot() - s2.getTot();
		
		// 총점 기준(내림차순)
		//return s2.getTot() - s1.getTot();
		
		// 이름 기준(오름차순)
		//return 정수형;
		//return s1.getName() - s2.getName();  //-- (X)
		//return s1.getName().compareTo(s2.getName());
		return s1.getName().compareToIgnoreCase(s2.getName());
		
		// 이름 기준(내림차순)
		//return s2.getName().compareToIgnoreCase(s1.getName());
	}
}
//-- 실행 결과
// 학번 기준(오름차순)
/*
2505048   김한국-3   88   78   68    234
2505123   김한국-1   90   80   70    240
2505156   김한국-4   99   88   77    264
2505337   김한국-2   91   81   71    243
2505452   김한국-5   56   86   76    218
*/

// 학번 기준(내림차순)
/*
2505452   김한국-5   56   86   76    218
2505337   김한국-2   91   81   71    243
2505156   김한국-4   99   88   77    264
2505123   김한국-1   90   80   70    240
2505048   김한국-3   88   78   68    234
*/

// 총점 기준(오름차순)
/*
2505452   김한국-5   56   86   76    218
2505337   김한국-2   91   81   71    243
2505156   김한국-4   99   88   77    264
2505123   김한국-1   90   80   70    240
2505048   김한국-3   88   78   68    234
*/

// 총점 기준(내림차순)
/*
2505156   김한국-4   99   88   77    264
2505337   김한국-2   91   81   71    243
2505123   김한국-1   90   80   70    240
2505048   김한국-3   88   78   68    234
2505452   김한국-5   56   86   76    218
*/

// 이름 기준(오름차순)
/*
2505123   김한국-1   90   80   70    240
2505337   김한국-2   91   81   71    243
2505048   김한국-3   88   78   68    234
2505156   김한국-4   99   88   77    264
2505452   김한국-5   56   86   76    218
*/

// 이름 기준(내림차순)
// ※ 이름 기준 가나다 순 정렬
/*
2505452   김한국-5   56   86   76    218
2505156   김한국-4   99   88   77    264
2505048   김한국-3   88   78   68    234
2505337   김한국-2   91   81   71    243
2505123   김한국-1   90   80   70    240
*/