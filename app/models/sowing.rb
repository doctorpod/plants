class Sowing < ApplicationRecord
  belongs_to :seed

  def percentage_germinated
    return nil if num_germinated.blank?

    "#{(100 * (num_germinated / num_sown.to_f)).round}%"
  end
end
