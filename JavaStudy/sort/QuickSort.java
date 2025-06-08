package JavaStudy.sort;

public class QuickSort {
    

    /**
     * Sorts the given array using the QuickSort algorithm.
     *
     * @param arr  The array to be sorted.
     * @param low  The starting index of the portion of the array to be sorted.
     * @param high The ending index of the portion of the array to be sorted.
     */
    public static void quickSort(int[] arr, int low, int high) {
        if (low < high) {
            int pivotIndex = partition(arr, low, high);
            quickSort(arr, low, pivotIndex - 1);
            quickSort(arr, pivotIndex + 1, high);
          
        
        }
    }
    // Lomuto partition scheme
    /**
     * Partitions the array around a pivot element such that elements smaller than
     * the pivot are on the left, and elements greater than the pivot are on the right.
     *
     * @param arr  The array to be partitioned.
     * @param low  The starting index of the portion of the array to be partitioned.
     * @param high The ending index of the portion of the array to be partitioned.
     * @return The index of the pivot element after partitioning.
     */
    private static int partition(int[] arr, int low, int high) {
        int pivot = arr[high];
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (arr[j] <= pivot) {
                i++;
                // swap arr[i] and arr[j]
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        // swap arr[i+1] and arr[high] (pivot)
        int temp = arr[i + 1];
        arr[i + 1] = arr[high];
        arr[high] = temp;
        return i + 1;
    }

    public static void main(String[] args) {
        // int[] arr = {10, 7, 8, 9, 1, 5};
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        int n = arr.length;

        System.out.println("Unsorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }
        
        long start = System.nanoTime();

        // Call the quickSort method to sort the array
        quickSort(arr, 0, n - 1);
        
        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("\n\ntimeElapsed : " +  (timeElapsed * 1e-9));        

        System.out.println("\nSorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }
    }

}
