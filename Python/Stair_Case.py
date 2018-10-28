#Consider a staircase of size : 4
#Then print following pattern
   #
  ##
 ###
####

#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the staircase function below.
def staircase(n):
    space = ' '
    counter = n
    for i in range(n):
        space_count = counter - (i + 1)
        hash_count = i + 1
        print(space_count*space + hash_count*"#")

if __name__ == '__main__':
    n = int(input())

    staircase(n)
