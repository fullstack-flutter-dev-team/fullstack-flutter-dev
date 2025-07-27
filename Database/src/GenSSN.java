import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

public class GenSSN {
    
    public static String getSSN() {
        int nGeneration = 3; // 1 : 장년(교수) , 2 : 중년(관리자), 3 : 청년(수강생)
        Random rand = new Random();
        Calendar cal = Calendar.getInstance();
        // cal.setTimeInMillis(rand.nextLong());
        String s1 = null;
        String s2 = null;

        // 장년
        if (nGeneration == 1) {
            do {
                cal.setTimeInMillis(rand.nextLong());
                s1 = new SimpleDateFormat("yyMMdd").format(cal.getTime());;
            } while (s1.charAt(0) < '6');
        // 중년
        } else if (nGeneration == 2) {
            do {
                cal.setTimeInMillis(rand.nextLong());
                s1 = new SimpleDateFormat("yyMMdd").format(cal.getTime());;
            } while (s1.charAt(0) < '8');
        // 청년
        } else {
            do {
                cal.setTimeInMillis(rand.nextLong());
                s1 = new SimpleDateFormat("yyMMdd").format(cal.getTime());;
            } while (s1.charAt(0) != '0' && s1.charAt(0) != '8' && s1.charAt(0) != '9');
        }

        while(s2 == null || s2.length() < 6) {
            s2 = Integer.toString(rand.nextInt(299999));
        }
        int sum = 0;
        for (int i = 0; i < s1.length(); i++) {
            sum += Integer.parseInt(String.valueOf(s1.charAt(i))) * (i + 2);
            int j = i < 2 ? i + 8 : i;
            sum += Integer.parseInt(String.valueOf(s2.charAt(i))) * j;
        }
        int bit = 11 - (sum % 11);

        return s1 + "-" + s2 + (bit == 10 ? 0 : bit);
	}

    public static void main(String[] args) {
        String ssn;
        clearConsole();
        System.out.println("테스트 목적 SSN 생성");
        
        for (int i = 1; i <= 50; i++)
        {
            ssn = GenSSN.getSSN();
            if (ssn.length() > 14) {
                continue;
            }

            System.out.println(ssn);
        }
    }

    public final static void clearConsole()
    {
        try
        {
            final String os = System.getProperty("os.name");
            
            if (os.contains("Windows"))
            {
                // System.out.println("Windows");
                new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
                // Runtime.getRuntime().exec("cls");
            }
            else
            {
                Runtime.getRuntime().exec("clear");
            }
        }
        catch (final Exception e)
        {
            //  Handle any exceptions.
        }
    }
}
