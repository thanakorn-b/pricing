module Pricing
  class Result
    attr_reader :original_price, :final_price, :applied_rules, :total_savings

    def initialize(context)
      @original_price = context.original_price
      @final_price = context.current_price
      @applied_rules = context.applied_rules
      @total_savings = @original_price - @final_price
    end
  end
end