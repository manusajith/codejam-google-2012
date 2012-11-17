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
count = input.gets.to_i
1.upto count do |i|
    typed, total = input.gets.split.map {|x| x.to_i}
    a = input.gets.split.map {|x| x.to_f }
    tmp = 1.0
    rem = typed
    ans = 1 + (total + 1)
    a.each do |i|
        rem -= 1
        tmp *= i
        ans = [ans, rem * 2 + (total - typed) + 1 + (1 - tmp) * (total + 1)].min
    end
    puts "Case ##{i}: #{ans}"
end
