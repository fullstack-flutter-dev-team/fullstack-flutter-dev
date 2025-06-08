package JavaStudy.sort;

public class ShellSort {

    /**
     * Sorts an array using the Shell Sort algorithm.
     *
     * Shell Sort is an optimization over Insertion Sort that allows the exchange of far-apart elements.
     * The algorithm uses a gap sequence to divide the array into subarrays, which are then sorted using
     * insertion sort. The gap is reduced in each iteration until it becomes 1, at which point the array
     * is fully sorted.
     *
     * Time Complexity:
     * - Best case: O(n log n) (depends on the gap sequence)
     * - Average case: O(n^(3/2)) (using the default gap sequence)
     * - Worst case: O(n^2)
     *
     * Space Complexity: O(1) (in-place sorting)
     *
     * The choice of the gap sequence significantly affects the performance of the algorithm. The default
     * sequence used here is gap = n / 2, reducing by half in each iteration.
     *
     * @param arr the array to be sorted
     */
    public static void shellSort(int[] arr) {
        int n = arr.length;
        // Start with a big gap, then reduce the gap
        for (int gap = n / 2; gap > 0; gap /= 2) {
            // Do a gapped insertion sort for this gap size
            for (int i = gap; i < n; i++) {
                int temp = arr[i];
                int j;
                // Shift earlier gap-sorted elements up until the correct location for arr[i] is found
                for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
                    arr[j] = arr[j - gap];
                }
                // Put temp (the original arr[i]) in its correct location
                arr[j] = temp;
            }
        }
    }

    public static void main(String[] args) {
        // int[] arr = {12, 34, 54, 2, 3};
        int[] arr = {64, 34, 25, 12, 22, 11, 90};

        System.out.println("Unsorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }

        long start = System.nanoTime();

        // Call the shellSort method to sort the array
        shellSort(arr);

        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("\n\ntimeElapsed : " +  (timeElapsed * 1e-9));
        System.out.println("\nSorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }
    }
}