def credit_card_checker_enhanced(card_number)
    # remove all empty spaces from card number
  # break string into array of chars
  array = []
  card_number.gsub(' ', '').chars.each_with_index do |char, index|
    digit = char.to_i
    # based on the position we will multiply or not
    if index.even?
      luhn_number = digit * 2
      if luhn_number > 9
        array <<luhn_number.digits.sum
      else
        array << luhn_number
      end
    else
      array << digit
    end
  end
  # p array
  array.sum.digits.first.zero? ? 'Valid credit card number' : 'Invalid credit card number'
end
