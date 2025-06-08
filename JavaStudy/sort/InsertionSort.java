package JavaStudy.sort;

public class InsertionSort {
    
    /**
     * Sorts the given array in ascending order using the insertion sort algorithm.
     *
     * @param arr the array to be sorted
     * 
     * Time Complexity: O(n^2) in the worst and average cases, O(n) in the best case when the array is already sorted.
     * Space Complexity: O(1) as it is an in-place sorting algorithm.
     */
    public static void insertionSort(int[] arr) {
        int n = arr.length;
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;

            // Move elements of arr[0..i-1], that are greater than key,
            // to one position ahead of their current position
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }

    public static void main(String[] args) {
        // int[] arr = {12, 11, 13, 5, 6};
        int[] arr = {64, 34, 25, 12, 22, 11, 90};

        System.out.println("Unsorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }

        long start = System.nanoTime();

        // Call the insertionSort method to sort the array
        insertionSort(arr);

        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("\n\ntimeElapsed : " +  (timeElapsed * 1e-9));

        System.out.println("\nSorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }
    }
}
