gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'credit_check.rb'

class LuhnTest < Minitest::Test

def test_if_backward
  forward_number = LuhnChecker.new("4929735477250543")
  assert_equal "3450527745379294", forward_number.backwards
end

def test_if_seperated
  string_number = LuhnChecker.new("4929735477250543")
  assert_equal [3, 4, 5, 0, 5, 2, 7, 7, 4, 5, 3, 7, 9, 2, 9, 4], string_number.take_apart
end

def test_if_odd_indexes_squared
  test_number = LuhnChecker.new("4929735477250543")
  assert_equal [3, 8, 5, 0, 5, 4, 7, 14, 4, 10, 3, 14, 9, 4, 9, 8], test_number.multiply_odd_indexes
end

def test_if_numbers_more_than_10_summed
  test_number = LuhnChecker.new("4929735477250543")
  assert_equal [3, 8, 5, 0, 5, 4, 7, 5, 4, 1, 3, 5, 9, 4, 9, 8], test_number.sum_over_10
end

def test_if_everything_summed
  test_number = LuhnChecker.new("4929735477250543")
  assert_equal 80, test_number.sum_everything
end

def test_if_valid
  valid_number1 = LuhnChecker.new("4929735477250543")
  valid_number2 = LuhnChecker.new("4024007136512380")
  valid_number3 = LuhnChecker.new("6011797668867828")
  invalid_number1 = LuhnChecker.new("5541801923795240")
  invalid_number2 = LuhnChecker.new("4024007106512380")
  invalid_number3 = LuhnChecker.new("6011797668868728")
  assert_equal "The number is valid!", valid_number1.validate
  assert_equal "The number is valid!", valid_number2.validate
  assert_equal "The number is valid!", valid_number3.validate
  assert_equal "The number is invalid!", invalid_number1.validate
  assert_equal "The number is invalid!", invalid_number2.validate
  assert_equal "The number is invalid!", invalid_number3.validate
end

def test_amex
  amex_valid = LuhnChecker.new("342804633855673")
  amex_invalid = LuhnChecker.new("342801633855673")
  assert_equal "The number is valid!", amex_valid.validate
  assert_equal "The number is invalid!", amex_invalid.validate
end

end
