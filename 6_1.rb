#Напишите класс BankAccount:
#1.	Атрибуты: owner (только читать), balance (только читать), список transactions
#2.	initialize(owner, initial_balance = 0) — создать счёт с начальным балансом
#3.	deposit(amount) — пополнить счёт. Отказать если amount <= 0
#4.	withdraw(amount) — снять. Отказать если amount > balance или amount <= 0
#5.	transfer(amount, other_account) — перевести деньги на другой счёт (withdraw у себя + deposit у другого)
#6.	history — вывести список всех транзакций с типом, суммой и балансом после операции
#7.	Class method BankAccount.minimum_balance — возвращает 0 (константа)
#8.	Class method BankAccount.total_deposits_count — сколько всего пополнений было создано по всем счетам

class BankAccount
    attr_reader :owner, :balance, :transactions 

    @@total_deposits = 0

    def initialize(owner, initial_balance = 0)
        @owner = owner
        @balance = initial_balance
        @transactions = []
    end

    def deposit(amount)
        if amount <=0 
            puts "ты дурак?"
            return
        end
        @balance += amount
        @transactions << {type: :deposit, amount: amount, balance: @balance}
        @@total_deposits += 1
    end

    def withdraw(amount)
        if amount > balance || amount <= 0
            puts "ты дурак?"
            return
        end
        @balance -= amount
        @transactions << {type: :withdraw, amount: amount, balance: @balance}
    end

    def transfer(amount, other_account)
            if amount > @balance || amount <= 0
                puts "ты дурак?"
                return
            end
        @balance -= amount
        @transactions << {type: :withdraw, amount: amount, balance: @balance, to: other_account.owner}
        other_account.deposit(amount)
    end

    def history
        puts "Транзакции счета #{@owner}"
        @transactions.each do |x|
            if x[:type] == :withdraw
                sign = "-"
                else sign = "+"
            end
            if x[:to] == nil
                receiver = ""
                else receiver = "(перевод → #{x[:to]})"
            end
        puts "#{sign} #{x[:amount]} руб. | баланс: #{x[:balance]} #{receiver}"
        end
    end

    def self.minimum_balance
        puts "0"
    end

    def self.total_deposits_count
        puts "Всего депозитов - #{@@total_deposits}"
    end

end

vasya = BankAccount.new("Vasiliy", 5000)

vasya.withdraw(300)

masha = BankAccount.new("Maria")

masha.deposit(3500)

vasya.transfer(2750, masha)

vasya.deposit(1234)

vasya.history

BankAccount.total_deposits_count

BankAccount.minimum_balance
