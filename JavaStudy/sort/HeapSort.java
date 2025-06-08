package JavaStudy.sort;

public class HeapSort {

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

    public static void main(String[] args) {
        // int[] arr = {12, 11, 13, 5, 6, 7};
        int[] arr = {64, 34, 25, 12, 22, 11, 90};

        System.out.println("Unsorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }

        long start = System.nanoTime();
        
        // Call the heapSort method to sort the array        
        heapSort(arr);
        
        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("\n\ntimeElapsed : " +  (timeElapsed * 1e-9));

        System.out.println("\nSorted array:");
        for (int num : arr) {
            System.out.print(num + " ");
        }
    }
}
