#Возьмите классы Character/Warrior/Mage из урока. Добавьте:
#	Модуль Healable с методом heal(amount) — восстанавливает HP не выше максимума
#	Класс Paladin < Warrior, include Healable — воин, который может лечить
#	Класс Druid < Mage, include Healable — маг, который может лечить
#	Comparable по health — чтобы можно было найти самого слабого
#	Проверьте .ancestors для Paladin и Druid — изучите MRO

module Healable
    def heal(amount)
    @health = [@health + amount, @maximum_health].min 
    puts "#{@name} отхилял #{amount} едениц здоровья. Здоровье: #{@health}"
    end
end

class Character
  attr_reader :name, :health
  
  include Comparable

  def <=>(other)
    health <=> other.health
  end

  def initialize(name, health = 100)
    @name   = name
    @health = health 
    @maximum_health = health
  end

  def take_damage(dmg)
    @health = [@health - dmg, 0].max  # не уходим в минус
    puts "#{@name} получил #{dmg} урона. Здоровье: #{@health}"
  end

  def alive?
    @health > 0
  end

  def status
    "#{@name} [HP: #{@health}]"
  end
end

# Дочерние классы — только специфика
class Warrior < Character
  def initialize(name)
    super(name, 150)  # воин крепче — передаём 150 HP родителю
    @armor = 10
  end

  def take_damage(dmg)
    reduced = [dmg - @armor, 0].max  # броня поглощает урон
    super(reduced)  # вызываем метод родителя с изменённым значением
  end

  def attack(target)
    puts "#{@name} атакует #{target.name} мечом!"
    target.take_damage(25)
  end
end

class Mage < Character
  def initialize(name)
    super(name, 70)  # маг хрупкий — 70 HP
    @mana = 100
  end

  def cast_fireball(target)
    if @mana >= 30
      @mana -= 30
      puts "#{@name} кастует Огненный шар!"
      target.take_damage(50)
    else
      puts "Недостаточно маны!"
    end
  end
end

class Paladin < Warrior
    include Healable
end

class Druid < Mage
    include Healable
end

# Использование
warrior = Warrior.new("Конан")
mage    = Mage.new("Гэндальф")

warrior.attack(mage)
mage.cast_fireball(warrior)

puts warrior.status
puts mage.status
puts mage.alive?


paladin = Paladin.new("leroy")
paladin.take_damage(20)
paladin.heal(5)
paladin.heal(67)

puts paladin > warrior

puts Paladin.ancestors
puts Druid.ancestors
