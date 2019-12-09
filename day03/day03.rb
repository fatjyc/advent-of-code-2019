#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

points1, points2 = File.read('input').split("\n").map{ |l| l.scan(/[RLUD]\d+/) }

class Table

  attr_accessor :cross

  def initialize points1, points2
    @cross = {}
    parse points1, :line1
    parse points2, :line2
  end

  def parse points, name
    point = [0, 0]
    steps_count = 0
    points.each do |i|
      steps = i[1..-1].to_i
      dir = case i[0]
            when 'R'
              [1, 0]
            when 'L'
              [-1, 0]
            when 'U'
              [0, 1]
            when 'D'
              [0, -1]
            end
      steps.times do
        steps_count += 1
        point = point.zip(dir).map(&:sum)
        last = @cross.fetch(point, {})
        last[name] = last.fetch(name, steps_count)
        @cross[point] = last
      end
    end
  end

end

def part1_func points
  sorted = points
    .select { |point, c| c.keys.count > 1 }
    .sort_by { |point, c| point.map(&:abs).sum }

  closest = sorted.first.first.map(&:abs).sum
  closest
end

def part2_func points
  sorted = points
    .select { |point, c| c.keys.count > 1 }
    .sort_by { |point, c| c.map(&:last).sum }

  sorted.first.last.map(&:last).sum
end

table = Table.new points1, points2

part1 = part1_func table.cross.to_a
part2 = part2_func table.cross.to_a

puts "part1:"
puts part1
puts "part2:"
puts part2
