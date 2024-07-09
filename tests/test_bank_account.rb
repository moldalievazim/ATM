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
end
