#!/usr/bin/env python

'''
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143?
'''

# Solution 1
n = 600851475143
i = 2
result = None

while n != 1:
  while n % i == 0:
    n = n / i
    result = i

  i += 1

print result

# Solution 2
n = 600851475143

def largest_prime_factor(n):
  i = 2

  while n != 1:
    if n % i == 0:
      n /= i
    else:
      i += 1

  return i

print largest_prime_factor(600851475143)
