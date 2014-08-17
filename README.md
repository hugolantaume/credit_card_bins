# CreditCardBins - A Credit Card IIN/BIN lookup Ruby gem.

[![Build Status](https://secure.travis-ci.org/hugolantaume/credit_card_bins.png?branch=master)](http://travis-ci.org/hugolantaume/credit_card_bins)
[![Gem Version](https://badge.fury.io/rb/credit_card_bins.svg)](http://badge.fury.io/rb/credit_card_bins)
[![Coverage Status](https://coveralls.io/repos/hugolantaume/credit_card_bins/badge.png?branch=master)](https://coveralls.io/r/hugolantaume/credit_card_bins?branch=master)

The Issuer Identification Number (IIN), previously known as Bank Identification Number (BIN) is the first six numbers of a credit card. These identify the institution that issued the card to the card holder and provide useful information about the card that can help make your payments flow smarter.

The database is located in lib/data and the gem does not use any third-party API.


## Installation

Add this line to your application's Gemfile:

    gem 'credit_card_bins'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install credit_card_bins

## How to use CreditCardBins

CreditCardBins is designed to make it easy to access a credit card's brand, issuer, type and more.

Examples using string monkey patch

    require 'credit_card_bins'

    '497040'.credit_card_bin_brand #"VISA"
    '497040'.credit_card_bin_type #"CREDIT"
    '497040'.credit_card_bin_category #"CLASSIC"
    '497040'.credit_card_bin_issuer #"LA BANQUE POSTALE"
    '497040'.credit_card_bin_country #{"alpha_2"=>"FR", "alpha_3"=>"FRA", "name"=>"France"}

Example using the CreditCardBin Class

    require 'credit_card_bins'

    number = "378282246310005"
    bin = CreditCardBin.new(number)
    
    bin.bin #"378282"
    bin.brand #"AMERICAN EXPRESS"
    bin.type #"CREDIT"
    bin.category #"SMALL CORPORATE"
    bin.issuer #"AMERICAN EXPRESS COMPANY"
    bin.country #{"alpha_2"=>"US", "alpha_3"=>"USA", "name"=>"United States"}
    
    bin.visa? #false
    bin.amex? #true
    bin.mastercard? #false
    
    bin.debit? #false
    bin.credit? #true
    bin.prepaid? #false


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
