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
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  def add_edge(v1, v2)
    @nodes[v1] = @nodes.fetch(v1, []) + [v2]
  end
end

def prime_pair_set?(p1, p2, known_primes)
  known_primes.include?("#{p1}#{p2}".to_i) &&
    known_primes.include?("#{p2}#{p1}".to_i)
end

def too_high?(p1, p2, known_primes)
  known_primes[-1] < "#{p1}#{p2}".to_i ||
    known_primes[-1] < "#{p2}#{p1}".to_i
end

primes = primes_below(300000)
result_graph = Graph.new

primes.each_with_index do |prime, i|
  (i+1...primes.size).each do |j|
    result_graph.add_edge(prime, primes[j]) if prime_pair_set?(prime, primes[j], primes)
    break if too_high?(prime, primes[j], primes)
    puts "#{i} #{j}"
  end
end

p result_graph.nodes
