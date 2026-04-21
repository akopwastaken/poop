#Создайте файл shapes.rb со следующей структурой:
#9.	Родительский класс Shape: атрибут color (по умолчанию 'white'), метод area (возвращает 0, будет переопределён), метод perimeter, метод to_s — описание фигуры
#10.	Класс Circle < Shape: radius, area = π*r², perimeter = 2*π*r
#11.	Класс Rectangle < Shape: width и height, area = w*h, perimeter = 2*(w+h)
#12.	Класс Square < Rectangle: принимает только side — вызывает super(side, side)
#13.	Класс Triangle < Shape: три стороны a, b, c (validate в initialize: сумма двух сторон > третья), area по формуле Герона, perimeter = a+b+c
#14.	Модуль Displayable: подключить ко всем фигурам. Содержит метод display — выводит название класса, цвет, площадь и периметр красивой таблицей
#15.	include Comparable во все фигуры — сравниваем по площади

module Displayable
    def display
        puts "Фигура: #{self.class} Цвет: #{@color} Площадь: #{@area} Периметр: #{@perimeter}"
    end 
end 

class Shape
   
    include Comparable
    
    include Displayable

    attr_reader :color

    def initialize(color = "white")
        @color = color
    end

    def area
        0
    end

    def perimeter
       0
    end

    def to_s
        "Фигура: #{self.class} Цвет: #{@color} Площадь: #{@area} Периметр: #{@perimeter}"
    end

    def <=>(other)
        area <=> other.area
    end

end

class Circle < Shape
    
    attr_reader :area, :perimeter

    def initialize(r, color = "white")
         @radius = r
         super(color)
         @area = 3.14 * @radius ** 2
         @perimeter = 2 * 3.14 * @radius
    end
end

class Rectangle < Shape

    attr_reader :area, :perimeter

    def initialize(w, h, color = "white")
        super(color)
        @width = w
        @height = h
        @area = @width*@height
        @perimeter = 2*(@width+@height)
    end

end

class Square < Rectangle
    
    def initialize(side, color = "white")
        super(side, side, color)
    end
end

class Triangle < Shape
    
    attr_reader :area, :perimeter

    def validate(a, b, c)
        if a + b > c && a + c > b && b + c > a
            @a = a  
            @b = b  
            @c = c
        else 
            puts "Это не стороны треугольника, попробуй еще раз"
            @a = 0  
            @b = 0  
            @c = 0  
        end
    end
    
    def initialize(a, b, c, color = "white")
        super(color)
        validate(a, b, c)
        @perimeter = @a + @b + @c
        @h_p = @perimeter / 2.0
        @area = Math.sqrt(@h_p * (@h_p - @a) * (@h_p - @b) * (@h_p - @c))
    end
end


# Пример использования
shapes = [
  Circle.new(5, "red"),
  Rectangle.new(4, 6),
  Square.new(5),
  Triangle.new(3, 4, 5)]

shapes.each(&:display)

puts "\nСамая большая фигура: #{shapes.max}"
puts "Отсортированные по площади:"
shapes.sort.each { |s| puts "  #{s}" }
