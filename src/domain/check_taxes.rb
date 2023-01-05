# frozen_string_literal: true

module Domain
  class CheckTaxes
    DEFAULT_PRICE = 1
    BASE_TAX = 0.1
    IMPORTED_TAX = 0.05
    IMPORTED = 'imported'
    EXEMPT_TAX_PRODUCTS = %w[
      book
      chocolate
      pill
    ].freeze

    class << self
      def check_total_tax_percentage(name)
        tax = DEFAULT_PRICE

        tax += BASE_TAX unless exempt_base_tax_product?(name)
        tax += IMPORTED_TAX if imported_product?(name)

        tax
      end

      private

      def imported_product?(name)
        name.include?(IMPORTED)
      end

      def exempt_base_tax_product?(name)
        EXEMPT_TAX_PRODUCTS.any? { |exempt_product| name.include?(exempt_product) }
      end
    end
  end
end
