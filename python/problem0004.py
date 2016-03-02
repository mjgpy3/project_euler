#!/usr/bin/env python

'''
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 x 99.

Find the largest palindrome made from the product of two 3-digit numbers.
'''

# Solution 1
result = 0
for i in xrange(999, 99, -1):
  for j in xrange(i, 99, -1):
    r = i * j
    if str(r) == str(r)[::-1]:
      result = max(r, result)

print result
