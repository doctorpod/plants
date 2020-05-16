class Growing < ApplicationRecord
  belongs_to :seed, optional: true

  def name
    out = []
    out << compost_mix unless compost_mix.blank?
    out << location unless location.blank?
    out.join(', ')
  end

  def percentage_germinated
    return nil if num_germinated.blank?

    "#{(100 * (num_germinated / num_sown.to_f)).round}%"
  end
end
