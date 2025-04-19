class VatIdValidatorTest < TLDR
  def setup
    @model = Company.new
  end

  def test_valid_model
    @model.tax_number = 'DE123456789'
    assert @model.valid?
  end
  
  def test_invalid_model
    @model.tax_number = 'DE123456'
    refute @model.valid?
    assert_includes @model.errors[:tax_number], "is invalid"
  end
end