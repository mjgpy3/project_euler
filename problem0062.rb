#!/usr/bin/env ruby

i = 345

hist = {}

loop do
  cube = i*i*i

  key = cube.to_s.chars.sort.join
  hist[key] = hist.fetch(key, []) + [cube]

  if hist[key].count == 5
    puts hist[key]
    exit
  end
  i += 1
end
