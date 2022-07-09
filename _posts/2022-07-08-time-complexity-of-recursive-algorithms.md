---
layout: post
title:  Time complexity of recursive algorithms
date:   2022-07-08 22:19:45 -0700
categories: algorithm
---

Let us to use an easy example question to explain the time complexity of rescusive algorithms.

- Question: Calculate the nth power of x.

- Solution 1:

  The most straightforward way to solve this is use a loop.

  ```java
  int function(int x, int n){
    if (n == 0){
      return 1;
    }
    for (int i = 0; i < n; i++){
      result = result * x;
    }
    return result;
  }
  ```

  At this time, the time complexity is O(n).

- Solution 2:

  Usually, time complexity can be optimized using recursive algorithms.

  ```java
  int function(int x, int n){
    if (n == 0){
      return 1;
    }
    return function(x, n - 1) * n;
  }
  ```

  The time complexity of the recursive algorithm =  the number of recursions * the number of operations per recursion

  In this case, the number of recusions = n; The number of operations per recursion = 1.

  So the time complexity is still O(n).

- Solution 3:

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

  In this case, the number of recusions = logn * logn; The number of operations per recursion = 1.

  So the time complexity is still O(n).

  However, we have the double counting part.

- Solution 4：

  ```java
  int function(int x, int n){
    if (n == 0){
      return 1;
    }
    // this is the difference!
    int temp = function(x, n / 2);
    if (n % 2 == 1){
      return temp * temp * x;
    }
    return temp * temp;
  }
  ```

  In this case, the number of recusions = logn; The number of operations per recursion = 1.

  Therefore, the time complexity is O(logn).

In conclusion, this is an entry level algorithm question, but a little difference in the recursive part of the algorithm will impact the time complexity a lot. In addition, the time complexity of the recursive algorithm is not always O(logn).

