# -*- encoding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'

require 'tldr/autorun'

require 'active_model'
require 'vat_id'


class Company
  include ActiveModel::Model

  attr_accessor :tax_number, :name
  validates :tax_number, vat_id: true

  def persisted?
    false
  end
end
