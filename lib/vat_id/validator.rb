require 'active_model/validator'

class VatIdValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless VatId.valid?(value)
  end
end