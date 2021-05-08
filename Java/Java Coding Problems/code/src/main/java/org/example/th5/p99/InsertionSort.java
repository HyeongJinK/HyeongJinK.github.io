package org.example.th5.p99;

import java.util.Comparator;

// 삽입정렬
public class InsertionSort {
    private static void NullCheck(boolean b, String s, boolean b2) {
        if (b) {
            throw new IllegalArgumentException(s);
        }

        if (b2) {
            throw new IllegalArgumentException("Array length cannot be 0");
        }
    }
    public static void insertionSort(int arr[]) {
        NullCheck(arr == null, "Array cannot be null", arr.length == 0);

        int n = arr.length;
        for (int i = 1; i < n; ++i) {
            int key = arr[i];
            int j = i - 1;

            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j = j - 1;
            }

            arr[j + 1] = key;
        }
    }
    // 최적화
    public static <T> void insertionSortWithComparator(T arr[], Comparator<? super T> c) {
        NullCheck(arr == null || c == null, "Array/Comparator cannot be null", arr.length == 0);

        int n = arr.length;
        for (int i = 1; i < n; ++i) {
            T key = arr[i];
            int j = i - 1;

            while (j >= 0 && c.compare(arr[j], key) > 0) {
                arr[j + 1] = arr[j];
                j = j - 1;
            }

            arr[j + 1] = key;
        }
    }
}
