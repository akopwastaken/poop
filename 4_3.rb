def reverse(input)
    input.reverse
end

def count(input)
    input.length 
end

def upcase(input)
    input.upcase
end

def vowelsdelete(input)
  input.delete('aeiouAEIOU')
end

puts "Привет! Напиши любое слово:"

input = gets.chomp

loop do 

    puts "Что хочешь сделать с этим словом? (Напиши цифру 1-5)
    1) Перевернуть
    2) Посчитать символы
    3) Переписать капслоком
    4) Убрать гласные
    5) Ничего"

    answer = gets.chomp.to_i

    case answer
    when 1 then puts "#{reverse(input)}"
        next
    when 2 then puts "#{count(input)}"
        next
    when 3 then puts "#{upcase(input)}"
        next
    when 4 then puts "#{vowelsdelete(input)}"
        next
    when 5 then puts "Ладно, пока!" 
        return
    else puts "Я тебя не понял, напиши ответ одной цифрой" 
        next
    end
    
end
