class GrowingStage < ApplicationRecord
  belongs_to :growing

  default_scope { order(:started_on) }

  STAGE_TYPES = [
    'Stratification',
    'Sowing',
    'Vegetative propagation',
    'Potting',
    'Planting out'
  ].freeze
end
