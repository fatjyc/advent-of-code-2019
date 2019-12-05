#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

arr = []
File.open("input", "r") do |f|
  f.each_line do |line|
    line = line.to_i
    line = line / 3 - 2
    arr.push(line)
  end
end

puts arr.inject :+

