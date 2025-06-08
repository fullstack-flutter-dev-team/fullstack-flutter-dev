package JavaStudy.sort;

public class MergeSort {
    
    public static void mergeSort(int[] arr, int left, int right) {
        if (left < right) {
            int mid = left + (right - left) / 2;
            mergeSort(arr, left, mid);
            mergeSort(arr, mid + 1, right);
            merge(arr, left, mid, right);
        }
        
    }

    // Merges two subarrays of arr[].
    // First subarray is arr[left..mid]
    // Second subarray is arr[mid+1..right]
    /**
     * Merges two subarrays of arr[].
     * First subarray is arr[left..mid].
     * Second subarray is arr[mid+1..right].
     *
     * @param arr  The array to be sorted.
     * @param left The starting index of the first subarray.
     * @param mid  The ending index of the first subarray and the midpoint.
     * @param right The ending index of the second subarray.
     */
    public static void merge(int[] arr, int left, int mid, int right) {
        int n1 = mid - left + 1;
        int n2 = right - mid;

        int[] L = new int[n1];
        int[] R = new int[n2];

        for (int i = 0; i < n1; ++i)
            L[i] = arr[left + i];
        for (int j = 0; j < n2; ++j)
            R[j] = arr[mid + 1 + j];

        int i = 0, j = 0;
        int k = left;
        while (i < n1 && j < n2) {
            if (L[i] <= R[j]) {
                arr[k] = L[i];
                i++;
            } else {
                arr[k] = R[j];
                j++;
            }
            k++;
        }

        while (i < n1) {
            arr[k] = L[i];
            i++;
            k++;
        }

        while (j < n2) {
            arr[k] = R[j];
            j++;
            k++;
        }
    }

    public static void main(String[] args) {
        // int[] arr = {38, 27, 43, 3, 9, 82, 10};
        int[] arr = {64, 34, 25, 12, 22, 11, 90};

        System.out.println("Unsorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }

        long start = System.nanoTime();

        // Call the mergeSort method to sort the array
        mergeSort(arr, 0, arr.length - 1);

        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("\n\ntimeElapsed : " +  (timeElapsed * 1e-9));

        System.out.println("\nSorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }
    }
}
