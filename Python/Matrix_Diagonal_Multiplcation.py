#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the diagonalDifference function below.
def diagonalDifference(arr):
    leng=len(arr)
    
    #Sum of L to R digonal
    sum1 = 0
    for i in range(leng):
        sum1 = sum1 + arr[i][i]
    
    #Sum of R to L digonal
    sum2 = 0
    row_it = 0
    col_it = leng - 1
    for j in range(leng):
        sum2 = sum2 + arr[row_it][col_it]
        row_it = row_it + 1
        col_it = col_it - 1
    
    return abs(sum1 - sum2)

if __name__ == '__main__':
    n = int(input())
    arr = []
    for _ in range(n):
        arr.append(list(map(int, input().rstrip().split())))

    result = diagonalDifference(arr)
    
    print("Result is")
    print(result)
