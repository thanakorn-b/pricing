module Pricing
  class Calculator
    def self.calculate(price_context, rules= [])
      context = if price_context.is_a?(Pricing::Context) 
                  price_context
                else price_context 
                  Pricing::Context.new(price_context)
                end 

      chained_rules = build_rule_chain(rules)

      result_context = chained_rules ? chained_rules.apply(context) : context
      
      Result.new(result_context)
    end

    def self.notify
      ActiveSupport::Notifications.instrument "pricing.Updated", this: :data do
        p "publishing pricing updated event "
      end
    end

    private

    def self.build_rule_chain(rules)
      return nil if rules.empty?
      chain = nil
      rules.reverse.each do |rule|
        chain = rule.stack(chain)
      end
      chain
    end
  end
end
