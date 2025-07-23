import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

public class GenSSN {
    
    public static String getSSN() {
        Random rand = new Random();
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(rand.nextLong());
        String s1 = new SimpleDateFormat("yyMMdd").format(cal.getTime());
        String s2 = null;

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
        System.out.println("테스트 목적 SSN 생성");
        
        for (int i = 1; i <= 30; i++)
        {
            ssn = GenSSN.getSSN();
            System.out.println(ssn);
        }
    }
}
