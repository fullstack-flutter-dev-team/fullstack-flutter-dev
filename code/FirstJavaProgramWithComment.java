public class FirstJavaProgramWithComment
{
    public static void main(String[] args)
    {
        System.out.println("Welcome to Java");
        System.out.println("First Java Program");
        // 여기서 종료!
        
        // long num = 2500000000; // 정수 기본형: int
        long num = 2500000000l;
        System.out.println("num(long): " + num);
        
        // float num3 = 12.45; // 실수 기본형:  double
        float num3 = 12.45f;
        System.out.println("num3(float): " + num3);

        // 자동 형 변환의 규칙에 위배되지만 변환이 필요한 상황
        long num11 = 2147483648L;
        int num22 = (int)num11;
        System.out.println("num22: " + num22);

        // 자동 형 변환 발생지점의 표시를 위해서
        int num33 = 100;
        // long num44 = num33; // ⭕
        long num44 = (long)num33; // ⭕
        System.out.println("num44: " + num44);


    }
}