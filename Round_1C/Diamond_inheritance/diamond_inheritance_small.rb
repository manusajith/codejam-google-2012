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

def diamond j, n, parent, flag
    return true if flag[j]
    flag[j] = true
    parent[j].each do |e|
        return true if diamond(e, n, parent, flag)
    end
    return false
end

input = File.new("input_small.txt")
output = File.new("output_small.txt", 'w')
count = input.gets.to_i
for i in 1..count do
  n = input.gets.to_i
  parent = []
  parent << []
  flag = [false]
  for j in 1..n do
    v = input.gets.chomp.split
    v.shift
    parent << v.map{|e| e.to_i}
    flag << false
  end
  diamond = false
  for j in 1..n do
    if diamond(j, n, parent, flag.dup)
      diamond = true
      break
    end
  end
  output.puts  diamond ? "Case ##{i}:Yes":"Case ##{i}:No"
end
