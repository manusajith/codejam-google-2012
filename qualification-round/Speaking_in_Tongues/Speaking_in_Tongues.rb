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
