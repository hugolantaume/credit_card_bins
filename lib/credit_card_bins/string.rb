class String
  def credit_card_bin
    CreditCardBin.new(self)
  end

  def credit_card_bin_brand
    CreditCardBin.new(self).brand
  end

  def credit_card_bin_type
    CreditCardBin.new(self).type
  end

  def credit_card_bin_category
    CreditCardBin.new(self).category
  end

  def credit_card_bin_issuer
    CreditCardBin.new(self).issuer
  end

  def credit_card_bin_country
    CreditCardBin.new(self).country
  end
end