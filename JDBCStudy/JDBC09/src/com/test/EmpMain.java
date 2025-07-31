/**
 * 
 */
package com.test;

import java.util.Scanner;

/**
 * @author sist
 *
 */
public class EmpMain
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{

		Scanner sc = new Scanner(System.in);
		EmpProcess process = new EmpProcess();

		do { 
			System.out.println();
			System.out.println("==== 직원 관리(데이터베이스 연동) ======");
			System.out.println("1. 직원 입력");
			System.out.println("2. 직원 전체 출력");
			System.out.println("   - 사번 정렬");
			System.out.println("   - 이름 정렬");
			System.out.println("   - 부서 정렬");
			System.out.println("   - 직위 정렬");
			System.out.println("   - 급여 내림차순 정렬");
			System.out.println("3. 직원 검색 출력");
			System.out.println("   - 사번 정렬");
			System.out.println("   - 이름 정렬");
			System.out.println("   - 부서 정렬");
			System.out.println("   - 직위 정렬");
			System.out.println("4. 직원 수정");
			System.out.println("5. 직원 삭제");
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
