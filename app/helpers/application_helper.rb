module ApplicationHelper
  def breadcrumbs
    crumbs = []
    crumbs << link_to('Seeds', seeds_path)
    crumbs << 'New' if @seed && !@seed.persisted?
    crumbs << link_to(@seed.name, seed_path(@seed)) if @seed&.persisted?
    crumbs << 'Editing' if controller_name == 'seeds' && action_name == 'edit'
    crumbs << link_to('Sowings', seed_sowings_path(@seed)) if controller_name == 'sowings'
    crumbs << 'New' if @sowing && !@sowing.persisted?
    crumbs << link_to(@sowing.name, seed_sowing_path(@seed, @sowing)) if @sowing&.persisted?
    crumbs << 'Editing' if controller_name == 'sowings' && action_name == 'edit'
    crumbs.join(' / ').html_safe
  end

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
