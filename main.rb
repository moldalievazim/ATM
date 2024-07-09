class Main
  attr_accessor :balance

  def initialize
    @balance = 0
    puts 'Welcome to ATM!'
    
  end

  def run
    loop do
      puts 'Options:'
      puts '1. Balance check'
      puts '2. Deposit'
      puts '3. Withdraw money'
      puts '4. Exit'

      option = gets.chomp.to_i

      case option
      when 1
        puts "Your balance is #{@balance}"
      when 2
        deposit
      when 3
        withdraw
      when 4
        puts 'Have a nice day!'
        break
      else
        puts 'Invalid option. Please choose a valid option.'
      end
    end
  end

  def deposit 
    
  end

  def withdraw

  end
end
