require 'minitest/autorun'
require_relative '../bank_account'

class TestBankAccount < Minitest::Test
  def setup
    @account = BankAccount.new
  end

  def test_deposit_valid_amount
  input = StringIO.new("100\n")
  $stdin = input

  @account.deposit
  assert_equal 100, @account.balance, 'test_deposit_invalid_amount failed'

  ensure
  $stdin = STDIN
  end

  def test_deposit_invalid_amount
    input = StringIO.new("2000\n100\n")
    $stdin = input

    @account.deposit
    assert_equal 100, @account.balance, 'test_deposit_invalid_amount failed'
  
  ensure
    $stdin = STDIN
  end

  def test_withdraw_valid_amount
    @account.balance = 500
    input = StringIO.new("200\n")
    $stdin = input

    @account.withdraw

    assert_equal 300, @account.balance, 'Failed'
  ensure
    $stdin = STDIN 
  end

  def test_withdraw_exceeds_balance
    @account.balance = 300
    input = StringIO.new("400\n100\n")
    $stdin = input

    @account.withdraw

    assert_equal 200, @account.balance, 'Failed'
  ensure
    $stdin = STDIN 
  end

  def test_withdraw_exceeds_limit
    @account.balance = 1500
    input = StringIO.new("1200\n800\n")
    $stdin = input

    @account.withdraw

    assert_equal 700, @account.balance, 'Failed'
  ensure
    $stdin = STDIN 
  end

  def test_withdraw_from_zero_balance
    @account.balance = 0
    input = StringIO.new("100\n")
    $stdin = input

    @account.withdraw

    assert_equal 0, @account.balance, 'Failed'
  ensure
    $stdin = STDIN 
  end
end
