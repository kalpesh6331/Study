#Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers

#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the miniMaxSum function below.
def miniMaxSum(arr):
    small_arr = arr[:] #copying list to avoid mutation
    large_arr = arr[:] #copying list to avoid mutation

    largest_elem = max(small_arr)
    small_arr.remove(largest_elem)

    smallest_elem = min(large_arr)
    large_arr.remove(smallest_elem)

    print(sum(small_arr), end='')
    print(" ", end='')
    print(sum(large_arr))

if __name__ == '__main__':
    arr = list(map(int, input().rstrip().split()))

    miniMaxSum(arr)
