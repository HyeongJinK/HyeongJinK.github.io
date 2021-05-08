package org.example.th5.p99;

import java.time.Clock;
import java.util.Comparator;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

// 배열정렬
public class P99_SortArray {
    private static final int ARRAY_SIZE = 10_000;
    private static final String[] MELON_TYPES
            = {"Watermelon", "Cantaloupe", "Horned", "Crenshaw", "Honeydew",
            "Gac", "Bitter", "Winter", "Sprite", "Korean", "Canary", "Charentais",
            "Bailan", "Hami", "Santa Claus", "Sky Rocket", "Golden Langkawi", "Apollo",
            "Honey Globe", "Autumn Sweet", "Jade Dew", "Golden Prize", "Ten Me", "New Century"};
    private static Clock clock = Clock.systemUTC();
    private static Random rnd = new Random();
    private static Comparator<Melon> byType = Comparator.comparing(Melon::getType);
    private static int[] integers = arrayInit(rnd);
    private static Melon[] melons = MelonInit(rnd);

    public static void bubble() {
        System.out.println("\n\nSort via Bubble sort:");
        System.out.println("----------------------");

        SortingDraw(integers
                , (value) -> {BubbleSort.bubbleSort((int[]) value);});

        SortingDraw(melons
                , (value) -> { BubbleSort.bubbleSortWithComparator(value, byType); });


        System.out.println("\n\nSort via Bubble sort optimized:");
        System.out.println("----------------------");

        SortingDraw(integers
                , (value) -> {BubbleSort.bubbleSortOptimized((int[]) value);});

        SortingDraw(melons
                , (value) -> { BubbleSort.bubbleSortOptimizedWithComparator(value, byType); });
    }

    public static void insert() {
        System.out.println("\n\nSort via Insertion sort:");
        System.out.println("----------------------");

        System.out.println("\nSorting numbers ...");
        SortingDraw(integers
            , (value) -> {InsertionSort.insertionSort((int[]) value);});

        System.out.println("\nSorting melons by type ...");
        SortingDraw(melons
                , (value) -> {InsertionSort.insertionSortWithComparator(value, byType);});
    }

    private static void SortingDraw(Melon[] melons, Consumer<Melon[]> consumer) {
        System.out.println("\nSorting melons by type ...");
        Melon[] cloneMelonBs = melons.clone();
        long startTime = clock.millis();
        consumer.accept(cloneMelonBs);
        displayExecutionTime(clock.millis() - startTime);
        displayMelonsSortedArray(cloneMelonBs);
    }

    private static void SortingDraw(int[] integers, Consumer consumer) {
        System.out.println("\nSorting numbers ...");
        int[] cloneIntegersBs = integers.clone();
        long startTime = clock.millis();
        consumer.accept(cloneIntegersBs);
        displayExecutionTime(clock.millis() - startTime);
        displayIntSortedArray(cloneIntegersBs);
    }

    private static Melon[] MelonInit(Random rnd) {
        Melon[] melons = new Melon[ARRAY_SIZE];
        for (int i = 0; i < ARRAY_SIZE; i++) {
            melons[i] = new Melon(MELON_TYPES[rnd.nextInt(5)], 2000 + rnd.nextInt(2000000));
        }
        return melons;
    }

    private static int[] arrayInit(Random rnd) {
        int[] integers = new int[ARRAY_SIZE];
        for (int i = 0; i < ARRAY_SIZE; i++) {
            integers[i] = rnd.nextInt(ARRAY_SIZE);
        }
        return integers;
    }

    private static void displayExecutionTime(long time) {
        System.out.println("Execution time: " + time + " ms" + " ("
                + TimeUnit.SECONDS.convert(time, TimeUnit.MILLISECONDS) + " s)");
    }

    // dummy display method
    private static void displayIntSortedArray(int[] arr) {
        for (int i = 0; i < 30; i++) {
            System.out.print(arr[i] + " ");
        }

        System.out.print(" ...\n");
    }

    // dummy display method
    private static void displayMelonsSortedArray(Melon[] arr) {
        for (int i = 0; i < 30; i++) {
            System.out.print(arr[i] + " ");
            if (i % 5 == 0) {
                System.out.println();
            }
        }

        System.out.print(" ...\n");
    }
}


