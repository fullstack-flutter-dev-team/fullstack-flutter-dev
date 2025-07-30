/** ======================================
 *     ScoreProcess.java
 *  ======================================
 */
package com.test;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * @author sist
 *
 */
public class ScoreProcess
{
    // 주요 속성 구성
    private ScoreDAO dao;

    // 생성자 정의
    public ScoreProcess()
    {
        dao = new ScoreDAO();
    }


    // 1. 성적 입력
    public void sungjukInsert()
    {
        try {
            // 데이터베이스 연결
            dao.connection();

            // 안내 메세지 출력을 위한 인원 수 확인
            int count = dao.count();

            // 상세 데이터 입력을 위한 Scanner 객체 생성
            Scanner sc = new Scanner(System.in);

            do { 
                System.out.printf("%d번 학생 성적 입력() : ", ++count);
                String name = sc.next();
                if (name.equals("."))
                {
                    break;
                }

                int kor = sc.nextInt();
                int eng = sc.nextInt();
                int mat = sc.nextInt();

                // ScoreDTO 객체 구성
                ScoreDTO dto = new ScoreDTO();
                dto.setName(name);
                dto.setKor(kor);
                dto.setEng(eng);
                dto.setMat(mat);
                
                // dao의 add() 메서드 호출 -> ScoreDTO 객체 필요
                //       ---- name, kor, eng, mat
                dao.add(dto);
            } while (true);

            dao.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    
    // 2. 성적 전체 출력
    public void sungjukSelectAll()
    {
        try {
            // 데이터베이스 연결
            dao.connection();
    
            // 전체 인원 수 확인
            int count = dao.count();

            System.out.printf("\n전체 인원 : %d명\n", count);
            System.out.println("----------------------------------------------");
            System.out.println("번호   이름     국어  영어 수학  총점  평균  석차");
            System.out.println("----------------------------------------------");
            for (ScoreDTO dto : dao.lists())
            {
                System.out.printf("%3s %5s %5d %4d %4d %5d %6.1f  %4d\n"
                ,dto.getSid(), dto.getName()
                ,dto.getKor(), dto.getEng(), dto.getMat()
                ,dto.getTot(), dto.getAvg(), dto.getRank() );
                
            }
            
            System.out.println("----------------------------------------------");
            dao.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    
    // 3. 성적 검색 출력
    public void sungjukSearchName()
    {
        try {
            // 검색할 이름 입력
            Scanner sc = new Scanner(System.in);
            System.out.print("검색할 이름 입력 : ");
            String name = sc.next();

            // 데이터베이스 연결
            dao.connection();

            //int count = dao.count(name)
            ArrayList<ScoreDTO> arrayList = dao.lists(name);

            if (arrayList.size() > 0)
            {
                // 해당 이름을 가진 학생을 찾았다.
                System.out.printf("\n검색 인원 : %d명\n", arrayList.size());
                System.out.println("----------------------------------------------");
                System.out.println("번호   이름     국어  영어 수학  총점  평균  석차");
                System.out.println("----------------------------------------------");
                for (ScoreDTO dto : arrayList)
                {
                	System.out.printf("%3s %5s %5d %4d %4d %5d %6.1f  %4d\n"
                            ,dto.getSid(), dto.getName()
                            ,dto.getKor(), dto.getEng(), dto.getMat()
                            ,dto.getTot(), dto.getAvg(), dto.getRank() );
                }
                System.out.println("----------------------------------------------");
            } else {

                // 해당 이름을 가진 학생을 찾지 못했다.
                System.out.println("\n>> 검색 결과가 존재하지 않습니다.");
            }

            dao.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    // 4. 성적 수정
    public void sungjukUpdate()
    {
        try {
            // 수정할 번호 입력
            Scanner sc = new Scanner(System.in);
            System.out.printf("수정할 학생의 학번 입력 : ");
            int sid = sc.nextInt();

            // 데이터베이스 연결
            dao.connection();
            ArrayList<ScoreDTO> arrayList = dao.lists(sid);

            int count = dao.count(sid);
            if (count > 0)
            {     
                System.out.println("----------------------------------------------");
                System.out.println("번호   이름     국어  영어 수학  총점  평균  석차");
                System.out.println("----------------------------------------------");
                
                for (ScoreDTO dto : dao.lists())
                {
                	System.out.printf("%3s %5s %5d %4d %4d %5d %6.1f  %4d\n"
                            ,dto.getSid(), dto.getName()
                            ,dto.getKor(), dto.getEng(), dto.getMat()
                            ,dto.getTot(), dto.getAvg(), dto.getRank() );
                }
                System.out.println("----------------------------------------------");

                System.out.printf("수정 데이터 입력(국어 영어 수학) : ");
                int kor = sc.nextInt();
                int eng = sc.nextInt();
                int mat = sc.nextInt();

                ScoreDTO dto = new ScoreDTO();
                dto.setKor(kor);
                dto.setEng(eng);
                dto.setMat(mat);
                dto.setSid(String.valueOf(sid));

                int result = dao.modify(dto);
                if (result > 0) {
                    System.out.println(">> 수정이 완료되었습니다~!!!");
                }
            } else {
                System.out.println("\n>> 수정 대상이 존재하지 않습니다~!!!");
            }

            dao.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    
    // 5. 성적 삭제
    public void sungjukDelete()
    {
        try {
            // 삭제할 학번 입력
            Scanner sc = new Scanner(System.in);
            System.out.print("삭제할 학생의 학번 입력 : ");
            int sid = sc.nextInt();

            // 데이터베이스 연결
            dao.connection();
            ArrayList<ScoreDTO> arrayList = dao.lists(sid);
            if (arrayList.size() > 0)
            {
                System.out.println("----------------------------------------------");
                System.out.println("번호   이름     국어  영어 수학  총점  평균  석차");
                System.out.println("----------------------------------------------");
                
                for (ScoreDTO dto : dao.lists())
                {
                	System.out.printf("%3s %5s %5d %4d %4d %5d %6.1f  %4d\n"
                            ,dto.getSid(), dto.getName()
                            ,dto.getKor(), dto.getEng(), dto.getMat()
                            ,dto.getTot(), dto.getAvg(), dto.getRank() );
                }
                System.out.println("----------------------------------------------");

                System.out.printf("정말 삭제하시겠습니까(Y/N)? : ");
                String response = sc.next();

                if (response.equals("Y") || response.equals("y"))
                {
                    int result = dao.remove(sid);
                    if (result > 0)
                    {
                        System.out.println("\n>> 삭제가 완료되었습니다~!!!");
                    }
                }

            } else {
                System.out.println("\n>> 삭제 대상이 존재하지 않습니다~!!!");
            }

            dao.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

}
