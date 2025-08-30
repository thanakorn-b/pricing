class CreatePricingRules < ActiveRecord::Migration[8.0]
  def change
    create_table :pricing_rules do |t|
      t.string :type
      t.boolean :active

      t.timestamps
    end
  end
end
