require "yaml"
require "vat_id/version"
require "vat_id/validator" if defined? ActiveModel

class VatId
  def self.specifications
    @@specs ||= YAML.load_file(File.expand_path('vat_id/specs.yml', File.dirname(__FILE__)))
  end
  
  def self.valid?(code)
    new(code).valid?
  end
  
  def initialize(code)
    @code = code.to_s.upcase.gsub(/[^A-Z0-9]/, '')
  end
  
  def country_code
    @code[0..1]
  end
  
  def identifier
    @code[2..-1]
  end
  
  def to_s
    @code
  end
  
  def valid?
    !!specification && !!identifier.match(/^#{specification}$/)
  end
  
  private
  
  def specification
    self.class.specifications[country_code.downcase]
  end
end