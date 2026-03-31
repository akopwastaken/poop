data =[
    {name: "Lionel", grades: [97, 92, 95, 93], group: "A"},
    {name: "Cristiano", grades: [54, 91, 75, 89], group: "B"},
    {name: "Erling", grades: [85, 86, 95, 85], group: "A"},
    {name: "Kylian", grades: [86, 67, 65, 76], group: "B"},
    {name: "Lamine", grades: [96, 96, 94, 97], group: "B"},
    {name: "Virgil", grades: [88, 87, 96, 73], group: "A"},
    {name: "Pedri", grades: [95, 86, 98, 89], group: "B"},
    {name: "Sergio", grades: [85, 76, 97, 84], group: "A"},
    {name: "Jude", grades: [30, 67, 89, 75], group: "B"},
    {name: "Fede", grades: [77, 66, 99, 88], group: "B"},
]

data.each do |x|
    x[:average] = x[:grades].reduce(0) {|sum, n| sum + n} / x[:grades].length
end 

puts "Для наглядности 
#{data.join("\n")}
\n"

puts "Средний балл каждого студента:"
data.each do |x|
    puts "#{x[:name]} - #{x[:average]}"
end

puts ""

data_grouped_by_grade = data.group_by {|x| 
case x[:average]
when 90..100 then "Отличник"
when 80..89 then "Хорошист"
else "Лох"
end}

puts "Отличники: #{data_grouped_by_grade["Отличник"].map do |x|
    x[:name]
end.join(", ")}!
\n"

puts "Хорошисты: #{data_grouped_by_grade["Хорошист"].map do |x|
    x[:name]
end.join(", ")}!
\n"

puts "Лохи: #{data_grouped_by_grade["Лох"].map do |x|
    x[:name]
end.join(", ")}!
\n"

data_grouped_by_group = data.group_by {|x| x[:group]}

puts "Средний балл в группе А - #{data_grouped_by_group["A"].reduce(0) {|sum, x| sum + x[:average]} / data_grouped_by_group["A"].length}
\n"

puts "Средний балл в группе B - #{data_grouped_by_group["B"].reduce(0) {|sum, x| sum + x[:average]} / data_grouped_by_group["B"].length}
\n"

list_of_minmax = data.map do |x|
    x[:grades].minmax[1] - x[:grades].minmax[0]
end

puts "Студент с наименьшим разбросом оценок - #{data[list_of_minmax.index(list_of_minmax.min)][:name]}
\n"

puts "Количество студентов с хотя бы одной оценкой меньше 70 баллов - #{data.reduce(0) {|sum, x| 
if x[:grades].any? {|n| n < 70} == true 
    sum + 1
else
    sum
end}}
\n"

data_v2 = {}

data_v2 = data.sort_by {|x| x[:average]}.reverse.to_h do |x|
    [x[:name], x[:average]]
end

puts "Хэш { ИмяСтудента => СреднийБалл }, отсортированный по убыванию:"
puts data_v2
