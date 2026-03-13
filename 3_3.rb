loop do
    random_number = rand(1..100)
    attempts = 0
    loop do 
        puts "Угадай число от 1 до 100"
        guess = gets.chomp.to_i
        attempts += 1
        if guess < random_number
            puts "Больше"
            next
        elsif guess > random_number
            puts "Меньше"
            next
        else
            break
        end
    end
    puts case attempts 
    when 1..3 then "Верно! Попыток: #{attempts}. Экстрасенс!"
    when 4..7 then "Верно! Попыток: #{attempts}. Хорошо"
    when 8..9999 then "Верно! Попыток: #{attempts}. Нужна практика"
    end
    puts "Хочешь сыграть еще? (да/нет)"
    answer = gets.chomp
    if answer == "да" 
        puts "Ну погнали"
        next
    else puts "Ну ладно"
    break 
    end
end