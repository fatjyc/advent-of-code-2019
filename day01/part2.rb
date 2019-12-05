#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

arr = []
File.open("input", "r") do |f|
  f.each_line do |line|
    line = line.to_i
    arr.push(line)
  end
end


def fuel(mass)
  result = []
  begin
    mass = mass / 3 - 2
    result.push mass if mass > 0
  end while mass >= 2
  result.inject :+
end

arr = arr.map do |a|
  fuel(a)
end

puts arr.inject :+

