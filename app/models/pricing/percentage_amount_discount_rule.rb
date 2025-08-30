module Pricing
  class PercentageAmountDiscountRule < Rule
    after_initialize :set_default_params, if: :new_record?
    
    attr_reader :amount

    def amount=(value)
      @amount = value
      self.properties['amount'] = value
    end

    protected

    def transform(price_context)
      amount = properties['amount']
      new_price = [price_context.current_price - (price_context.current_price * amount / 100), 0].max
      price_context.current_price = new_price
      price_context.applied_rules << {
        type: self.class.name,
        amount: amount,
        previous_price: price_context.current_price + amount,
      }
      price_context
    end

    private

    def set_default_params
      @amount = 10
      self.properties ||= {}
      self.properties['amount'] ||= @amount
      self.properties['type'] ||= 'percentage_amount_discount'
    end
  end
end