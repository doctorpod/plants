module ApplicationHelper
  def sorter(column_code)
    [ link_to('&uarr;'.html_safe, seeds_path(sort: "#{column_code}a")),
      link_to('&darr;'.html_safe, seeds_path(sort: "#{column_code}d")) ].join.html_safe
  end

  def filter_on_boolean(column_code)
    [
      link_to('*', seeds_path(filter: "#{column_code}a")),
      link_to('t', seeds_path(filter: "#{column_code}t")),
      link_to('f', seeds_path(filter: "#{column_code}f"))
    ].join.html_safe
  end
end
