#   Класс DiaryEntry: date (автоматически текущая дата), title, content, метод to_s
#   Класс Diary: хранит список записей, методы add(title, content), all, find_by_date(date), save
#   Сохранение: каждая запись — строка в diary.txt формата: дата|заголовок|содержание
#   При запуске — автоматически загружать diary.txt если он существует
#   Меню через loop: 1) новая запись, 2) все записи, 3) найти по дате, 4) выйти
#   Обработать исключения: файл не найден (первый запуск), нет прав на запись, пустой заголовок
#   Создать собственный класс DiaryError < StandardError




class DiaryError < StandardError
end

class DiaryEntry
    attr_reader :date, :title, :content

    def initialize(title, content, date = "#{Time.now.to_s[0...10]}")
        @title = title 
        @content = content
        @date = date
    end

    def to_s
        "#{@date}|#{@title}|#{@content}"
    end
end

class Diary
    attr_reader :notes

    def initialize
        @notes = []
        begin
            File.readlines("diary.txt").each do |line|
                date, title, content = line.chomp.split("|", 3)
                @notes << DiaryEntry.new(title, content, date)
            end
        rescue Errno::ENOENT
        end
    end

    def add(title, content)
        raise DiaryError, "Пустой заголовок" if title.strip.empty?
        @notes << DiaryEntry.new(title, content)
    end

    def all
        @notes
    end

    def find_by_date(date)
        @notes.select {|x| x.date == date}
    end
   
    def save
        File.write("diary.txt", @notes.map {|note| note.to_s}.join("\n"))
    rescue Errno::EACCES
        raise DiaryError, "Нет прав на запись"
    end

end

diary = Diary.new

loop do

    puts "=== Дневник ===\n1. Новая запись\n2. Все записи\n3. Найти по дате\n4. Выйти\n\n"
    print "Выбор:"
    answer = gets.chomp

    case answer
    when "1" then
        begin 
            print "Напишите заголовок:"
            title = gets.chomp

            print "Напишите текст записи:"
            content = gets.chomp

            diary.add(title, content)
            diary.save

            puts "Сохранено!"

        rescue DiaryError => e
            puts "Ошибка: #{e.message}"
        end
        next

    when "2" then 
        puts "Все записи:"
        puts diary.all
    next

    when "3" then 
        print "Напишите дату в формате 'yyyy-mm-dd':"
        date = gets.chomp
        puts diary.find_by_date(date)
    next

    when "4" then 
        puts "Ладно, пока!" 
    break

    else puts "Я тебя не понял, напиши ответ одной цифрой"
        next
    end
end
