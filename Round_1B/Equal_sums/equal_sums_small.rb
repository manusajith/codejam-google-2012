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

def subset(n, s)
  h = {}
  1.upto(n) do |len|
    s.combination(len) do |a|
      sum = a.inject(0,:+)
      if h.key?(sum)
        u = h[sum].join(" ")
        v = a.join(" ")
        return "#{u}\n#{v}"
      else
        h[sum] = a
      end
    end
  end
  return "Impossible"
end

input = File.new("input_small.txt")
output = File.new("output_small.txt", 'w')
count = input.gets.to_i
1.upto(count) do |c|
  set = input.gets.split(' ').collect! { |x| x.to_i }
  n = set[0]
  s = set[1, n]
  ans = subset(n, s)
  output.puts("Case ##{c}:\n#{ans}")
end
