module Pricing
  class RulesController < ApplicationController
    before_action :set_rule, only: %i[ show edit update destroy ]

    # GET /rules
    def index
      @rules = Rule.all
    end

    # GET /rules/1
    def show
    end

    # GET /rules/new
    def new
      @rule = Rule.new
    end

    # GET /rules/1/edit
    def edit
    end

    # POST /rules
    def create
      @rule = Rule.new(rule_params)

      if @rule.save
        redirect_to @rule, notice: "Rule was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /rules/1
    def update
      if @rule.update(rule_params)
        redirect_to @rule, notice: "Rule was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /rules/1
    def destroy
      @rule.destroy!
      redirect_to rules_path, notice: "Rule was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_rule
        @rule = Rule.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def rule_params
        params.expect(rule: [ :type, :active ])
      end
  end
end
