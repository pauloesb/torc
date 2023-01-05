# frozen_string_literal: true

module Model
  class Cart
    attr_reader :products

    def initialize
      @products = []
    end

    def add(product)
      raise 'This is not a product!' unless product.is_a?(Model::Product)

      @products << product
    end

    def print_total_price
      total_price = products.map(&:total_price).reduce(&:+)

      print("Total: #{format('%.2f', total_price)}\n")
    end

    def print_total_taxes
      total_taxes = products.map(&:total_taxes).reduce(&:+)

      print("Sales Taxes: #{format('%.2f', total_taxes)}\n")
    end

    def print_products_information
      products.each do |product|
        print("#{product}\n")
      end
    end
  end
end
