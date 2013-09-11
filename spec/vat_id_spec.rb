require 'spec_helper'

describe VatId do
  before do
    @vat = VatId.new('DE123456789')
  end
    
  it "should validate from class method" do
    VatId.valid?('DE123456789').must_equal true
  end
  
  it "should load the validation rules" do
    VatId.specifications.wont_be :empty?
    VatId.specifications.must_be_kind_of Hash
  end
  
  it "should return the county code" do
    @vat.country_code.must_equal "DE"
  end
  
  it "should return the identifier" do
    @vat.identifier.must_equal "123456789"
  end
  
  it "should convert to string" do
    @vat.to_s.must_equal 'DE123456789'
  end
  
  it "should validate" do
    @vat.valid?.must_equal true
  end
  
  it "should not validate" do
    VatId.new('DE12345678910').valid?.must_equal false
  end
  
  it "should strip non alnum chars" do
    VatId.new('CHE-123.456.789HR/IVA').to_s.must_equal 'CHE123456789HRIVA'
  end
  
  # true numbers
  [
    'ATU12345678',
    'BE0123456789',
    'BG123456789',
    'BG1234567890',
    'CHE-123.456.789',
    'CHE-123.456.789MWST',
    'CHE-123.456.789IVA',
    'CHE-123.456.789TVA',
    'CHE-123.456.789HR/MWST',
    'CHE-123.456.789HR/IVA',
    'CHE-123.456.789HR/TVA',
    'CHE-123.456.789RC/MWST',
    'CHE-123.456.789RC/IVA',
    'CHE-123.456.789RC/TVA',
    'CY12345678L',
    'CZ12345678',
    'CZ123456789',
    'CZ1234567810',
    'DE123456789',
    'DK12 34 56 78',
    'EE123456789',
    'EL123456789',
    'ESX1234567X',
    'FI12345678',
    'FRXX 123456789',
    'GB123 4567 89',
    'GB123 4567 89 999',
    'GBGD499',
    'GBHA999',
    'HR12345678999',
    'HU12345678',
    'IE9S12345L',
    'IT12345678999',
    'LT123456789',
    'LT123456789999',
    'LU12345678',
    'LV12345678999',
    'MT12345678',
    'NL123456789B99',
    'PL1234567890',
    'PT123456789',
    'RO123456789',
    'SE123456789001',
    'SI12345678',
    'SK1234567810',
    'MXAAGB860519G31'
  ].each do |code|
    describe code[0..1] do
      it "number #{code} should be valid" do
        VatId.valid?(code).must_equal true
      end
    end
  end
  
  # false numbers
  [
    'GB123 4567 89 1',
    'GB123 4567 89 99',
    'GBGD699',
    'GBHA399'
  ].each do |code|
    describe code[0..1] do
      it "number #{code} should not be valid" do
        VatId.valid?(code).must_equal false
      end
    end
  end
end