#!/usr/bin/env ruby

$prefix_to_value = [
  {
    op: ->(n){ n*(n+1)/2 },
    lower_bound: 45,
    upper_bound: 140
  }, {
    op: ->(n){ n*n },
    lower_bound: 32,
    upper_bound: 99
  }, {
    op: ->(n){ n*(3*n-1)/2 },
    lower_bound: 26,
    upper_bound: 81
  }, {
    op: ->(n){ n*(2*n-1) },
    lower_bound: 23,
    upper_bound: 70
  }, {
    op: ->(n){ n*(5*n-3)/2 },
    lower_bound: 21,
    upper_bound: 63
  }, {
    op: ->(n){ n*(3*n-2)},
    lower_bound: 17,
    upper_bound: 58
  }
].map do |func|
  result = {}
  (func[:lower_bound]..func[:upper_bound]).each do |n|
    value = func[:op].(n)
    prefix = value/100
    result[prefix] = result.fetch(prefix, []) + [value]
  end
  result
end

def permutation_map_eliminating(old_map, i)
  result = old_map[0..-1]
  result[i] = false
  result
end

def aux(permutation, current, sum, first, last)
  p sum and exit if !permutation.any? && first/100 == last%100
  suffix = current%100
  return if suffix < 10

  permutation.each do |i|
    next unless i
    ($prefix_to_value[i][suffix] || []).each do |value|
      aux(permutation_map_eliminating(permutation, i), value, sum + value, first, value)
    end
  end
end

permutations_map = [0, 1, 2, 3, 4, 5]
$prefix_to_value.each_with_index do |prefixes_to_values, i|
  prefixes_to_values.each do |_, values|
    values.each do |value|
      aux(permutation_map_eliminating(permutations_map, i), value, value, value, nil)
    end
  end
end
