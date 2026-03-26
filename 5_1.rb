data =[
    {name: "Water", category: "Drink", price: 1.0, quantity: 23},
    {name: "Sandwitch", category: "Food", price: 3.0, quantity: 67},
    {name: "Snickers Bar", category: "Food", price: 2, quantity: 21},
    {name: "Fanta", category: "Drink", price: 2.5, quantity: 69},
    {name: "Beer", category: "Drink", price: 3.0, quantity: 42},
]

data_revenue = data.reduce(0) {|r, x| r + x[:price] * x[:quantity]}
puts "Общая выручка - #{data_revenue}!"

data_grouped = data.group_by {|x| x[:category]}
drink_revenue = data_grouped["Drink"].reduce(0) {|r, x| r + x[:price] * x[:quantity]}
food_revenue = data_grouped["Food"].reduce(0) {|r, x| r + x[:price] * x[:quantity]}
puts "Выручка по напиткам - #{drink_revenue}!
Выручка по еде - #{food_revenue}!"

revenue_rank = data.sort_by {|x| x[:price] * x[:quantity]}
puts "Топ 3 по выручке - №1 #{revenue_rank[-1][:name]}, №2 #{revenue_rank[-2][:name]}, №3 #{revenue_rank[-3][:name]}!"

#сначала сделал так, потом понял, что надо через first(3), жалко убирать старания

puts "И снова топ 3 по выручке - №1 #{revenue_rank.last(3)[2][:name]}, №2 #{revenue_rank.last(3)[1][:name]}, №3 #{revenue_rank.last(3)[0][:name]}!"

#first(3) выводил последние, делал через last(3), но вышло сложнее, мб можно было как-то проще, хз

item_selected = data.select { |x| x[:price] > 2.3}
puts "Товары дороже 2.3 - #{item_selected.map {|x| x[:name]}.join(", ")}!"

#только здесь обратился к помощи гпт(подсказал .map {|x| x[:name]}.join(", ") ) потому что я не мог допереть, как из массива хэшей достать имена и красиво их выписать, если я вдруг не знаю, сколько хэшей в этом массиве
