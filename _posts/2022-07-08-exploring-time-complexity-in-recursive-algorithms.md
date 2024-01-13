---
title: Exploring Time Complexity in Recursive Algorithms
date: 2022-07-08 22:19:45 -0700
category: Academic
---

Recursive algorithms are a fascinating aspect of computer science, often leading to elegant solutions to complex problems. To better understand their time complexity, let's delve into a simple example question.

## Question: Calculating the nth Power of x

## Solution 1: The Loop Method

A straightforward approach involves using a loop. Here's how it's implemented in Java:

```java
int function(int x, int n){
  if (n == 0){
    return 1;
  }
  int result = 1; // Initializing result
  for (int i = 0; i < n; i++){
    result = result * x;
  }
  return result;
}
```

In this instance, the time complexity is O(n), as the loop runs n times.

## Solution 2: Basic Recursion

Recursive algorithms can often optimize time complexity. Here's a recursive version:

```java
int function(int x, int n){
  if (n == 0){
    return 1;
  }
  return function(x, n - 1) * x;
}
```

For recursive algorithms, time complexity = number of recursions * operations per recursion. Here, the number of recursions = n, and operations per recursion = 1, maintaining the O(n) complexity.

## Solution 3: Optimized Recursion with Redundancy

An optimized recursive solution might look like this:

```java
int function(int x, int n){
  if (n == 0){
    return 1;
  }
  if (n % 2 == 1){
    return function(x, n / 2) * function(x, n / 2) * x;
  }
  return function(x, n / 2) * function(x, n / 2);
}
```

Here, the number of recursions = logn * logn, so the time complexity seems to be O(n). However, this approach has redundant calculations.

## Solution 4: Efficient Recursion

To enhance efficiency, we can store the result of recursive calls:

```java
int function(int x, int n){
  if (n == 0){
    return 1;
  }
  int temp = function(x, n / 2);
  if (n % 2 == 1){
    return temp * temp * x;
  }
  return temp * temp;
}
```

Now, the number of recursions = logn, and operations per recursion = 1. This brings the time complexity down to O(logn), demonstrating how slight variations in recursion can significantly affect complexity. It's a clear illustration that recursive algorithms' time complexity is not always O(logn), and even simple algorithmic tweaks can have a substantial impact.
