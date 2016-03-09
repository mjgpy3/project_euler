#!/usr/bin/env python

'''
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
'''

# Solution 1
def nth_prime(n):
  known_primes = [2]
  current = 3
  while n > len(known_primes):
    for prime in known_primes:
      if current % prime == 0:
        break
    else:
      known_primes.append(current)
    current += 1

  return current-1

print nth_prime(10001)
