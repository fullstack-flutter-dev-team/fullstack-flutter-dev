/*===================================================================
	■■■ 실행 흐름의 컨트롤(제어문) ■■■
		- 5장-03. 
			- 반복문(for문) 실습
===================================================================*/

/*
	다중 반복문(반복문의 중첩)을 활용한 별찍기
	
	과제
		다음과 같은 내용이 출력될 수 있도록
		반복문의 중첩 구문을 작성하여 프로그램을 구현한다.
		
	
	실행 예) 역삼각형
			★★★★★★★
			  ★★★★★
				★★★
				  ★
*/

public class Test067
{
	public static void main(String[] args)
	{
		/*
		int i, j, k = 5;
		for (i=7,k=1; i>3; i--,k++)
		{
			for (j=1; j<=8; j++)
			{
				if ((i+j) <= -2*k+17 && (i+j)> 8)
				{
					System.out.print("★");
					//System.out.printf("i=%d, j=%d",i, j);
				} else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}
		*/
		
		
		int i, j;
		
		for (i = 1; i<= 5; i++)
		{
			for (j = 1; j <= 10; j++)
			{
				if (j >= i && j <= (10-i))
				{
					System.out.print("★");
				} else {
					System.out.print(" ");
				}
				
			}
			System.out.println();
			
			
		}
	
		
	}
}

/*
★★★★★★★★★
 ★★★★★★★
  ★★★★★
   ★★★
    ★
계속하려면 아무 키나 누르십시오 . . .

*/