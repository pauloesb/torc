# frozen_string_literal: true

require_relative '../domain/check_taxes'
require_relative '../model/product'

module Domain
  class Parser
    def parse(input)
      Model::Product.new(*process_input(input))
    end

    def error_input
      raise 'Invalid input!'
    end

    def process_input(input)
      unit, *name, _, price = input.split

      full_name =  name.join(' ')

      [unit.to_i, full_name, price.to_f, Domain::CheckTaxes.check_total_tax_percentage(full_name)]
    rescue StandardError
      error_input
    end
  end
end
