/** =========================================
 *   MemberMain.java
 *    - main() 메서드를 포함하는 테스트 클래스
 *  =========================================
 */

 
package com.test;

import java.sql.SQLException;
import java.util.Scanner;

import com.util.DBConn;

/**
 * @author sist
 *
 */
public class MemberMain
{

    /**
     * @param args
     */
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);

        try {
            MemberDAO dao = new MemberDAO();
            System.out.println(">> 데이터베이스 연결됨~!!!");

            int count = dao.count();

            do { 
                System.out.printf("이름 전화번호 입력(%d, 『.』 종료) : ", ++count);
                String name = sc.next();
                if (name.equals("."))
                {
                    break;
                }

                String tel = sc.next();

                // MemberDTO 객체 생성
                MemberDTO member = new MemberDTO();

                // MemberDTO 속성 구성
                member.setName(name);
                member.setTel(tel);

                int result = dao.add(member);
                
                if (result > 0)
                {
                System.out.println(">> 회원 정보 입력  완료~!!!\n");
            	}
            } while (true);
        
            // 테스트
            // System.out.println("반복 입력 처리 완료~!!!");

            // 데이터 출력
            System.out.println("-----------------------------");
            System.out.printf("전체 회원 수 : %d\n", dao.count());
            System.out.println("-----------------------------");
            System.out.println("번호    이름    전화번호");
            for (MemberDTO obj : dao.lists()) {
                System.out.printf("%3s  %7s  %16s\n", obj.getSid(), obj.getName(), obj.getTel());
            }

        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
			try {
				DBConn.close();
				System.out.println(">> 데이터베이스 연결 닫힘~!!!");
				System.out.println(">> 프로그램 종료됨~!!!");
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}

    }

}

//     -- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦