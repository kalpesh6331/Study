#Sam is a professor at the university and likes to round each student's  according to these rules:
#If the difference between the  and the next multiple of  is less than , round  up to the next multiple of .
#If the value of  is less than , no rounding occurs as the result will still be a failing grade.

#!/bin/python3

import os
import sys

#
# Complete the gradingStudents function below.
#
def gradingStudents(grades):
    
    revised_grades = []
    for i in grades:
        if i >= 38:
            if i % 5 is 0:
                revised_grades.append(i)
            elif (i+1) % 5 is 0:
                revised_grades.append(i+1)
            elif (i+2) % 5 is 0:
                revised_grades.append(i+2)
            else:
                revised_grades.append(i)
        else:
            revised_grades.append(i)
            
    return revised_grades

if __name__ == '__main__':
    f = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input())

    grades = []

    for _ in range(n):
        grades_item = int(input())
        grades.append(grades_item)

    result = gradingStudents(grades)

    f.write('\n'.join(map(str, result)))
    f.write('\n')

    f.close()
