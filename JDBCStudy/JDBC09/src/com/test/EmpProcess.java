/** ======================================
 *     ScoreProcess.java
 *  ======================================
 */
package com.test;

import java.sql.SQLException;
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
    private String strCityList;
    private String strBuseoList;
    private String strJikwiList;
    private int nMinBasicpay;

    // 생성자 정의
    public EmpProcess()
    {
        dao = new EmpDAO();
    }

    // 지역/부서/직위 조회 -> xxx/xxxx/xxx/ 형태의 문자열로 재가공
    public void setExtraInfo() throws SQLException
    {
        try {
            // 데이터베이스 연결
            dao.connection();

            StringBuilder sbCityList = new StringBuilder();
            StringBuilder sbJikwiList = new StringBuilder();
            StringBuilder sbBuseoList = new StringBuilder();

            for (CityDTO city : dao.cityList()) {
                sbCityList.append(city.getCityLoc()).append("/");
            }

            for (JikwiDTO jikwi : dao.jikwiList()) {
                sbJikwiList.append(jikwi.getJikwiName()).append("/");
            }
            
            for (BuseoDTO buseo : dao.buseoList()) {
                sbBuseoList.append(buseo.getBuseoName()).append("/");
            }

            this.strCityList = sbCityList.toString();
            this.strBuseoList = sbBuseoList.toString();
            this.strJikwiList = sbJikwiList.toString();
            // System.out.println(strCityList);
            // System.out.println(strJikwiList);
            // System.out.println(strBuseoList);

        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            dao.close();
        }
    }

    // 1. 직원 입력
    public void empInsert() throws SQLException
    {
        try {
            // 기본사항 조회 및 변수 설정
            setExtraInfo();

            // 변수 선언
            int result = 0;
            String strName, strSsn, strIbsaDate;
            String strTel;
            String strCityName, strBuseo, strJikwi;
            int nCityId = -1, nBuseoId = -1, nJikwiId = -1;
            int nBasicPay, nSudang;
            EmpDTO empDTO = new EmpDTO();

            // 데이터베이스 연결
            dao.connection();

            // 상세 데이터 입력을 위한 Scanner 객체 생성
            Scanner sc = new Scanner(System.in);

            System.out.println();
            System.out.println("직원 정보 입력 ------------------");
            System.out.print("이름 : ");
            strName = sc.next();
            
            System.out.print("주민등록번호 입력(YYMMDD-NNNNNNN) : ");
            strSsn = sc.next();

            System.out.print("입사일(YYYY-MM-DD) : ");
            strIbsaDate = sc.next();

            do { 
                System.out.print("지역(" + strCityList + ") : ");
                strCityName = sc.next();
                if (!strCityList.contains(strCityName)) {
                    System.out.println("존재하지 않는 지역을 입력하셨습니다.");
                } else {
                    nCityId = dao.getCityIdByLoc(strCityName);
                }
            } while (nCityId < 0);

            System.out.print("전화번호 : ");
            strTel = sc.next();
            
            do { 
                System.out.print("부서(" + strBuseoList + ") : ");
                strBuseo = sc.next();
                if (!strBuseoList.contains(strBuseo)) {
                    System.out.println("존재하지 않는 부서를 입력하셨습니다.");
                } else {
                    nBuseoId = dao.getBuseoIdByName(strBuseo);
                }
            } while (nBuseoId < 0);

            do { 
                System.out.print("직위(" + strJikwiList + ") : ");
                strJikwi = sc.next();
                if (!strJikwiList.contains(strJikwi)) {
                    System.out.println("존재하지 않는 직위를 입력하셨습니다.");
                } else {
                    nJikwiId = dao.getJikwiIdByName(strJikwi);
                }
            } while (nJikwiId < 0);

            // 직급 기준 최저 기본급 설정
            nMinBasicpay = dao.getMinBasicpayByJikwi(strJikwi);

            do { 
                System.out.print("기본급(" + nMinBasicpay + " 이상) : ");
                nBasicPay = sc.nextInt();
                if (nBasicPay < nMinBasicpay) {
                    System.out.println("최저 기본급 보다 작은 액수를 입력하셨습니다.");
                }
            } while (nBasicPay < nMinBasicpay);

            System.out.print("수당 : ");
            nSudang = sc.nextInt();

            empDTO.setEmpName(strName);
            empDTO.setSsn(strSsn);
            empDTO.setIbsaDate(strIbsaDate);
            empDTO.setCityId(nCityId);
            empDTO.setTel(strTel);
            empDTO.setBuseoId(nBuseoId);
            empDTO.setJikwiId(nJikwiId);
            empDTO.setBasicpay(nBasicPay);
            empDTO.setSudang(nSudang);
            // System.out.println(empDTO.toString());

            result = dao.addEmp(empDTO);
            if (result > 0) {
                System.out.println(">> 직원 정보 입력 완료~!!!");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            dao.close();
        }
    }

    // 지역ID 조회
    public int getCityId(String cityLoc) throws SQLException
    {
        int result = 0;
        try {
             // 데이터베이스 연결
            dao.connection();
            result = dao.getCityIdByLoc(cityLoc);
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            dao.close();
        }
        return result;
    }

    // 부서ID 조회
    public int getBuseoId(String buseoName) throws SQLException
    {
        int result = 0;
        try {
             // 데이터베이스 연결
            dao.connection();
            result = dao.getBuseoIdByName(buseoName);
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            dao.close();
        }
        return result;
    }

    // 직위ID 조회
    public int getJikwiId(String jikwiName) throws SQLException
    {
        int result = 0;
        
        try {
             // 데이터베이스 연결
            dao.connection();
            result = dao.getJikwiIdByName(jikwiName);
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            dao.close();
        }
        return result;
    }

    // 2. 사원 전체 출력
    public void empSelectAll() throws SQLException
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
    
            System.out.println();
            System.out.println("전체 직원수 : " + dao.empList(nSubMenu).size());
            System.out.println("------------------------------------------------------------------------------------------------------------");
            System.out.println("사원번호  사원명       주민번호       입사일       지역      전화번호     부서명  직위    수당      급여");
            System.out.println("------------------------------------------------------------------------------------------------------------");
            dao.empList(nSubMenu);
            for (EmpViewDTO dto : dao.empList(nSubMenu))
            {
                System.out.printf("%4d     %4s   %15s  %10s    %3s  %14s  %3s  %3s  %8d  %8d\n"
                , dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
                , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
                , dto.getJikwiName(), dto.getSudang(), dto.getPay()
                );
                
            }
            System.out.println("------------------------------------------------------------------------------------------------------------");

        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            dao.close();
        }
    }
    
    // 3. 사원 검색 출력
    public void empSearch() throws SQLException
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

            // 직원조회
            ArrayList<EmpViewDTO> arrayList = dao.empSearchList(nSubMenu, strValue);

            if (!arrayList.isEmpty())
            {
                // 직원조회 결과 
                System.out.printf("\n검색 인원 : %d명\n", arrayList.size());
                System.out.println("------------------------------------------------------------------------------------------------------------");
                System.out.println("사원번호  사원명       주민번호       입사일       지역      전화번호     부서명  직위    수당      급여");
                System.out.println("------------------------------------------------------------------------------------------------------------");
                for (EmpViewDTO dto : dao.empSearchList(nSubMenu, strValue))
                {
                    System.out.printf("%4d     %4s   %15s  %10s    %3s  %14s  %3s  %3s  %8d  %8d\n"
                    , dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
                    , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
                    , dto.getJikwiName(), dto.getSudang(), dto.getPay()
                    );
                }
                System.out.println("------------------------------------------------------------------------------------------------------------");
            } else {

                // 해당 이름을 가진 학생을 찾지 못했다.
                System.out.println("\n>> 검색 결과가 존재하지 않습니다.");
            }

        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            dao.close();
        }
    }

    // 4. 직원 정보 변경
    public void empUpdate() throws SQLException
    {
        try {
            // 기본사항 조회 및 변수 설정
            setExtraInfo();

            // 변수 선언
            int result = 0;
            String strName, strSsn, strIbsaDate;
            String strTel;
            String strCityName, strBuseo, strJikwi;
            int nCityId = -1, nBuseoId = -1, nJikwiId = -1;
            int nBasicPay, nSudang;
            EmpDTO empDTO = new EmpDTO();

            // 수정할 번호 입력
            Scanner sc = new Scanner(System.in);
            System.out.printf("수정할 직원의 직원번호 입력 : ");
            String strEmpId = sc.next();

            // 데이터베이스 연결
            dao.connection();
            ArrayList<EmpViewDTO> arrayList = dao.empSearchList(1, strEmpId);

            if (!arrayList.isEmpty())
            {     
                // 변경할 직원의 기존정보 조회
                System.out.println("------------------------------------------------------------------------------------------------------------");
                System.out.println("사원번호  사원명       주민번호       입사일       지역      전화번호     부서명  직위    수당      급여");
                System.out.println("------------------------------------------------------------------------------------------------------------");
                for (EmpViewDTO dto : dao.empSearchList(1, strEmpId))
                {
                    System.out.printf("%4d     %4s   %15s  %10s    %3s  %14s  %3s  %3s  %8d  %8d\n"
                    , dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
                    , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
                    , dto.getJikwiName(), dto.getSudang(), dto.getPay()
                    );
                    
                }
                System.out.println("------------------------------------------------------------------------------------------------------------");
                System.out.println("직원 정보 입력 ------------------");
                System.out.print("이름 : ");
                strName = sc.next();
                
                System.out.print("주민등록번호 입력(YYMMDD-NNNNNNN) : ");
                strSsn = sc.next();

                System.out.print("입사일(YYYY-MM-DD) : ");
                strIbsaDate = sc.next();

                do { 
                    System.out.print("지역(" + strCityList + ") : ");
                    strCityName = sc.next();
                    if (!strCityList.contains(strCityName)) {
                        System.out.println("존재하지 않는 지역을 입력하셨습니다.");
                    } else {
                        nCityId = dao.getCityIdByLoc(strCityName);
                    }
                } while (nCityId < 0);

                System.out.print("전화번호 : ");
                strTel = sc.next();

                do { 
                    System.out.print("부서(" + strBuseoList + ") : ");
                    strBuseo = sc.next();
                    if (!strBuseoList.contains(strBuseo)) {
                        System.out.println("존재하지 않는 부서를 입력하셨습니다.");
                    } else {
                        nBuseoId = dao.getBuseoIdByName(strBuseo);
                    }
                } while (nBuseoId < 0);

                do { 
                    System.out.print("직위(" + strJikwiList + ") : ");
                    strJikwi = sc.next();
                    if (!strJikwiList.contains(strJikwi)) {
                        System.out.println("존재하지 않는 직위를 입력하셨습니다.");
                    } else {
                        nJikwiId = dao.getJikwiIdByName(strJikwi);
                    }
                } while (nJikwiId < 0);

                // 직급 기준 최저 기본급 설정
                nMinBasicpay = dao.getMinBasicpayByJikwi(strJikwi);

                do { 
                    System.out.print("기본급(" + nMinBasicpay + " 이상) : ");
                    nBasicPay = sc.nextInt();
                    if (nBasicPay < nMinBasicpay) {
                        System.out.println("최저 기본급 보다 작은 액수를 입력하셨습니다.");
                    }
                } while (nBasicPay < nMinBasicpay);

                System.out.print("수당 : ");
                nSudang = sc.nextInt();

                empDTO.setEmpId(Integer.parseInt(strEmpId));
                empDTO.setEmpName(strName);
                empDTO.setSsn(strSsn);
                empDTO.setIbsaDate(strIbsaDate);
                empDTO.setCityId(nCityId);
                empDTO.setTel(strTel);
                empDTO.setBuseoId(nBuseoId);
                empDTO.setJikwiId(nJikwiId);
                empDTO.setBasicpay(nBasicPay);
                empDTO.setSudang(nSudang);
                // System.out.println(empDTO.toString());

                result = dao.updateEmpInfo(empDTO);
                if (result > 0) {
                    System.out.println(">> 직원 정보 변경 완료~!!!");
                }
            } else {
                System.out.println("\n>> 수정 대상이 존재하지 않습니다~!!!");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            dao.close();
        }
    }

    // 5. 직원 삭제
    public void empDelete() throws SQLException
    {
        try {
            // 삭제할 학번 입력
            Scanner sc = new Scanner(System.in);
            System.out.print("삭제할 사원의 직원 번호 입력 : ");
            int nEmpID = sc.nextInt();

            // 데이터베이스 연결
            dao.connection();
            ArrayList<EmpViewDTO> arrayList = dao.empList(1);
            if (!arrayList.isEmpty())
            {
                // 삭제 직원 조회
                System.out.println("------------------------------------------------------------------------------------------------------------");
                System.out.println("사원번호  사원명       주민번호       입사일       지역      전화번호     부서명  직위    수당      급여");
                System.out.println("------------------------------------------------------------------------------------------------------------");
                for (EmpViewDTO dto : dao.empSearchList(1, String.valueOf(nEmpID)))
                {
                    System.out.printf("%4d     %4s   %15s  %10s    %3s  %14s  %3s  %3s  %8d  %8d\n"
                    , dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
                    , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
                    , dto.getJikwiName(), dto.getSudang(), dto.getPay()
                    );
                    
                }
                System.out.println("------------------------------------------------------------------------------------------------------------");

                System.out.printf("정말 삭제하시겠습니까(Y/N)? : ");
                String response = sc.next();

                if (response.equalsIgnoreCase("Y"))
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

        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            dao.close();
        }
    }

}
