input = File.read("n")
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
