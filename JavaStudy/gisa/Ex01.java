public class Ex01
{
    static class Parent
    {
        int add(int n)
        {
            return n + 3;
        }

        static String print()
        {
           return "P";
        }

    }

    static class Child extends Parent
    {
        int add(int n)
        {
            return n + 7;
        }
        
        static String print()
        {
            return "C";
        }

    }


    public static void main(String [] args)
    {
        System.out.println("Hello world.");
        Parent p = new Child();

        System.out.print(p.add(3) + p.print());
    }
}