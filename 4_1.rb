def ask_measurements
    puts "Привет! Как тебя зовут?"
    name = gets.chomp
    puts "А какой у тебя рост? (в метрах, пиши в формате 1.67)"
    height = gets.chomp.to_f
    puts "И твой вес если не секрет..?"
    weight = gets.chomp.to_f
    [name, height, weight]
end

def calculate_bmi(height, weight)
   (weight/height**2).round(2)
end

def bmi_category(name, bmi)
  case bmi
  when 0...18.5 then "Иди кушац, #{name}, у тебя категория \"Недостаточный вес\""
  when 18.5...25 then "Все гуд, #{name}, у тебя категория \"Норма\""
  when 25...30 then "Тебе бы сбросить пару кг, #{name}, у тебя категория \"Избыточный вес\""
  else "Бегом на дорожку, #{name}, у тебя категория \"Ожирение\""
  end
end

def show_report(name, bmi)
    puts "Твой BMI = #{bmi}", bmi_category(name, bmi)
end

name, height, weight = ask_measurements
bmi = calculate_bmi(height, weight)
show_report(name, bmi)
