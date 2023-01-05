# frozen_string_literal: true

require 'pry-byebug'
require_relative './model/cart'
require_relative './domain/parser'
require_relative './domain/process_cart'

class Start
  def call
    carts = []
    carts << input_flow(input_number: 1, total_inputs: 3)
    carts << input_flow(input_number: 2, total_inputs: 2)
    carts << input_flow(input_number: 3, total_inputs: 4)

    carts.each(&:process)
  end

  def input_flow(input_number:, total_inputs:)
    print("Input #{input_number}:\n")

    cart = (1..total_inputs).each_with_object(Model::Cart.new) do |_, products|
      products.add(Domain::Parser.new.parse(gets.chomp))
    end

    Domain::ProcessCart.new(cart, input_number)
  end
end
