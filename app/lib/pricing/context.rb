module Pricing
  class Context
    attr_accessor :original_price, :current_price, :applied_rules, :metadata
    
    def initialize(original_price)
      @original_price = original_price
      @current_price = original_price
      @applied_rules = []
      @metadata = {}
    end
  end
end