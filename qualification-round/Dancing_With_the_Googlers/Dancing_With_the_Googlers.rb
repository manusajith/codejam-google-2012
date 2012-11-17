input = open('input_small.txt')
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
