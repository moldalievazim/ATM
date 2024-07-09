class Main
  attr_accessor :balance

  def initialize
    @balance = 0
    puts 'Welcome to ATM! What would you like to do?'
    puts "\n"
  end

  def run
    loop do
      puts 'Options:'
      puts '1. Balance check'
      puts '2. Deposit'
      puts '3. Withdraw money'
      puts '4. Exit'

      option = gets.chomp.to_i
      puts "\n"

      case option
      when 1
        puts "\n"
        puts "Your balance is $#{@balance}"
        puts "\n"
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
    puts 'Enter amount. $1 - $1500'
    amount = gets.chomp.to_i

    if amount > 0 && amount <= 1500
      @balance += amount
      puts "$#{amount} was successfully deposited to your account!"
      puts "Your balance is $#{@balance} now."
      puts "\n"
    else
      puts 'Invalid amount! Try again!'
      puts "Your balance is $#{@balance}"
      puts "\n"
      deposit
      puts "\n"
    end
  end

  def withdraw
    puts 'Enter amount. $1 - $1000'
    amount = gets.chomp.to_i

    if amount <= @balance && amount <= 1000
      @balance -= amount
      puts "$#{amount} was successfully withdrawn from your account!"
      puts "Your balance is $#{@balance} now."
      puts "\n"
    elsif @balance == 0
      puts "Your balance is $0, you can't get money."
      puts "\n"
    else 
      puts 'Invalid amount! Try again!'
      puts "Your balance is $#{@balance}"
      puts "\n"
      withdraw
      puts "\n"
    end
  end
end
