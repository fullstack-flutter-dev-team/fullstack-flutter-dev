/**
 * 
 */
package com.test;

import java.sql.SQLException;
import java.util.ArrayList;
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
    public static void main(String[] args) throws ClassNotFoundException, SQLException
    {
        int count;
        ArrayList<ScoreDTO> scoreList = new ArrayList<>();
        ScoreDAO dao = new ScoreDAO();
        Scanner sc = new Scanner(System.in);
        
        do { 
            count = dao.getCount();
            System.out.printf("%d번 학생 성적 입력(이름 국어 영어 수학)(. 종료) : ", (count+1));
            String name = sc.next();
            
            if (name.equals("."))
            {
                break;
            }
            
            ScoreDTO scoreDto = new ScoreDTO();
            scoreDto.setName(name);
            scoreDto.setKor(sc.next());
            scoreDto.setEng(sc.next());
            scoreDto.setMat(sc.next());
            // count = dao.addScore(scoreDto);
            // System.out.println(scoreDto.toString());
        } while (true);

        scoreList = dao.listAll();

        System.out.println("----------------------------------------------------");
        System.out.println("번호     이름  국어  영어  수학  총점  평균");
        for (ScoreDTO score : scoreList) {
            System.out.printf("%3s  %6s  %3s  %3s  %3s  %5s  %5s\n", score.getSid()
            , score.getName(), score.getKor(), score.getEng()
            , score.getMat(), score.getTot(), score.getAvg());
        }
        System.out.println("----------------------------------------------------");

        // disconnect db
        dao.disConn();
    }

}
