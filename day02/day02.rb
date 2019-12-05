#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

def part1_func(inputs, one, two)
  arr = Array.new(inputs)
  arr[1] = one
  arr[2] = two

  index = 0
  until arr[index] == 99 do
    if arr[index] == 1
      arr[arr[index+3]] = arr[arr[index+1]] + arr[arr[index+2]]
    elsif arr[index] == 2
      arr[arr[index+3]] = arr[arr[index+1]] * arr[arr[index+2]]
    elsif arr[index] == 99
      break
    else
      puts "Error OptCode #{arr[index]}"
    end
    index += 4
  end
  arr[0]
end

def part2_func(arr, result)
  i = 0
  j = 0
  noun = 0
  verb = 0
  for i in 0..99 do
    for j in 0..99 do
      if part1_func(arr, i, j) == result
        noun = i
        verb = j
        break
      end
    end
  end
  100 * noun + verb
end


inputs = []
File.open("input", "r") do |f|
  f.each_line do |line|
    inputs = line.split(",").map { |l| l.to_i }
  end
end
part1 = part1_func inputs, 12, 2
part2 = part2_func inputs, 19690720


puts "part1:"
puts part1
puts "part2:"
puts part2
