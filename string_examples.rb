require 'pp'

a = "This is the first string"
p a

b = " I will repeat again."
p b * 3


p "Concat is simple " + "in ruby"

p "vijay sali".capitalize
p "vijay sali".upcase
p "VijaySali".swapcase

p "Length for #{a} is : " +  a.length.to_s


#p "Hello Iterators".each_char {|str| p str }


p "Reverse string".reverse

p "I will not replace the string".gsub("not", "")



p "Conversion examples:"
p "1".to_i.class
p "1.33".to_f.class
p 1.to_s


p "001".to_i(2)

p "100".to_i(8)
