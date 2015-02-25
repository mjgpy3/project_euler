#!/usr/bin/env ruby

# Expected algorithm:
# - Build table of primes within reasonable range (let's try < 65500)
# - Construct a graph where (x, y) means that `x` and `y` are a "pair prime set"
# -- potential optimization: only look above a given value (lowers will include highers in their paths)
# - Traverse the graph for each p, finding lengths of 5, saving minimum (short circuit first)
# Expected complexity: O(n^2)

def primes_below(n)
  to_consider = (0...n).to_a
  primes = []
  i = 2

  while i < to_consider.size
    factor = 2
    primes << i
    while i*factor < n
      to_consider[i*factor] = false
      factor += 1
    end

    i += 1
    i += 1 while i < to_consider.size && !to_consider[i]
  end

  primes
end

class Graph
  def initialize
    @nodes = {}
  end

  def reduce
    @nodes.keys.map do |value|
      find_chains(value)
    end.inject(:+)
  end

  def find_chains(value, chain = [value], results = [])
    unless @nodes[value]
      results << chain
      return
    end

    should_add_chain = false
    @nodes[value].each do |next_value|
      if chain.all? { |link| @nodes[next_value] && @nodes[next_value].include?(link) }
        find_chains(next_value, chain + [next_value], results)
      else
        should_add_chain = true
      end
    end

    results << chain if should_add_chain

    results
  end

  def add_edge(v1, v2)
    @nodes[v1] = @nodes.fetch(v1, []) + [v2]
  end
end

def prime?(num)
  return num == 2 if num < 3

  i, sqrt = 3, Math.sqrt(num)

  while i < sqrt
    return false if num % i == 0
    i += 2
  end

  true
end

def prime_pair_set?(p1, p2, known_primes)
  prime?("#{p1}#{p2}".to_i) &&
    prime?("#{p2}#{p1}".to_i)
end

primes = primes_below(10000)
result_graph = Graph.new

primes.each_with_index do |prime, i|
  (i+1...primes.size).each do |j|
    if prime_pair_set?(prime, primes[j], primes)
      result_graph.add_edge(prime, primes[j])
      result_graph.add_edge(primes[j], prime)
    end
    puts "#{i} #{j}"
  end
end

results = result_graph.reduce

results.select { |r| r.count > 4}.each do |r|
  puts "#{r.inject(:+)} -- #{r}"
end
