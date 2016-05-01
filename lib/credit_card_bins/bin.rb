module CreditCardBins; end

class CreditCardBins::Bin

  AttrReaders = [
    :bin,
    :brand,
    :type,
    :category,
    :issuer,
    :country
  ]

  AttrReaders.each do |meth|
    define_method meth do
      @data[meth.to_s]
    end
  end

  attr_reader :data

  def initialize(number)
    @data = YAML.load_file(File.join(File.dirname(__FILE__), '..', 'data', number[0].to_s, number[0..3].to_s + '.yml' ))[number.to_s[0..5]]
  rescue
    raise NotFound, "Bin #{number} not found"
  end

  def ==(other)
    self.data == other.data
  end

  def brand
    @data["brand"].to_s
  end

  def type
    @data["type"].to_s
  end

  def category
    @data["category"].to_s
  end

  def issuer
    @data["issuer"].to_s
  end

  def country
    @data["country"]
  end

  ### Brand

  def private_label?
    @data["brand"] == "PRIVATE LABEL"
  end

  def amex?
    @data["brand"] == "AMERICAN EXPRESS"
  end

  def china_union_pay?
    @data["brand"] == "CHINA UNION PAY"
  end

  def visa?
    @data["brand"] == "VISA"
  end

  def jcb?
    @data["brand"] == "JCB"
  end

  def discover?
    @data["brand"] == "DISCOVER"
  end

  def maestro?
    @data["brand"] == "MAESTRO"
  end

  def atm?
    @data["brand"] == "ATM"
  end

  def dankort?
    @data["brand"] == "DANKORT"
  end

  def mastercard?
    @data["brand"] == "MASTERCARD"
  end

  def laser?
    @data["brand"] == "LASER"
  end

  def solo?
    @data["brand"] == "SOLO"
  end

  def diners_club?
    @data["brand"] == "DINERS CLUB"
  end

  ### Type

  def debit?
    @data["type"] == "DEBIT"
  end

  def credit?
    @data["type"] == "CREDIT"
  end

  def prepaid?
    @data["type"] == "PREPAID"
  end
end
