#!/usr/bin/env python

def count_rects_in_big_rect(small_rect, big_rect):
  return ((big_rect['n'] - small_rect['n'] + 1)
    * ((big_rect['m'] - small_rect['m'] + 1)))

def count_rects_fitting(rect):
  result = 0

  for n in xrange(1, 1+rect['n']):
    for m in xrange(1, 1+rect['m']):
      result += count_rects_in_big_rect({ 'm': m, 'n': n }, rect)

  return result

results = []

for i in xrange(1, 1000000):
  for j in xrange(1, i):
    result = count_rects_fitting({ 'm': i, 'n': j })
    if result >= 1999305 and result <= 2000016:
      print i, j
      print result
      results.append(result)
    if result > 2000016:
      break
