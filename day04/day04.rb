#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

input = "254032-789860"


numbers = input.split("-")

def part1_func password
  password.to_s.each_char.each_cons(2).all?{ |a, b| a <= b } and password.to_s =~ /(\d)\1/
end

def part2_func password
  password.to_s.gsub(/(\d)\1\1+/, '') !~ /(\d)\1/
end

part1 = (numbers[0].to_i..numbers[1].to_i)
  .select { |pass| part1_func pass }
part2 = part1.select { |pass| part2_func pass }

puts "part1:"
puts part1.size
puts "part2:"
puts part2

