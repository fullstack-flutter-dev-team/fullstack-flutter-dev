package JavaStudy.sort;

public class BubbleSort {

    /**
     * Sorts the given array in ascending order using the Bubble Sort algorithm.
     *
     * Time Complexity: O(n^2) in the worst and average cases, O(n) in the best case when the array is already sorted.
     * Space Complexity: O(1) as it is an in-place sorting algorithm.
     *
     * @param arr the array to be sorted
     */
    public static void bubbleSort(int[] arr) {
        int n = arr.length;
        boolean swapped;

        // Traverse through all array elements
        // Last i elements are already in place
        for (int i = 0; i < n - 1; i++) {
            swapped = false;

            // Last i elements are already sorted, so we can skip them
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    // swap arr[j] and arr[j+1]
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    
                    swapped = true;
                }
            }
            // If no two elements were swapped by inner loop, then break
            if (!swapped) {
                break;
            }
        }
    }

    public static void main(String[] args) {
        int[] arr = {64, 34, 25, 12, 22, 11, 90};

        System.out.println("Unsorted array: ");
        for (int num : arr) {
            System.out.print(num + " ");
        }
        
        long start = System.nanoTime();

        // Call the bubbleSort method to sort the array
        bubbleSort(arr);

        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("\n\ntimeElapsed : " +  (timeElapsed * 1e-9));
        
        System.out.println("\nSorted array: ");
        for (int num : arr) {
            System.out.print(num + " ");
        }
    }
}