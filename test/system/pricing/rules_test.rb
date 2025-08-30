require "application_system_test_case"

module Pricing
  class RulesTest < ApplicationSystemTestCase
    setup do
      @rule = pricing_rules(:one)
    end

    test "visiting the index" do
      visit rules_url
      assert_selector "h1", text: "Rules"
    end

    test "should create rule" do
      visit rules_url
      click_on "New rule"

      check "Active" if @rule.active
      fill_in "Type", with: @rule.type
      click_on "Create Rule"

      assert_text "Rule was successfully created"
      click_on "Back"
    end

    test "should update Rule" do
      visit rule_url(@rule)
      click_on "Edit this rule", match: :first

      check "Active" if @rule.active
      fill_in "Type", with: @rule.type
      click_on "Update Rule"

      assert_text "Rule was successfully updated"
      click_on "Back"
    end

    test "should destroy Rule" do
      visit rule_url(@rule)
      click_on "Destroy this rule", match: :first

      assert_text "Rule was successfully destroyed"
    end
  end
end
