# An intention to grow a plant or batch of plants
class Growing < ApplicationRecord
  belongs_to :seed, optional: true
  has_many :growing_stages, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  default_scope { order(:created_at) }

  def percentage_germinated
    return nil if num_germinated.blank?

    "#{(100 * (num_germinated / num_sown.to_f)).round}%"
  end
end
