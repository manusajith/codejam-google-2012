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

input = File.read("input_small.txt")
input.each_line.with_index do |line, i|
  next if i.zero?
  a, b = line.split(' ').map {|x| x.to_i}
  count = 0
  (a...b).each do |n|
    output = []
    y = n.to_s.length - 1
    y.times do |z|
      x = 10 ** (z + 1)
      m = n / x + n % x * 10 ** (y - z)
      puts "value of m is #{m}"
      output << m if m > n && m <= b
    end
    count += output.uniq.length
  end
  puts "Case ##{i}: #{count}"
end
