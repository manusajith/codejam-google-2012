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


def stars(input)
  count = input.gets.to_i
  a = []
  count.times{|i|
    a << input.gets.split.map{ |x| x.to_i }.reverse
  }
  a.sort!.reverse!
  star = 0
  c = 0  
  while a[0] && c > -1
    c+=1    
    if i=a.index{|bi,ai| bi <= star  }  
      x = a.slice! i      
      star += x[1] == -1 ? 1 : 2      
    elsif x=a.find{|bi,ai| ai > -1 && ai <= star}
      x[1] = -1
      star += 1      
    else
      c = -1
    end
  end
  c > -1 ? c : "Too Bad"
end

input = File.new("input_small.txt")
count = input.gets.to_i
1.upto(count){|t|
  puts "Case ##{t}: #{stars(input)}"
}

