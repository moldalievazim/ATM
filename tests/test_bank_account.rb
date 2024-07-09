require 'minitest/autorun'
require_relative '../bank_account'

class TestBankAccount < Minitest::Test
  def setup
    @main_app = BankAccount.new
  end

  def test_deposit_valid_amount
    account = BankAccount.new
  
  input = StringIO.new("100\n")
  $stdin = input

  account.deposit

  if account.balance == 100
    puts "test_deposit_valid_amount passed"
  else
    puts "test_deposit_valid_amount failed"
  end
ensure
  $stdin = STDIN
  end

  def test_deposit_invalid_amount
    account = BankAccount.new 
  
    input = StringIO.new("2000\n100\n")
    $stdin = input

    account.deposit
  
    if account.balance == 100
      puts "test_deposit_invalid_amount passed"
    else
      puts "test_deposit_invalid_amount failed"
    end
  ensure
    $stdin = STDIN
  end
  
end
