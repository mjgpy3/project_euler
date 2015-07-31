#!/usr/bin/env python

def lazyzip_over(i, j):
  for x in xrange(1, i+1):
    for y in xrange(1, j+1):
      yield (x, y)

def count_rects_in_big_rect(small_rect, big_rect):
  fit = lambda v: big_rect[v] - small_rect[v] + 1

  return fit('n')*fit('m')

def count_rects_fitting(rect):
  return sum(count_rects_in_big_rect({ 'm': m, 'n': n}, rect) for n, m in lazyzip_over(rect['n'], rect['m']))

best_delta = 2000000

for i in xrange(1, 1000000):
  for j in xrange(1, i):
    result = count_rects_fitting({ 'm': i, 'n': j })
    if result <= 2000016:
      best_delta = min(best_delta, abs(2000000 - result))
      if best_delta == 2000000 - result:
        print 'New best:', result
    if result > 2000016:
      break

