
#  Copyright 2012 Manu S Ajith <neo@codingarena.in>
#  Ruby Kitchen Technosol Pvt Ltd ( http://rubykitchen.in)
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

def solve(distance, other_car, as)
  other_car_vs = [] 
  other_car.each_cons(2) do |from, to|
    other_car_vs << (to[1] - from[1]) / (to[0] - from[0])
  end
  return as.collect { |a| Math.sqrt(2*distance/a) } if (other_car_vs == [])
  return as.collect { |a| [Math.sqrt(2*distance/a), (distance - other_car[0][1]) /other_car_vs[0]].max }
end

lines = []
input = File.new("input_large.txt")
output = File.new("output_large.txt", 'w')
input.each_with_index do |line, idx|
  next if idx == 0
  lines << line
end
index = 0
count = 0
while index < lines.size
count += 1
data = lines[index].split(' ')
index = index + 1
distance = Float(data[0])
n = Integer(data[1])
acceleration = Integer(data[2])
other_car = []
n.times do |i|
  other_car << lines[index].split(' ').collect! { |i| i.to_f }
  index = index + 1      
end
as = lines[index].split(' ').collect! { |i| i.to_f }
index = index + 1
output.puts "Case ##{count}: "
solve(distance, other_car, as).each { |solution| output.puts solution }
end
