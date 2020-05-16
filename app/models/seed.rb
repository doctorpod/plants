class Seed < ApplicationRecord
  has_many :sowings, dependent: :destroy

  scope :current, -> { where seeds_remaining: true }
  scope :finished, -> { where seeds_remaining: false }

  scope :by_name, ->(direction = :asc) { order name: direction }
  scope :by_acquired, ->(direction = :asc) { order acquired: direction }
  scope :by_source, ->(direction = :asc) { order source: direction }
  scope :by_sow_by, ->(direction = :asc) { order sow_by: direction }

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
