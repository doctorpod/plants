module SeedsHelper
  def sowing_months(month_numbers_string)
    return '' if month_numbers_string.blank?

    months = %w[j f m a m j j a s o n d]
    month_numbers = month_numbers_string.split(' ').map(&:to_i).uniq

    month_numbers.each do |month_number|
      months[month_number - 1] = months[month_number - 1].upcase
    end

    months.join(' ')
  end
end
