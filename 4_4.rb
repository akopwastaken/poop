puts "Напиши слово, я его переверну"
input = gets.chomp
length = input.length
(length / 2).times do |index|
    x = input[length - index - 1]
    input[length - index - 1] = input[index]
    input[index] = x 
end
puts input

puts "Напиши еще раз слово, я его опять переверну"
input = gets.chomp.split('')
length = input.length
input = input.map.with_index do |x, index|
    input[length - index - 1]
end
puts input.join
