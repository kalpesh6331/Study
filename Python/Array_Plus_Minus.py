#Given an array of integers, calculate the fractions of its elements that are positive, negative, and are zeros. Print the decimal value of each fraction on a new line

#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the plusMinus function below.
def plusMinus(arr):
    count = len(arr)
    pos_count = 0
    neg_count = 0
    zero_count = 0
    
    
    for i in range(count):
        if arr[i] > 0:
            pos_count = pos_count + 1
        elif arr[i] == 0:
            zero_count = zero_count + 1
        else:
            neg_count = neg_count + 1
    
    print(pos_count / count)
    print(neg_count / count)
    print(zero_count / count)

if __name__ == '__main__':
    n = int(input())

    arr = list(map(int, input().rstrip().split()))

    plusMinus(arr)
