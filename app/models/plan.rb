# frozen_string_literal: true
class Plan
  PLANS = [:free, :premium].freeze

  def self.options
    PLANS.map { |plan| [plan.capitalize, plan] }
  end
end
