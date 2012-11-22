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

input = File.new("input_large.txt")
output = File.new("output_large.txt", 'w')
count = input.gets.chomp.to_i
data = []
count.times do
  n, m = input.gets.chomp.split.map &:to_i
  u = input.gets.chomp.split.map &:to_i
  v = input.gets.chomp.split.map &:to_i
  data << [n, m, u, v]
end

def compute n, m, u, v
  return 0 if n == 0 || m == 0
  a, b = u.shift 2
  c, d = v.shift 2
  if b == d
    if a == c
      return a + compute(n-1, m-1, u, v)
    elsif a > c
      return c + compute(n, m-1, u.unshift(a-c, b), v)
    else
      return a + compute(n-1, m, u, v.unshift(c-a, d))
    end
  else
    r = []
    r << compute(n, m-1, u.dup.unshift(a, b), v.dup)
    r << compute(n-1, m, u.dup, v.dup.unshift(c, d))
    return r.max
  end
end
data.each.with_index do |t, i|
  s = "Case #%d: %d"%[i+1, compute(*t)]
  output.puts s
end
