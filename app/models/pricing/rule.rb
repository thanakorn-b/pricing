module Pricing
  class Rule < ApplicationRecord

    def stack(next_rule = nil)
      @next_rule = next_rule
      self # Return self to allow chaining
    end

    def apply(price_context)
      transformed_context = transform(price_context)

      if @next_rule
        @next_rule.apply(transformed_context)
      else
        transformed_context
      end
    end

    protected

    def transform(context)
      raise NotImplementedError, "Subclasses must implement this method"
    end
  end
end
