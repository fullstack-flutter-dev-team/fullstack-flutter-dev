package JavaStudy.bitOp;

class BitShift {

    public static void main(String[] args) {
        int a = 8; // 1000 in binary
        int b = 2; // 0010 in binary
        int c = -1; // 100000 in binary 

        // Left shift
        int leftShiftResult = a << b; // 100000 in binary, which is 32 in decimal
        System.out.println("Left Shift: " + leftShiftResult);

        // Right shift
        int rightShiftResult = a >> b; // 0010 in binary, which is 2 in decimal
        System.out.println("Right Shift: " + rightShiftResult);

        // Unsigned right shift
        int unsignedRightShiftResult = a >>> b; // Same as right shift for positive numbers, so it's also 2
        System.out.println("Unsigned Right Shift: " + unsignedRightShiftResult);

        /// [자바에서 레프트 시프트 연산 주의할 점 (-1 << 32의 값은?)](https://velog.io/@ino5/%EC%9E%90%EB%B0%94-%EC%8B%9C%ED%94%84%ED%8A%B8-%EC%97%B0%EC%82%B0-132-1)
        System.out.println("-1 :  "     + -1 + ",  " + Integer.toBinaryString(-1));
        System.out.println("-1 << 30: " + (-1 << 30) + ",  " + Integer.toBinaryString(-1 << 30));
        System.out.println("-1 << 31: " + (-1 << 31) + ",  " + Integer.toBinaryString(-1 << 31) );
        System.out.println("-1 << 32: " + (-1 << 32) + ",  " + Integer.toBinaryString(-1 << 32) );
        System.out.println("((-1 << 31)<<1): " + ((-1 << 31)<<1));
        System.out.println("-1 >>> 1: " + (-1 >>> 1) + ",  " + Integer.toBinaryString(-1 >>> 1) );
        System.out.println("-1 >>> 10: " + (-1 >>> 10) + ",  " + Integer.toBinaryString(-1 >>> 10) );
        System.out.println("-1 >>> 31: " + (-1 >>> 31) + ",  " + Integer.toBinaryString(-1 >>> 31) );
        System.out.println("-1 >>> 32: " + (-1 >>> 32) + ",  " + Integer.toBinaryString(-1 >>> 32) );
    }
}