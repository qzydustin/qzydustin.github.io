---
title: Essential Algorithms for Array Manipulation
date: 2022-07-12 12:25:04 -0700
category: Academic
---

Arrays, as foundational data structures in programming, exhibit two key characteristics: zero-based indexing and contiguous memory allocation. This guide explores essential algorithms for manipulating arrays, demonstrating efficient solutions to common problems.

## Question: Array Search

Imagine an array `nums` of integers sorted in ascending order and a target integer. The task is to develop a function to search for `target` in `nums`. If `target` is found, return its index; otherwise, return `-1`.

**Constraints:**

- `1 <= nums.length <= 104`
- `-104 < nums[i], target < 104`
- All elements in `nums` are unique.
- `nums` is sorted in ascending order.

Keywords: sorted, unique

### Solution: Binary Search

```java
public int search(int[] nums, int target) {
  int left = 0, right = nums.length - 1;
  while (left <= right) {
    int middle = (left + right) / 2;
    if (nums[middle] < target) {
      left = middle + 1;
    } else if (nums[middle] > target) {
      right = middle - 1;
    } else {
      return middle;
    }
  }
  return -1;
}
```

Time complexity: O(logn)
Space complexity: O(1)

## Question: Remove Element

You're given an integer array `nums` and an integer `val`. The goal is to remove all instances of `val` from `nums` in-place, altering the array's length as needed.

**Constraints:**

- `0 <= nums.length <= 100`
- `0 <= nums[i] <= 50`
- `0 <= val <= 100`

### Solution 1: Brute-force

```java
public int removeElement(int[] nums, int val) {
  int k = nums.length;
  for (int i = 0; i < k; ) {
    if (nums[i] == val) {
      for (int j = i + 1; j < k; j++) {
        nums[j - 1] = nums[j];
      }
      k--;
    } else {
      i++;
    }
  }
  return k;
}
```

Time complexity: O(n^2)
Space complexity: O(1)

### Solution 2: Hare & Tortoise Algorithm

```java
public int removeElement(int[] nums, int val) {
  int k = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != val) {
      nums[k] = nums[i];
      k++;
    }
  }
  return k;
}
```

Time complexity: O(n)
Space complexity: O(1)

This guide provides a clear understanding of array operations, showcasing efficient algorithmic solutions for searching and modifying arrays.
