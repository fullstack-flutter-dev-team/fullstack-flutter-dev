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
public class EmpProcess
{
    // 주요 속성 구성
    private EmpDAO dao;

    // 생성자 정의
    public EmpProcess()
    {
        dao = new EmpDAO();
    }

    // 1. 직원 입력
    // 2. 직원 전체 출력
    // 3. 직원 검색 출력
    // 4. 직원 수정
    // 5. 직원 삭제



    // 1. 직원 입력
    public void empInsert()
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
                EmpDTO01 dto = new EmpDTO01();
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

    // 2. 사원 전체 출력
    public void empSelectAll()
    {
        try {
            // 정렬 기준열 선택
            Scanner sc = new Scanner(System.in);
            System.out.println("1. 사번 정렬");
            System.out.println("2. 이름 정렬");
            System.out.println("3. 부서 정렬");
            System.out.println("4. 직위 정렬");
            System.out.println("5. 급여 내림차순 정렬");
            System.out.print("메뉴 선택(1~5, -1종료) : ");
            int nSubMenu = sc.nextInt();

            if (nSubMenu == -1) {
                return;
            }

            // 데이터베이스 연결
            dao.connection();
    
            // 전체 인원 수 확인
            // int count = dao.count();
            System.out.println("----------------------------------------------");
            System.out.println("사원번호 사원명 주민번호  입사일  지역  전화번호  부서명 직위  수당 급여");
            System.out.println("----------------------------------------------");
            dao.empList(nSubMenu);
            for (EmpViewDTO dto : dao.empList(nSubMenu))
            {
                System.out.printf("%3d %5s  %14s %16s %6s %14s %6s %6s %d  %d\n"
                                , dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
                                , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
                                , dto.getJikwiName(), dto.getSudang(), dto.getPay()
                );
                
            }
            System.out.println("----------------------------------------------");

            dao.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    
    // 3. 사원 검색 출력
    public void empSearch()
    {
         try {
            // 검색할 이름 입력
            Scanner sc = new Scanner(System.in);
            System.out.println("1. 사번 검색");
            System.out.println("2. 이름 검색");
            System.out.println("3. 부서 검색");
            System.out.println("4. 직위 검색");
            System.out.print("메뉴 선택(1~5, -1종료) : ");
            int nSubMenu = sc.nextInt();

            if (nSubMenu == -1) {
                return;
            }
            
            switch (nSubMenu) {
                case 1: System.out.print("사번 : "); break;
                case 2: System.out.print("이름 : "); break;
                case 3: System.out.print("부서 : "); break;
                case 4: System.out.print("직위 : "); break;
                default: System.out.print("사번 : "); break;

            }
            
            String strValue = sc.next();

            // 데이터베이스 연결
            dao.connection();

            //int count = dao.count(name)
            ArrayList<EmpViewDTO> arrayList = dao.empSearchList(nSubMenu, strValue);

            if (arrayList.size() > 0)
            {
                // 해당 이름을 가진 학생을 찾았다.
                System.out.printf("\n검색 인원 : %d명\n", arrayList.size());
                System.out.println("----------------------------------------------");
                System.out.println("사원번호 사원명 주민번호  입사일  지역  전화번호  부서명 직위  수당 급여");
                System.out.println("----------------------------------------------");
                for (EmpViewDTO dto : dao.empSearchList(nSubMenu, strValue))
                {
                    System.out.printf("%3d %5s  %14s %16s %6s %14s %6s %6s %d  %d\n"
                                    , dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
                                    , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
                                    , dto.getJikwiName(), dto.getSudang(), dto.getPay()
                    );
                    
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

    // 4. 직원 정보 수정
    public void empUpdate()
    {
        try {
            // 수정할 번호 입력
            Scanner sc = new Scanner(System.in);
            System.out.printf("수정할 직원의 직원번호 입력 : ");
            String strEmpId = sc.next();

            // 데이터베이스 연결
            dao.connection();
            ArrayList<EmpViewDTO> arrayList = dao.empSearchList(1, strEmpId);

            if (arrayList.size() > 0)
            {     
                // 해당 이름을 가진 학생을 찾았다.
                System.out.printf("\n검색 인원 : %d명\n", arrayList.size());
                System.out.println("----------------------------------------------");
                System.out.println("사원번호 사원명 주민번호  입사일  지역  전화번호  부서명 직위  수당 급여");
                System.out.println("----------------------------------------------");
                for (EmpViewDTO dto : dao.empSearchList(1, strEmpId))
                {
                    System.out.printf("%3d %5s  %14s %16s %6s %14s %6s %6s %d  %d\n"
                                    , dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
                                    , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
                                    , dto.getJikwiName(), dto.getSudang(), dto.getPay()
                    );
                    
                }
                System.out.println("----------------------------------------------");

                // System.out.printf("수정 데이터 입력(국어 영어 수학) : ");
                // int kor = sc.nextInt();
                // int eng = sc.nextInt();
                // int mat = sc.nextInt();

                // EmpDTO01 dto = new EmpDTO01();
                // dto.setKor(kor);
                // dto.setEng(eng);
                // dto.setMat(mat);
                // dto.setSid(String.valueOf(sid));

                // int result = dao.modify(dto);
                // if (result > 0) {
                //     System.out.println(">> 수정이 완료되었습니다~!!!");
                // }
            } else {
                System.out.println("\n>> 수정 대상이 존재하지 않습니다~!!!");
            }

            dao.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    // 5. 직원 삭제
    public void empDelete()
    {
        try {
            // 삭제할 학번 입력
            Scanner sc = new Scanner(System.in);
            System.out.print("삭제할 사원의 직원 번호 입력 : ");
            int nEmpID = sc.nextInt();

            // 데이터베이스 연결
            dao.connection();
            ArrayList<EmpViewDTO> arrayList = dao.empList(1);
            if (arrayList.size() > 0)
            {
                      // 해당 이름을 가진 학생을 찾았다.
                System.out.printf("\n검색 인원 : %d명\n", arrayList.size());
                System.out.println("----------------------------------------------");
                System.out.println("사원번호 사원명 주민번호  입사일  지역  전화번호  부서명 직위  수당 급여");
                System.out.println("----------------------------------------------");
                for (EmpViewDTO dto : dao.empSearchList(1, String.valueOf(nEmpID)))
                {
                    System.out.printf("%3d %5s  %14s %16s %6s %14s %6s %6s %d  %d\n"
                                    , dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
                                    , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
                                    , dto.getJikwiName(), dto.getSudang(), dto.getPay()
                    );
                    
                }
                System.out.println("----------------------------------------------");

                System.out.printf("정말 삭제하시겠습니까(Y/N)? : ");
                String response = sc.next();

                if (response.equals("Y") || response.equals("y"))
                {
                    int result = dao.removeEmp(nEmpID);
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
