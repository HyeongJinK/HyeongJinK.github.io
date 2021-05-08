package org.example.th5.p99;

import java.util.Comparator;

public class BubbleSort {
    public static void bubbleSort(int[] arr) {
        if (arr == null) {
            throw new IllegalArgumentException("Array cannot be null");
        }

        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
    // 최적화 버전
    public static void bubbleSortOptimized(int[] arr) {
        if (arr == null) {
            throw new IllegalArgumentException("Array cannot be null");
        }

        if (arr.length == 0) {
            throw new IllegalArgumentException("Array length cannot be 0");
        }

        int n = arr.length;
        while (n != 0) {
            int swap = 0;
            for (int i = 1; i < n; i++) {
                if (arr[i - 1] > arr[i]) {
                    int temp = arr[i];
                    arr[i] = arr[i - 1];
                    arr[i - 1] = temp;

                    swap = i;   // 이동할 경우 swap 을 수정
                }
            }
            n = swap;
        }
    }
    // 모든 요소를 정렬할 수 있는 방식으로 수정
    public static <T> void bubbleSortWithComparator(T arr[], Comparator<? super T> c) {
        if (arr == null || c == null) {
            throw new IllegalArgumentException("Array/Comparator cannot be null");
        }

        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (c.compare(arr[j], arr[j + 1]) > 0) {
                    T temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
    //최적화
    public static <T> void bubbleSortOptimizedWithComparator(T[] arr, Comparator<? super T> c) {
        if (arr == null || c == null) {
            throw new IllegalArgumentException("Array/Comparator cannot be null");
        }

        if (arr.length == 0) {
            throw new IllegalArgumentException("Array length cannot be 0");
        }

        int n = arr.length;
        while (n != 0) {
            int swap = 0;
            for (int i = 1; i < n; i++) {
                if (c.compare(arr[i - 1], arr[i]) > 0) {
                    T temp = arr[i];
                    arr[i] = arr[i - 1];
                    arr[i - 1] = temp;

                    swap = i;
                }
            }
            n = swap;
        }
    }
}
