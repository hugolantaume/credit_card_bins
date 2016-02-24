# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe CreditCardBins do

  describe "behavior" do

    before(:each) do
      @bin = CreditCardBin.new("497040")
    end

    it "allows to create a valid CreditCardBin object from a valid credit card bin number" do
      expect(@bin.data).not_to be_nil
    end

    it "is an instance of the CreditCardBin Class" do
      expect(@bin).to be_instance_of(CreditCardBin)
    end

    it "has a Hash :data attribute" do
      expect(@bin).to respond_to(:data)
      expect(@bin.data).to be_a Hash
    end

    it "hash a Hash :data attribute with valid keys" do
      expect(@bin.data).to have_key "bin"
      expect(@bin.data["bin"]).to be_a String
      expect(@bin.data).to have_key "brand"
      expect(@bin.data["brand"]).to be_a String
      expect(@bin.data).to have_key "type"
      expect(@bin.data["type"]).to be_a String
      expect(@bin.data).to have_key "category"
      expect(@bin.data["category"]).to be_a String
      expect(@bin.data).to have_key "issuer"
      expect(@bin.data["issuer"]).to be_a String
      expect(@bin.data).to have_key "country"
      expect(@bin.data["country"]).to be_a Hash
    end

    it "has a String :bin attribute" do
      expect(@bin).to respond_to :bin
      expect(@bin.bin).to be_a String
      expect(@bin.bin).to eq(@bin.data["bin"])
    end

    it "has a String :brand attribute" do
      expect(@bin).to respond_to :brand
      expect(@bin.brand).to be_a String
      expect(@bin.brand).to eq(@bin.data["brand"])
    end

    it "has a String :type attribute" do
      expect(@bin).to respond_to :type
      expect(@bin.type).to be_a String
      expect(@bin.type).to eq(@bin.data["type"])
    end

    it "has a String :category attribute" do
      expect(@bin).to respond_to :category
      expect(@bin.category).to be_a String
      expect(@bin.category).to eq(@bin.data["category"])
    end

    it "has a String :issuer attribute" do
      expect(@bin).to respond_to :issuer
      expect(@bin.issuer).to be_a String
      expect(@bin.issuer).to eq(@bin.data["issuer"])
    end

    it "has a Hash :country attribute" do
      expect(@bin).to respond_to :country
      expect(@bin.country).to be_a Hash
      expect(@bin.country).to eq(@bin.data["country"])
    end
  end

  describe "valid attributes" do

    before(:each) do
      @bin = CreditCardBin.new("497040")
    end

    it "has the right :bin attribute" do
      expect(@bin.bin).to eq("497040")
    end

    it "has the right :brand attribute" do
      expect(@bin.brand).to eq("VISA")
    end

    it "has the right :type attribute" do
      expect(@bin.type).to eq("CREDIT")
    end

    it "has the right :category attribute" do
      expect(@bin.category).to eq("CLASSIC")
    end

    it "has the right :issuer attribute" do
      expect(@bin.issuer).to eq("LA BANQUE POSTALE")
    end

    it "has the right :country attribute" do
      expect(@bin.country).to eq({"alpha_2" => "FR", "alpha_3" => "FRA", "name" => "France"})
    end

    it "has the right :bin attribute length" do
      long_bin_number = CreditCardBin.new("4970403121")
      expect(long_bin_number.bin).to eq("497040")
      expect(long_bin_number.bin.length).to eq(6)
    end

  end

  describe "invalid attributes" do

    it "has a nil :data attribute when the number is empty" do
      empty_number_bin = CreditCardBin.new("")
      expect(empty_number_bin.data).to be_nil
    end

    it "has a nil :data attribute when the number is too short" do
      too_short_number_bin = CreditCardBin.new("1234")
      expect(too_short_number_bin.data).to be_nil
    end

    it "has a nil :data attribute when the number is not found in the database" do
      not_found_number_bin = CreditCardBin.new("0010000")
      expect(not_found_number_bin.data).to be_nil
    end
  end

  describe "methods" do

    it "include a private_label? query" do
      valid_private_label_bin = CreditCardBin.new("019627")
      expect(valid_private_label_bin.private_label?).to eq(true)
      invalid_private_label_bin = CreditCardBin.new("324000")
      expect(invalid_private_label_bin.private_label?).to eq(false)
    end

    it "include a amex? query" do
      valid_amex_bin = CreditCardBin.new("324000")
      expect(valid_amex_bin.amex?).to eq(true)
      invalid_amex_bin = CreditCardBin.new("497040")
      expect(invalid_amex_bin.amex?).to eq(false)
    end

    it "include a china_union_pay? query" do
      valid_china_union_pay_bin = CreditCardBin.new("622126")
      expect(valid_china_union_pay_bin.china_union_pay?).to eq(true)
      invalid_china_union_pay_bin = CreditCardBin.new("324000")
      expect(invalid_china_union_pay_bin.china_union_pay?).to eq(false)
    end

    it "include a visa? query" do
      valid_visa_bin = CreditCardBin.new("497040")
      expect(valid_visa_bin.visa?).to eq(true)
      invalid_visa_bin = CreditCardBin.new("324000")
      expect(invalid_visa_bin.visa?).to eq(false)
    end

    it "include a jcb? query" do
      valid_jcb_bin = CreditCardBin.new("180000")
      expect(valid_jcb_bin.jcb?).to eq(true)
      invalid_jcb_bin = CreditCardBin.new("497040")
      expect(invalid_jcb_bin.jcb?).to eq(false)
    end

    it "include a discover? query" do
      valid_discover_bin = CreditCardBin.new("300000")
      expect(valid_discover_bin.discover?).to eq(true)
      invalid_discover_bin = CreditCardBin.new("497040")
      expect(invalid_discover_bin.discover?).to eq(false)
    end

    it "include a maestro? query" do
      valid_maestro_bin = CreditCardBin.new("500003")
      expect(valid_maestro_bin.maestro?).to eq(true)
      invalid_maestro_bin = CreditCardBin.new("497040")
      expect(invalid_maestro_bin.maestro?).to eq(false)
    end

    it "include a atm? query" do
      valid_atm_bin = CreditCardBin.new("498701")
      expect(valid_atm_bin.atm?).to eq(true)
      invalid_atm_bin = CreditCardBin.new("497040")
      expect(invalid_atm_bin.atm?).to eq(false)
    end

    it "include a dankort? query" do
      valid_dankort_bin = CreditCardBin.new("501934")
      expect(valid_dankort_bin.dankort?).to eq(true)
      invalid_dankort_bin = CreditCardBin.new("497040")
      expect(invalid_dankort_bin.dankort?).to eq(false)
    end

    it "include a mastercard? query" do
      valid_mastercard_bin = CreditCardBin.new("510000")
      expect(valid_mastercard_bin.mastercard?).to eq(true)
      invalid_mastercard_bin = CreditCardBin.new("497040")
      expect(invalid_mastercard_bin.mastercard?).to eq(false)
    end

    it "include a laser? query" do
      valid_laser_bin = CreditCardBin.new("630477")
      expect(valid_laser_bin.laser?).to eq(true)
      invalid_laser_bin = CreditCardBin.new("497040")
      expect(invalid_laser_bin.laser?).to eq(false)
    end

    it "include a solo? query" do
      valid_solo_bin = CreditCardBin.new("633454")
      expect(valid_solo_bin.solo?).to eq(true)
      invalid_solo_bin = CreditCardBin.new("497040")
      expect(invalid_solo_bin.solo?).to eq(false)
    end

    it "include a diners club? query" do
      valid_diners_club_bin = CreditCardBin.new("360756")
      expect(valid_diners_club_bin.diners_club?).to eq(true)
      valid_diners_club_bin = CreditCardBin.new("497040")
      expect(valid_diners_club_bin.diners_club?).to eq(false)
    end


    it "include a credit? query" do
      valid_credit_bin = CreditCardBin.new("180000")
      expect(valid_credit_bin.credit?).to eq(true)
      invalid_credit_bin = CreditCardBin.new("019627")
      expect(invalid_credit_bin.credit?).to eq(false)
    end

    it "include a debit? query" do
      valid_debit_bin = CreditCardBin.new("019627")
      expect(valid_debit_bin.debit?).to eq(true)
      invalid_debit_bin = CreditCardBin.new("180000")
      expect(invalid_debit_bin.debit?).to eq(false)
    end

    it "include a prepaid? query" do
      valid_prepaid_bin = CreditCardBin.new("467765")
      expect(valid_prepaid_bin.prepaid?).to eq(true)
      invalid_prepaid_bin = CreditCardBin.new("019627")
      expect(invalid_prepaid_bin.prepaid?).to eq(false)
    end
  end

  describe "String" do

    it "has a convenience constructor" do
      bin = "497040".credit_card_bin
      c_bin = CreditCardBin.new("497040")
      expect(bin).to eq(c_bin)
    end

    it "has a convenience brand method" do
      bin_brand = "497040".credit_card_bin_brand
      c_brand = CreditCardBin.new("497040").brand
      expect(bin_brand).to eq(c_brand)
    end

    it "has a convenience type method" do
      bin_type = "497040".credit_card_bin_type
      c_type = CreditCardBin.new("497040").type
      expect(bin_type).to eq(c_type)
    end

    it "has a convenience category method" do
      bin_category = "497040".credit_card_bin_category
      c_category = CreditCardBin.new("497040").category
      expect(bin_category).to eq(c_category)
    end

    it "has a convenience issuer method" do
      bin_issuer = "497040".credit_card_bin_issuer
      c_issuer = CreditCardBin.new("497040").issuer
      expect(bin_issuer).to eq(c_issuer)
    end

    it "has a convenience country method" do
      bin_country = "497040".credit_card_bin_country
      c_country = CreditCardBin.new("497040").country
      expect(bin_country).to eq(c_country)
    end
  end
end
