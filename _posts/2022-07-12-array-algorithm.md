---
layout: post
title: Array Algorithm
date: 2022-07-12 12:25:04 -0700
category: Algorithm
---

Arrays are very basic data structures. It has two characteristics:

- The subscript of the array starts from 0.
- Arrays are allocated continuously in memory.

## Question: Search

> Given an array of integers `nums` which is sorted in ascending order, and an integer `target`, write a function to search `target` in `nums`. If `target` exists, then return its index. Otherwise, return `-1`.
>
> **Constraints:**
>
> - `1 <= nums.length <= 104`
> - `-104 < nums[i], target < 104`
> - All the integers in `nums` are **unique**.
> - `nums` is sorted in ascending order.

key words: sorted, unique

### Solution: Binary Search

```java
public int search(int[] nums, int target) {
  int left = 0;
  int right = nums.length - 1;
  if (target > nums[right] || target < nums[left]){
    return -1;
  }
  while (left <= right){
    int middle = (left + right) / 2;
    if (nums[middle] < target){
      left = middle + 1;
    }else if(nums[middle] > target){
      right = middle - 1;
    }else{
      return middle;
    }
  }
  return -1;
}
```

Time complexity: O(logn)
Space complexity: O(1)

## Question: Remove Element

> Given an integer array `nums` and an integer `val`, remove all occurrences of `val` in `nums` [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm). The relative order of the elements may be changed.
>
> Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the **first part**of the array `nums`. More formally, if there are `k` elements after removing the duplicates, then the first `k` elements of `nums` should hold the final result. It does not matter what you leave beyond the first `k`elements.
>
> Return `k` _after placing the final result in the first_ `k` _slots of_ `nums`.
>
> Do **not** allocate extra space for another array. You must do this by **modifying the input array [in-place](https://en.wikipedia.org/wiki/In-place_algorithm)** with O(1) extra memory.
>
> **Constraints:**
>
> - `0 <= nums.length <= 100`
> - `0 <= nums[i] <= 50`
> - `0 <= val <= 100`

### Solution 1 Brute-force

```java
public int removeElement(int[] nums, int val) {
  int k = nums.length;
  for (int i = 0; i < k;){
    if (nums[i] == val){
      for (int j = i + 1; j < k; j++){
        nums[j - 1] = nums[j];
      }
      k--;
    }else{
      i++;
    }
  }
  return k;
}
```

Time complexity: O(n^2)
Space complexity: O(1)

### Solution 2 Hare & Tortoise Algorithm

```java
public int removeElement(int[] nums, int val) {
  int k = 0;
  for (int i = 0; i < nums.length; i++){
    if (nums[i] != val){
      nums[k] = nums[i];
      k++;
    }
  }
  return k;
}
```

Time complexity: O(n)
Space complexity: O(1)
