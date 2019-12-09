#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

INPUT = File.read('input').split(",").map(&:to_i)

def part1_func param
  arr = INPUT.clone

  index = 0

  out = []
  until arr[index] == 99 do
    opcode = '%05d' % arr[index]
    case arr[index] % 100
    when 1
      a = value(arr, arr[index + 2], opcode[1])
      arr[arr[index + 3]] = value(arr, arr[index + 1], opcode[2]) + value(arr, arr[index + 2], opcode[1])
      index += 4
    when 2
      arr[arr[index + 3]] = value(arr, arr[index + 1], opcode[2]) * value(arr, arr[index + 2], opcode[1])
      index += 4
    when 3
      arr[arr[index + 1]] = param
      index += 2
    when 4
      out.push value(arr, arr[index + 1], opcode[2])
      index += 2
    when 5
      if value(arr, arr[index + 1], opcode[2]) != 0
        index = value(arr, arr[index + 2], opcode[1])
      else
        index += 3
      end
    when 6
      if value(arr, arr[index + 1], opcode[2]) == 0
        index = value(arr, arr[index + 2], opcode[1])
      else
        index += 3
      end
    when 7
      arr[arr[index + 3]] = value(arr, arr[index + 1], opcode[2]) < value(arr, arr[index + 2], opcode[1]) ? 1 : 0
      index +=4
    when 8
      arr[arr[index + 3]] = value(arr, arr[index + 1], opcode[2]) == value(arr, arr[index + 2], opcode[1]) ? 1 : 0
      index +=4
    end
  end
  puts out.last
end

def value arr, val, mode
  if mode == '1'
    val
  else
    arr[val]
  end
end


puts "part1:"
part1_func 1
puts "part2:"
part1_func 5
