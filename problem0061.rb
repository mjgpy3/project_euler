#!/usr/bin/env ruby

p_3 = {
  op: ->(n){ n*(n+1)/2 },
  lower_bound: 45,
  upper_bound: 140
}

p_4 = {
  op: ->(n){ n*n },
  lower_bound: 32,
  upper_bound: 99
}

p_5 = {
  op: ->(n){ n*(3*n-1)/2 },
  lower_bound: 26,
  upper_bound: 81
}

p_6 = {
  op: ->(n){ n*(2*n-1) },
  lower_bound: 23,
  upper_bound: 70
}

p_7 = {
  op: ->(n){ n*(5*n-3)/2 },
  lower_bound: 21,
  upper_bound: 63
}

p_8 = {
  op: ->(n){ n*(3*n-2)},
  lower_bound: 17,
  upper_bound: 58
}

def get_radi_for(func)
  result = {
    prefix_to_values: {},
    suffix_to_values: {},
  }
  (func[:lower_bound]..func[:upper_bound]).each do |n|
    value = func[:op].(n)
    prefix = value/100
    suffix = value%100
    result[:prefix_to_values][prefix] = result[:prefix_to_values].fetch(prefix, []) + [value]
    result[:suffix_to_values][suffix] = result[:suffix_to_values].fetch(suffix, []) + [value] if suffix >= 10
  end
  result
end

$funcs = [
  p_3,
  p_4,
  p_5,
  p_6,
  p_7,
  p_8,
]

$radi = []

$funcs.each_with_index do |func, i|
  $radi[i] = get_radi_for(func)
end

def permutation_map_eliminating(old_map, i)
  result = old_map[0..-1]
  result[i] = false
  result
end

def aux(permutation, current, chain)
  p chain.inject(:+) if !permutation.any? && chain[0]/100 == chain[-1]%100
  suffix = current%100

  permutation.select { |v| v }.each do |i|
    values = Array($radi[i][:prefix_to_values][suffix])
    values.each do |value|
      aux(permutation_map_eliminating(permutation, i), value, chain + [value])
    end
  end
end

def route_to_end
  permutations_map = (0...6).to_a
  $radi.each_with_index do |radi, i|
    radi[:prefix_to_values].each do |perefix, values|
      values.each do |value|
        aux(permutation_map_eliminating(permutations_map, i), value, [value])
      end
    end
  end
end

route_to_end
