/**
 * 
 */
package com.test;

import java.util.Scanner;

/**
 * @author sist
 *
 */
public class ScoreMain
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{

		Scanner sc = new Scanner(System.in);
		ScoreProcess process = new ScoreProcess();

		do { 
			System.out.println();
			System.out.println("=================== 성적 처리 =======================");
			System.out.println("1. 성적 입력");
			System.out.println("2. 성적 전체 출력");
			System.out.println("3. 이름 검색 출력");
			System.out.println("4. 성적 수정");
			System.out.println("5. 성적 삭제");
			System.out.println("====================================================");
			System.out.print("선택(1~5, -1:종료) : ");

			String menus = sc.next();

			try {
				int menu = Integer.parseInt(menus);

				if (menu == -1)
				{
					System.out.println("\n>> 프로그램이 종료되었습니다~!!!");
					return;
				}

				switch (menu)
				{
					case 1: process.sungjukInsert(); break;
					case 2: process.sungjukSelectAll(); break;
					case 3: process.sungjukSearchName(); break;
					case 4: process.sungjukUpdate(); break;
					case 5: process.sungjukDelete(); break;
				}
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		} while (true);
	}

}
