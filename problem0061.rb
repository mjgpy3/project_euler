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
    value_to_prefix: {},
    suffix_to_values: {},
  }
  (func[:lower_bound]..func[:upper_bound]).each do |n|
    value = func[:op].(n)
    prefix = value/100
    suffix = value%100
    result[:value_to_prefix][value] = result[:value_to_prefix].fetch(value, []) + [prefix]
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

$funcs.each_with_index do |func, i|
  $funcs[i][:radi] = get_radi_for(func)
end

def route_to_end(i = 0, chain = [])
  $funcs[i][:radi][:suffix_to_values].each do |suffix, values|
    values.each do |value|
      p "#{suffix} #{value}"
    end
  end
end

route_to_end

p $funcs.first
