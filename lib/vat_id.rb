require 'yaml'
require_relative 'vat_id/validator' if defined? ActiveModel

class VatId < Data.define(:code)
  SPEC_PATH = File.expand_path('vat_id/spec.yml', __dir__)
  I18N_PATH = File.expand_path('vat_id/i18n.yml', __dir__)

  def self.specifications
    @specifications ||= YAML.load_file(SPEC_PATH)
  end
  
  def self.translations
    @translations ||= YAML.load_file(I18N_PATH)
  end
  
  def self.valid?(code)
    new(code).valid?
  end
  
  def initialize(code:)
    super code: code.to_s.upcase.gsub(/[^A-Z0-9]/, '')
  end
  
  def country_code
    code[0..1]
  end
  
  def identifier
    code[2..-1]
  end
  
  def to_s
    code
  end
  
  def valid?
    identifier.match? /^#{spec}$/
  end
  
  def name
    i18n['name']
  end

  def abbr
    i18n['abbr']
  end
  
  private
  
  def spec
    self.class.specifications.fetch(country_code)
  end
  
  def i18n
    self.class.translations.fetch(country_code)
  end
end