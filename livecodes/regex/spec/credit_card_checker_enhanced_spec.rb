require_relative '../credit_card_checker_enhanced'

describe '#credit_card_checker_enhanced' do
  it "returns 'Invalid credit card number' when passed a Visa credit card with an invalid Luhn sum" do
    actual = credit_card_checker_enhanced("4242 4242 4242 4241")
    expected = "Invalid credit card number"
    expect(actual).to eq(expected)
  end

  it "returns 'Valid Mastercard credit card number' when passed a Mastercard credit card with a valid Luhn sum, whatever space there may be" do
    actual = credit_card_checker_enhanced("  55 555555 5 5555555   ")
    expected = "Invalid credit card number"
    expect(actual).to eq(expected)
  end
end
