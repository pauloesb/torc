# frozen_string_literal: true

module Domain
  class ProcessCart
    def initialize(carts, number)
      @carts = carts
      @number = number
    end

    def process
      return if @carts.products.empty?

      print("Output #{@number}:\n")
      @carts.print_products_information
      @carts.print_total_taxes
      @carts.print_total_price
    end
  end
end
