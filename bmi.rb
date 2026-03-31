puts "Привет! Как тебя зовут?"
name = gets.chomp
puts "А какой у тебя рост? (в метрах, пиши в формате 1.67)"
height = gets.chomp.to_f
puts "И твой вес если не секрет..?"
weight = gets.chomp.to_f
bmi = weight/height**2.to_f
puts "Твой BMI = #{bmi}"
if bmi < 18.5
	puts "Иди кушац, #{name}, у тебя категория \"Недостаточный вес\""
elsif bmi >=18.5 && bmi < 25
	puts "Все гуд, #{name}, у тебя категория \"Норма\""
elsif bmi >=25 && bmi < 30
	puts "Тебе бы сбросить пару кг, #{name}, у тебя категория \"Избыточный вес\""
else
	puts "Бегом на дорожку, #{name}, у тебя категория \"Ожирение\""
end
