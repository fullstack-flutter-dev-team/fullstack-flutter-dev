public class Ex0514
{
    public static void main(String[] args)
    {
        int num1=0, num2=0;
        boolean result;


        // SCE
        result = (num1 += 10) < 0 && (num2 += 10) > 0; // ⭕
        System.out.println("result: " + result);
        System.out.println("num1: " + num1 + ", num2: " + num2);
        
        result = (num1 += 10) > 0 || (num2 += 10) > 0;
        System.out.println("result: " + result);
        System.out.println("num1: " + num1 + ", num2: " + num2);
        
        // 자바는 사용자가 메모리에 직접 접근하지 못한다.
        int num11 = 7; // 메모리 사용량(4바이트 2회로 8-바이트): 7을 메모리에 (4-바이트), num11에 4-바이트 메모리
        int num22, num33; // 메모리 사용량(4-바이트 2개: 8-바이트)
        
        num22 = ++num11; // 8, 단항 연산자(증가 연산자), 지금 당장 1만큼 증가 시켜라
        num33 = --num11; // 7, 단항 연산자(감소 연산자), 지금 당장 1만큼 감소 시켜라.
        System.out.println("num11: " + num11);
        System.out.println("num22: " + num22);
        System.out.println("num33: " + num33);

        // 자바는 사용자가 메모리에 직접 접근하지 못한다.
        int num4 = 7; // 메모리 사용량(4바이트 2회로 8-바이트): 7을 메모리에 (4-바이트), num11에 4-바이트 메모리
        int num5, num6; // 메모리 사용량(4-바이트 2개: 8-바이트)
        
        num5 = num4++; // 8, 단항 연산자(증가 연산자), 다음에 1만큼 증가 시켜라
        num6 = num4--; // 7, 단항 연산자(감소 연산자), 다음에 1만큼 감소 시켜라.
        System.out.println("num4: " + num4);
        System.out.println("num5: " + num5);
        System.out.println("num6: " + num6);
        
        System.out.println("------------------------");
        // 비트 연산
        int num7 = 5;
        int num8 = 3;
        int num9 = -1;
        System.out.println("num7: " + 	Integer.toBinaryString(num7));
        System.out.println("num8: " + 	Integer.toBinaryString(num8));
        System.out.println("num9: " + 	Integer.toBinaryString(num9));
        System.out.println("num7 & num8: " + (num7 & num8));
        System.out.println("num7 | num8: " + (num7 | num8));
        System.out.println("num7 ^ num8: " + (num7 ^ num8));
        System.out.println("~num9: " + ~num9); // + 1 보다 ^ 가 더 빠름
        System.out.println("8 << 32: " + (8 << 32)); // ⭕ 8


    }
}