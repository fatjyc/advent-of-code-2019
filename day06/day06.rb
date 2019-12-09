#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-



INPUT = File.read('input').each_line.map{ |line| line.gsub("\n", "").split(')').reverse }.to_h

def part1_func object
  orbits = []
  while INPUT[object] do
    object = INPUT[object]
    orbits.push object
  end
  orbits
end

def part2_func src, desc
  src_orbits = part1_func(src).reverse
  desc_orbits = part1_func(desc).reverse
  for i in 0..([src_orbits.length, desc_orbits.length].max - 1) do
    if src_orbits[i] != desc_orbits[i]
      return src_orbits[i..src_orbits.length - 1].size + desc_orbits[i..desc_orbits.length - 1].size
    end
  end
  src_orbits.size + desc_orbits.size
end

puts "part1:"
puts INPUT.map{ | object, _ | part1_func(object).size }.sum
puts "part2:"
puts part2_func 'YOU', 'SAN'
