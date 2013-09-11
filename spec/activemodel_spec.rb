require 'spec_helper'

class Company
  include ActiveModel::Model

  attr_accessor :tax_number, :name
  validates :tax_number, vat_id: true

  def persisted?
    false
  end
end

describe VatIdValidator do
  before {
    @model = Company.new
  }
  
  it "should be valid" do
    @model.tax_number = 'DE123456789'
    @model.valid?.must_equal true
  end
  
  it "should not be valid" do
    @model.tax_number = 'DE123456'
    @model.valid?.must_equal false
    @model.errors[:tax_number].must_include "is invalid"
  end
end