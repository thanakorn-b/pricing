class AddPropertiesToPricingRules < ActiveRecord::Migration[8.0]
  def change
    add_column :pricing_rules, :properties, :jsonb, default: {}
  end
end
