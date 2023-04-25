def credit_card_checker(card_number)
  # 4242 4242 4242 4241

  # GUARD CLAUSE
  return 'Invalid credit card number' if card_number.empty?

  regexp = /(\d{4}\s*){4}$/
  card_number.match?(regexp) ? 'Valid credit card number' : 'Invalid credit card number'
end

#match #=> match data
#match? #=> true/false
