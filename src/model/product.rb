# frozen_string_literal: true

module Model
  class Product
    MAX_DECIMALS = 3
    PRECISION_NUMBER = 20.0

    attr_reader :unit, :name

    def initialize(unit, name, price, tax)
      @unit = unit
      @name = name
      @price = price
      @tax = tax
    end

    def total_price
      ((@price * @unit * @tax) * PRECISION_NUMBER).round / PRECISION_NUMBER
    end

    def total_taxes
      total_price - (((@price * @unit) * PRECISION_NUMBER) / PRECISION_NUMBER)
    end

    def to_s
      "#{unit} #{name}: #{format('%.2f', total_price)}"
    end
  end
end
