# Your Luhn Algorithm Here
class LuhnChecker

  attr_accessor :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def backwards
    card_number.reverse
  end

  def take_apart
    backwards.chars.map(&:to_i)
  end

  def multiply_odd_indexes
    take_apart.map.with_index do |x, y|
      if y.odd?
        x * 2
      else
        x
      end
    end
  end

  def sum_over_10
    multiply_odd_indexes.map do |i|
      if i > 9
        i - 9
      else
        i
      end
    end.flatten
  end

  def sum_everything
    sum_over_10.inject(:+)
  end

  def validate
    if sum_everything % 10 == 0
      return "The number is valid!"
    else
      return "The number is invalid!"
    end
  end

end
# Output
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"
