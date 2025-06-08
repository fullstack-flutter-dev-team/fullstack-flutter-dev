package JavaStudy.sort;

/**
 * @see <a href="https://velog.io/@pppp0722/%EC%A0%95%EB%A0%AC-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-7%EA%B0%9C-%EC%A0%95%EB%A6%AC-Java">정렬 알고리즘 7개 정리 (Java)</a>
 */
/// @see [Java 23 Markdown comments - external links](https://stackoverflow.com/questions/79011202/java-23-markdown-comments-external-links)
/// @see [[알고리즘/JAVA] 정렬 알고리즘 : 선택, 삽입, 버블, 병합, 퀵 정렬](https://sjh9708.tistory.com/209)
/// @see [정렬 알고리즘 7개 정리 (Java)](https://velog.io/@pppp0722/%EC%A0%95%EB%A0%AC-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-7%EA%B0%9C-%EC%A0%95%EB%A6%AC-Java)

public class CompareSort {
    //--------------------------[bubbleSort]------------------------------------------
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

    //--------------------------[insertionSort]------------------------------------------
    /**
     * Sorts an array in ascending order using the Heap Sort algorithm.
     * This method first builds a max heap from the input array and then
     * repeatedly extracts the largest element (the root of the heap) and
     * places it at the end of the array, reducing the heap size each time.
     *
     * @param arr The array to be sorted.
     */
    public static void heapSort(int[] arr) {
        int n = arr.length;

        // Build heap (rearrange array)
        for (int i = n / 2 - 1; i >= 0; i--) {
            heapify(arr, n, i);
        }

        // One by one extract elements from heap
        for (int i = n - 1; i > 0; i--) {
            // Move current root to end
            int temp = arr[0];
            arr[0] = arr[i];
            arr[i] = temp;

            // call max heapify on the reduced heap
            heapify(arr, i, 0);
        }

    }

    // Heapifies a subtree rooted at index `i` in the array `arr`. The parameter `n`
    // represents the size of the heap.
    private static void heapify(int[] arr, int n, int i) {
        while (true) {
            int largest = i; // Initialize largest as root
            int left = 2 * i + 1; // left = 2*i + 1
            int right = 2 * i + 2; // right = 2*i + 2

            // If left child is larger than root
            if (left < n && arr[left] > arr[largest]) {
                largest = left;
            }

            // If right child is larger than largest so far
            if (right < n && arr[right] > arr[largest]) {
                largest = right;
            }

            // If largest is not root
            if (largest != i) {
                int swap = arr[i];
                arr[i] = arr[largest];
                arr[largest] = swap;

                // Continue heapifying the affected sub-tree
                i = largest;
            } else {
                break;
            }
        }
    }

    //--------------------------[insertionSort]------------------------------------------
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
    
    //--------------------------[mergeSort]------------------------------------------
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

    //--------------------------[quickSort]------------------------------------------
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

    //--------------------------[selectionSort]------------------------------------------
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

    //--------------------------[shellSort]------------------------------------------
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
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        int n = arr.length;

        System.out.println("Unsorted array: ");
        for (int num : arr) {
            System.out.print(num + " ");
        }

        System.out.println("\n---------------------------");

        //-------------------[bubbleSort]------------------------------------------
        long start = System.nanoTime();

        // Call the bubbleSort method to sort the array
        bubbleSort(arr);

        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("timeElapsed(bubbleSort) : " + (timeElapsed * 1e-9));
        //-------------------[heapSort]------------------------------------------
        start = System.nanoTime();

        // Call the heapSort method to sort the array
        heapSort(arr);

        finish = System.nanoTime();
        timeElapsed = finish - start;
        System.out.println("timeElapsed(heapSort) : " + (timeElapsed * 1e-9));

        //-------------------[insertionSort]------------------------------------------
        start = System.nanoTime();

        // Call the insertionSort method to sort the array
        insertionSort(arr);

        finish = System.nanoTime();
        timeElapsed = finish - start;
        System.out.println("timeElapsed(insertionSort) : " + (timeElapsed * 1e-9));

        //-------------------[mergeSort]------------------------------------------
        start = System.nanoTime();

        // Call the mergeSort method to sort the array
        mergeSort(arr, 0, arr.length - 1);

        finish = System.nanoTime();
        timeElapsed = finish - start;
        System.out.println("timeElapsed(mergeSort) : " + (timeElapsed * 1e-9));

        //-------------------[quickSort]------------------------------------------
        start = System.nanoTime();

        // Call the quickSort method to sort the array
        quickSort(arr, 0, n - 1);

        finish = System.nanoTime();
        timeElapsed = finish - start;
        System.out.println("timeElapsed(quickSort) : " + (timeElapsed * 1e-9));
      
        //-------------------[selectionSort]------------------------------------------
        start = System.nanoTime();

        // Call the selectionSort method to sort the array
        selectionSort(arr);

        finish = System.nanoTime();
        timeElapsed = finish - start;
        System.out.println("timeElapsed(selectionSort) : " + (timeElapsed * 1e-9));

        //-------------------[shellSort]------------------------------------------
        start = System.nanoTime();

        // Call the shellSort method to sort the array
        shellSort(arr);

        finish = System.nanoTime();
        timeElapsed = finish - start;
        System.out.println("timeElapsed(shellSort) : " + (timeElapsed * 1e-9));


        //-----------------------------------------------------------
        System.out.println("---------------------------");
        System.out.println("Sorted array: ");
        for (int num : arr) {
            System.out.print(num + " ");
        }
    }
}
