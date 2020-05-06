class Seed < ApplicationRecord
  has_many :sowings

  validate :validate_sowing_months

  private

  def validate_sowing_months
    validate_months :covered_sowing_months
    validate_months :direct_sowing_months
  end

  def validate_months(attribute)
    return if send(attribute).blank?

    send(attribute).split(" ").each do |token|
      unless token =~ /\d\d*/ && (1..12).include?(token.to_i)
        errors.add(attribute, 'must be a space separated sequence of month numbers between 1 and 12')
      end
    end
  end
end
