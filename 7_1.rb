#Создайте файл shapes.rb со следующей структурой:
#9.	Родительский класс Shape: атрибут color (по умолчанию 'white'), метод area (возвращает 0, будет переопределён), метод perimeter, метод to_s — описание фигуры
#10.	Класс Circle < Shape: radius, area = π*r², perimeter = 2*π*r
#11.	Класс Rectangle < Shape: width и height, area = w*h, perimeter = 2*(w+h)
#12.	Класс Square < Rectangle: принимает только side — вызывает super(side, side)
#13.	Класс Triangle < Shape: три стороны a, b, c (validate в initialize: сумма двух сторон > третья), area по формуле Герона, perimeter = a+b+c
#14.	Модуль Displayable: подключить ко всем фигурам. Содержит метод display — выводит название класса, цвет, площадь и периметр красивой таблицей
#15.	include Comparable во все фигуры — сравниваем по площади

class Shape
    include Comparable
    
    attr_reader :color

    def initialize(color = "white")
        @color = color
    end

    def area(area = 0)
        @area = area
    end

    def perimeter(perimeter = 0)
        @perimeter = perimeter
        perimeter += 0 #???
    end

    def to_s
        "#{@name} 
        Цвет: #{@color}
        Площадь: #{@area}
        Периметр: #{@perimeter}"
    end
end

class Circle < Shape
    def initialize(color, r)
         @radius = r
    end

    def area
        area = 3.14*@radius**2
    end

    def perimeter
        perimeter = 2*3.14*@radius
    end
end

class Rectangle < Shape
    def initialize(color, w, h)
        @width = w
        @height = h
    end

    def area
        area = @width*@height
    end

    def perimeter
        perimeter = 2*(@width+@height)
    end
end

class Square < Rectangle
    def initialize(color, side)
        super(side, side)
    end
end


krug = Circle.new("reed", 4)
krug.area

premoug = Rectangle.new("yellow", 4, 5)









# Пример использования
shapes = [
  Circle.new(5, color: "red"),
  Rectangle.new(4, 6),
  Square.new(5),
  Triangle.new(3, 4, 5),
]

shapes.each(&:display)

puts "\nСамая большая фигура: #{shapes.max}"
puts "Отсортированные по площади:"
shapes.sort.each { |s| puts "  #{s}" }
