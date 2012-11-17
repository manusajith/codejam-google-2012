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

=begin
googlerese = "ejp mysljylc kd kxveddknmc re jsicpdrysi" \
            "rbcpc ypc rtcsra dkh wyfrepkym veddknkmkrkcd" \
            "de kr kd eoya kw aej tysr re ujdr lkgc jv"
english  = "our language is impossible to understand" \
            "there are twenty six factorial possibilities" \
            "so it is okay if you want to just give up"
lang       = { 'z' => 'q', 'q' => 'z' }
english.each_char.with_index { |e, g| lang[googlerese[g]] = e }
File.read("input.txt").each_line.with_index do |l, i|
  puts "Case ##{i}: #{(l.chomp.each_char.map {|x| lang[x] }).join}"
end

=end

#found a better solution after analyzing the given sample data
1.upto(gets.to_i){|i|puts"Case ##{i}: "+gets.tr("a-z","yhesocvxduiglbkrztnwjpfmaq")}
