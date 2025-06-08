package JavaStudy.sort;

public class SelectionSort {
    
    /**
     * Sorts the given array in ascending order using the selection sort algorithm.
     *
     * @param arr the array to be sorted (modified in place)
     * 
     * Time Complexity: O(n^2) - Two nested loops are used to traverse the array.
     * Space Complexity: O(1) - Sorting is performed in-place without using extra space.
     */
    public static void selectionSort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            // Find the minimum element in unsorted array
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j;
                }
            }
            // Swap the found minimum element with the first element
            int temp = arr[minIndex];
            arr[minIndex] = arr[i];
            arr[i] = temp;
        }
    }

    public static void main(String[] args) {
        // int[] arr = {64, 25, 12, 22, 11};
        int[] arr = {64, 34, 25, 12, 22, 11, 90};

        System.out.println("Unsorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }

        long start = System.nanoTime();

        // Call the selectionSort method to sort the array
        selectionSort(arr);
        
        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("\n\ntimeElapsed : " +  (timeElapsed * 1e-9));        

        System.out.println("\nSorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }
    }
}
