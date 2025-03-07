require 'pry'
class BankAccount

    attr_accessor :balance, :status, :deposit
    attr_reader :name, :display_balance    
    def initialize(name, balance =1000, status='open')
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if status == 'open' && balance > 0
            true
        else
            false
        end
    end

    def close_account
        self.status = 'closed'
    end


end