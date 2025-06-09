package JavaStudy.sort;

public class Test {
    
    public static void main(String[] args) {
        int[] arr = {64, 34, 25, 12, 22, 11, 90};

        System.out.println("Unsorted array: ");
        for (int num : arr) {
            System.out.print(num + " ");
        }
        
        long start = System.nanoTime();

        // Call the bubbleSort method to sort the array
        BubbleSort.bubbleSort(arr);

        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("\n\ntimeElapsed : " +  (timeElapsed * 1e-9));
        
        System.out.println("\nSorted array: ");
        for (int num : arr) {
            System.out.print(num + " ");
        }
        
    }
}
