/**
 * ======================================
 *   FileManager.java
 *     - 
 * ======================================
 */

package com.test.mvc.util;

import java.io.File;

import javax.servlet.http.HttpServletResponse;

public class FileManager
{

    // 콘솔 출력용 컬러 코드
    public static String COLOR_RED      = "\u001B[31m" ;
    public static String COLOR_GREEN    = "\u001B[32m" ;
    public static String COLOR_YELLOW   = "\u001B[33m" ;
    public static String COLOR_BLUE     = "\u001B[34m" ;
    public static String COLOR_RESET    = "\u001B[0m" ;

    // 파일 다운로드 기능 수행
    // - saveFileName : 서버에 저장된 파일 이름
    // - originalFileName : 클라이언트가 업로드한 파일 이름
    // - path : 서버에 저장된 경로
    // - response : 응답 객체(HttpServletResponse)
    //-- ++ 추가로 request 도 구성해서 다른 작업 처리 가능 
    //-- (단, 지금은 다운로드 기능만을 수행하기 위해서 설정한 것이라 request 별도로 구성하지 않음)
    public static boolean doFileDownload(String saveFileName
                                       , String originalFileName
                                       , String path
                                       , HttpServletResponse response) {
        boolean result = false;

        String loadDir = path + File.separator + saveFileName;
        //                      --------------
        //                           "\\"
        
        // 확인
        System.out.println(COLOR_GREEN + " loadDir : " + loadDir);

        try {
            if (originalFileName == null || originalFileName.equals("")) {
                originalFileName = saveFileName;
            }

            originalFileName = new String(originalFileName.getBytes("EUC-KR"), "8859_1");
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            File file = new File(loadDir);

            if (file.exists()) {
                byte[] readByte = new byte[4 * 1024]; // 4KB

                // 다운로드 헤더 설정
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\";");
                // response.setHeader("Content-Transfer-Encoding", "binary;");
                // response.setContentLength((int) file.length());

                // 실제 다운로드 작업 수행
                // BufferedInputStream 으로 감싼 FileInputStream 객체 생성
                java.io.FileInputStream fin = new java.io.FileInputStream(file);
                java.io.BufferedInputStream bin = new java.io.BufferedInputStream(fin);

                // BufferedOutputStream 으로 감싼 response 의 OutputStream 객체 생성
                java.io.OutputStream outs = response.getOutputStream();
                java.io.BufferedOutputStream bout = new java.io.BufferedOutputStream(outs);

                int read = 0;
                while ((read = bin.read(readByte, 0, readByte.length)) != -1) {
                    bout.write(readByte, 0, read);
                }

                // 자원 반납(순서 유의)
                bout.flush();
                bout.close();
                bin.close();
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 파일이 존재하지 않아 정상적인 처리가 이루어지지 않을 경우 false 반환
        // 파일이 정상적으로 다운로드 되었을 경우 true 반환
        // -> 호출하는 쪽에서 처리할 수 있도록 함
        // return false;
        // result = false;

        // 최종 결과 반환
        return result;
    }

    // 실제 물리적 파일 삭제 기능 수행
    //-- saveFileName : 서버에 저장된 파일 이름
    //-- path : 서버에 저장된 경로
    public static void doFileDelete(String saveFileName
                                  , String path) {

        String fullFileName = path + File.separator + saveFileName;
        //                           --------------
        //                                "\\"

        // 확인
        System.out.println(">>> fullFileName : " + fullFileName);

        try {
            File file = new File(fullFileName);

            if (file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
