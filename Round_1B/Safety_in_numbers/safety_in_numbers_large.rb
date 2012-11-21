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
input.gets.to_i.times do |i|
	datas = input.gets.split.map{|i| i.to_i}
	num = datas[0]
	judges = datas[1,num].map{|i| i.to_f}
	bigs = judges.sort.reverse
	total = judges.inject{|sum,i| sum+=i}
	total_d = total * 2.0
	cur = 0
	n = num
	ave = total_d/n
	total_tmp = total_d
	while(bigs[cur]>ave) do
		total_tmp -= bigs[cur]
		cur += 1
		ave = total_tmp/(num-cur)
	end
	dsts = []
	judges.each do |i|
    dst = 0
		if (i<ave) then
			dst = ((ave-i)/total)*100.0
		end
		dsts.push(sprintf("%.6f", dst))
	end
	print 'Case #' + (i+1).to_s + ':'
	dsts.each{|dst| print " "+dst}
	print "\n"
	end
