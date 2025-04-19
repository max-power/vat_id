class VatIdTest < TLDR
  def setup
    @vat = VatId.new('DE123456789')
    
    @invalid_codes = [
      'GB123 4567 89 1',
      'GB123 4567 89 99',
      'GBGD699',
      'GBHA399'
    ]
    
    @valid_codes = [
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
      'MXAAGB860519G31',
      'EU123ANCDEF2134'
    ]
  end

  def test_validates_from_class_method
    assert VatId.valid?('DE123456789')
  end

  def test_loads_validation_rules
    refute_empty VatId.specifications
    assert_kind_of Hash, VatId.specifications
  end

  def test_returns_country_code
    assert_equal 'DE', @vat.country_code
  end

  def test_returns_identifier
    assert_equal '123456789', @vat.identifier
  end

  def test_converts_to_string
    assert_equal 'DE123456789', @vat.to_s
  end

  def test_validates_instance
    assert @vat.valid?
  end

  def test_does_not_validate_invalid_vat
    refute VatId.new('DE12345678910').valid?
  end

  def test_strips_non_alnum_chars
    vat = VatId.new('CHE-123.456.789HR/IVA')
    assert_equal 'CHE123456789HRIVA', vat.to_s
  end
  
  def test_invalid_codes
    @invalid_codes.each do |code|
      refute VatId.valid?(code), "Expected #{code} to be invalid"
    end
  end
  
  def test_valid_codes
    @valid_codes.each do |code|
      assert VatId.valid?(code), "Expected #{code} to be valid"
    end
  end
  
  def test_translation_name
    assert_equal "Umsatzsteuer-Identifikationsnummer", @vat.name
  end
  
  def test_translation_abbr
    assert_equal "USt-IdNr.", @vat.abbr
  end
  
  def test_eql
    assert_equal @vat, VatId.new(@vat.to_s)
  end
end