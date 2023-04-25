require_relative '../credit_card_checker'

describe '#credit_card_checker' do
  it 'returns "Invalid credit card number" when passed an empty string' do
    expect(credit_card_checker('')).to eq("Invalid credit card number")
  end
  it 'returns "Invalid credit card number" when passed a string with at least one NON-NUMERIC character' do
    expect(credit_card_checker('4242-4242-4242-4242')).to eq("Invalid credit card number")
  end

  it 'returns "Valid credit card number" when passed 4 groups of 4 digits separated by spaces' do
    expect(credit_card_checker('4242 4242 4242 4242')).to eq("Valid credit card number")
  end

  it 'returns "Valid credit card number" when passed 16 digits, whatever spaces there might be' do
    expect(credit_card_checker('  4242     4242     4242  4242   ')).to eq("Valid credit card number")
  end
end
