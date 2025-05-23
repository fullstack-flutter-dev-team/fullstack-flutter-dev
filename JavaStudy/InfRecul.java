


public class InfRecul
{
	public static void main(String[] args)
	{
		showHi(3);
	}
	
	
	public static void showHi(int cnt)			//	3
	{
		// 오류 코드
		/*
		//System.out.println("Hi~ ");
		System.out.printf("Hi~ (%d)\n", cnt);
		
		showHi(cnt--);							//	showHi(3);	showHi(3)....
		
		if (cnt == 1)
		{
			return;
		}
		*/

		/*
		// 정상코드
		System.out.printf("Hi~ (%d)\n", cnt);
		
		if (cnt-- == 1)
		{
			//테스트(확인)
			//System.out.println("cnt - 3 : " + (cnt -3));
			return;
		}
		
		showHi(cnt);
		*/
		
		/*
		System.out.println("Hi~ ");
		//System.out.printf("Hi~ (%d)\n", cnt);
		
		showHi(--cnt);							//	showHi(2);	showHi(1);	showHi(0);	showHi(-1)....
		
		if (cnt == 1)
		{
			return;
		}
		*/
		
		System.out.println("Hi~ ");
		//System.out.printf("Hi~ (%d)\n", cnt);
		
		
		if (cnt == 1)
		{
			return;
		}
		
		showHi(--cnt);							//	showHi(2);	....
	}
}