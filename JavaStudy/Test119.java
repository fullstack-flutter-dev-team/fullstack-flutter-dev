/*========================================================================
	■■■ 클래스 고급 ■■■
	-  추상 클래스(Abstract Class)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/* 
	○ 추상 클래스(Abstract class)는
		선언만 있고 정의가 없는 하나 이상의 메서드(추상 메서드)를 갖는 클래스로
		하위 클래스(자식 클래스)에서 오버라이딩(Overriding) 할 것으로 예상되는 메서드에 대해
		메모리 낭비 없이 미리 호출 계획을 세워두기 위해 만든다.
		- 추상클래스 ob  = new 추상클래스(); // 컴파일 에러 발생 - 인스턴스 생성 불가능
		- abstract 반환형 메서드(매개변수);
		
	○ 형식 및 구조
		[접근제어지시자] abstract class 클래스명
		{
			[접근제어시시자] abstract 반환_자료형 메서드명([매개변수, ] 매개변수);
		}
	
	○  특징
		클래스가 적어도 하나 이상의 추상 메서드를 포함할 때
		그 클래스는 클래스 앞에 『abstract』 키워드를 붙여
		추상 클래스로 명시해야 하며,
		추상 클래스로 선언한 경우에는
		불완전한 형태의 클래스이므로 객체를 생성할 수 없다.
		추상 메서드가 존재하지 않는 추상 클래스마저도
		객체를 생성할 수 없는 것이다.
		
		즉, 추상 클래스는 독립적으로 존재할 수 없기 때문에
		상속을 위해서만 존재하며,
		추상 클래스를 상속받은 하위 클래스에서는
		반드시 추상 메서드를 오버라이딩(overriding)해야 한다.
	
		※ 『abstract』 키워드는
			클래스와 메서드에서만 사용할 수 있으며
			멤버 변수나 로컬 변수에서는 사용할 수 없다.
		
	--------------------------------------------------	
		※ 선택정렬 사용하여 sorting 메서드 재정의
		실행 예)
		Source Data : 7 10 3 28 7
		Source Data : 3 7 7 10 28
		계속하려면 아무 키나 누르세요...
*/

 
/*
 ▣ 힌트: 
      ※ 
 
*/

// 클래스
//class SuperSortInt119
//		↓
// 추상 클래스
abstract class SuperSortInt119
{
	private int[] value;
	
	protected void sort(int[] value)
	{
		this.value = value;
		sorting();
	}
	
	// 추상 메서드
	//protected abstract void sorting();
	protected abstract void sorting();
	
	protected int dataLength()
	{
		return value.length;
	}
	
	// 『final』키워드로 인해
	// 이 클래스(SuperSortInt119)를 상속받는 클래스에서
	// 이 매서드를 재정의(Method Overriding)할 수 없다.
	protected final int compare(int i, int j)
	{
		int x = value[i];
		int y = value[j];
		
		if (x == y) {
			return 0;
		} else if (x > y) {
			return 1;
		} else {
			return -1;
		}
	}
	
	// 『final』키워드로 인해
	// 이 클래스(SuperSortInt119)를 상속받는 클래스에서
	// 이 매서드를 재정의(Method Overriding)할 수 없다.
	protected final void swap(int i, int j)
	{
		int temp = value[i];
		value[i] = value[j];
		value[j] = temp;
	}
	
}//close class SuperSortInt119


// 클래스
// main() 메서드를 포함하는 외부의 다른 클래스
//public class Test119
//		↓
// SuperSortInt119를  상속받은 자식 클래스
//public class Test119 extends SuperSortInt119
//		↓
// SuperSortInt119를  상속받은 추상 클래스
//public abstract class Test119 extends SuperSortInt119
//		↓
public class Test119 extends SuperSortInt119
{
	/*
	//private int[] value;
	
	protected void sort(int[] value)
	{
		this.value = value
		sorting();
	}
	
	protected abstract void sorting();
	
	protected int dataLength()
	{
		return value.length;
	}
	
	protected final int compare(int i, int j)
	{
		int x = value[i];
		int y = value[j];
		
		if (x == y) {
			return 0;
		} else if (x > y) {
			return 1;
		} else {
			return -1;
		}
	}
	
	protected final void swap(int i, int j)
	{
		int temp = value[i];
		value[i] = value[j];
		value[j] = temp;
	}
	*/
	
	int i, j; //-- 루프 변수
	static int[] data = {7, 10, 3, 28, 7};
	
	@Override
	//protected abstract void sorting(){
	protected void sorting() {
	//public void sorting(){
		// 선택 정렬(Test111.java)
		for (int i = 0 ; i < dataLength()-1; i++)
		{
			for (int j = i+1; j < dataLength(); j++)
			{
				// 크기 비교
				if (compare(i, j) > 0)
				{
					// 자리 바꿈
					swap(i,j);
				}
			}
		}
	}
	
	public static void main(String[] args)
	{
		//SuperSortInt119 ob = new SuperSortInt119(); //-- 컴파일 에러
		
		//  배열 요소 출력
		System.out.print("Source Data : ");
		for (int n : data )
		{
			System.out.printf("%d ", n);
		}
		System.out.println(); // 개행
		
		//Test119 ob = new Test119();
		//-- 에러 발생(컴파일 에러) , sorting() 메서드를 구현하지 않은 경우
		//Test119.java:115: error: Test119 is not abstract and does not override abstract method sorting() in SuperSortInt119
		//public class Test119 extends SuperSortInt119
		
		// 인스턴스 생성
		Test119 ob = new Test119();
		ob.sort(Test119.data);
		
		
		//  배열 요소 출력
		System.out.print("Sorted Data : ");
		for (int n : data )
		{
			System.out.printf("%d ", n);
		}
		System.out.println(); // 개행
		
		//-- 실행 결과
		//Source Data : 7 10 3 28 7 
		//Sorted Data : 3 7 7 10 28 
	}
	
}


/*
[선택 정렬]
7	10	3	28	7
3	10	7	28	7
3	7	10	28	7
3	7	7	28	10
3	7	7	10	28

*/
