# VAT Identification Number

VAT ID validation. Ships with an ActiveModel validator.

[![Gem Version](https://badge.fury.io/rb/vat_id.png)](http://badge.fury.io/rb/vat_id)
[![Build Status](https://travis-ci.org/max-power/vat_id.png?branch=master)](https://travis-ci.org/max-power/vat_id)

## Installation

Add this line to your application's Gemfile:

    gem 'vat_id'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vat_id

## Usage

    v = VatId.new('DE123456789')
    v.valid?       # true
    v.country_code # 'DE'
    v.identifier   # '123456789'
    v.to_s         # 'DE123456789'

    VatId.valid?('DE123456789') # true

or as ActiveModel Validator (make sure you have 'active_model' before 'vat_id' in your Gemfile)

    class Company
      include ActiveModel::Model
      attr_accessor :tax_number, :name
      validates :tax_number, vat_id: true
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
