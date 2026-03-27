#Задание 5.3 — Корзина покупок (дополнительно)
#Напишите shopping_cart.rb, который хранит товары в Hash и поддерживает методы: add(name, price, qty), remove(name), summary (выводит содержимое и итог). Реализуйте скидку: 5% при сумме > 5000, 10% при > 10000. Используйте Enumerable для подсчёта итога.


shopping_cart = {}
def add(cart, name, price, qty)
    if cart.key?(name) == true
        cart[name][:qty] += qty
    else
    cart[name] = {price: price, qty: qty}
    end
    puts "Вы добавили #{qty} штук #{name} за #{price}"
end

add(shopping_cart, "pepsi", 300, 4)
add(shopping_cart, "cola", 600, 7)
add(shopping_cart, "kind", 450, 13)
add(shopping_cart, "pepsi", 300, 9)

def remove(cart, name)
    cart.delete(name)
    puts "Вы убрали #{name} из корзины"
end

remove(shopping_cart, "pepsi")

def summary(cart)
    checkout = cart.reduce(0) {|sum, x| sum + x[1][:price] * x[1][:qty]}

    total = case checkout
    when 0..4999 then checkout
    when 5000..9999 then checkout * 0.95
    else checkout * 0.9
    end
    
    puts "Вы набрали в корзину:"
    
    cart.each do |x|
        puts "#{x[1][:qty]} штук #{x[0]} за #{x[1][:price]}"
    end

    puts "Итого с вас #{total}"

end

summary(shopping_cart)
    