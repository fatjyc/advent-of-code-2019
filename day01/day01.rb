#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

def part1_func(num)
  num / 3 - 2
end


def part2_func(num)
  result = []
  begin
    num = part1_func(num)
    result.push num if num > 0
  end while num >= 2
  result.inject :+
end

part1 = []
part2 = []
File.open("input", "r") do |f|
  f.each_line do |line|
    line = line.to_i
    part1.push(part1_func(line))
    part2.push(line)
  end
end


part2 = part2.map do |a|
  part2_func(a)
end

puts "part1:"
puts part1.inject :+
puts "part2:"
puts part2.inject :+

