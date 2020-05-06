module SeedsHelper
  def sowing_months(month_numbers_string)
    return '' if month_numbers_string.blank?

    month_letters = %w[J F M A M J J A S O N D]
    month_numbers = month_numbers_string.split(' ').map(&:to_i).uniq
    out = []

    month_letters.each_with_index do |month_letter, i|
      span_class = month_numbers.include?(i + 1) ? 'month-bright' : 'month-dim'
      out << content_tag(:span, month_letter, class: span_class)
    end

    out.join.html_safe
  end
end
