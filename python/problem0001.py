#!/usr/bin/env python

'''
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
'''

# Solution 1
print sum(i for i in xrange(1, 1000) if i % 3 == 0 or i % 5 == 0)

# Solution 2
def divisible_by(quot, div):
  return quot % div == 0

print (sum(i for i in xrange(1, 1000) if divisible_by(i, 3)) +
  sum(i for i in xrange(1, 1000) if divisible_by(i, 5)) -
  sum(i for i in xrange(1, 1000) if divisible_by(i, 15)))

# Solution 3
b = 999/5
c = 999/15
print 999*(999/3 + 1) / 2 + 5*(b * (b + 1) / 2) - 15*(c * (c + 1) / 2)
