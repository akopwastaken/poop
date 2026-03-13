score = 0
loop do 
puts "Напиши свой балл (0-100)"
score = gets.chomp.to_i
    if score > 100 || score < 0
        puts "Яж попросил от 0 до 100, напиши еще раз"
        next
    else 
        break
    end
end 
puts case score 
    when 90..100 then "Отлично!"
    when 75..89 then "Хорошо"
    when 60..75 then "Удовлетворительно"
    else "Неудовлетворительно"
end