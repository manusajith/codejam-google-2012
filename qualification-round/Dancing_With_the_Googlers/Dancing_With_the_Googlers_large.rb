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

input = open('input_large.txt')
count = input.gets.to_i
(1..count).each do |case_id|
  number, surprises, points, *a = input.gets.split.map {|i| i.to_i}
  normal = points + [points - 1, 0].max * 2
  unusual = points + [points - 2, 0].max * 2
  surp = 0
  total = a.count do |x|
    if normal <= x
      true
    else
      surp += 1 if unusual <= x
      false
    end
  end
  puts "Case ##{case_id}: #{total+[surp,surprises].min}"
end
