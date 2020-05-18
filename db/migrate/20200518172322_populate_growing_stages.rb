class PopulateGrowingStages < ActiveRecord::Migration[5.2]
  def change
    Growing.all.each do |growing|
      growing.growing_stages.create(
        stage_type: 'Sowing',
        started_on: growing.sown_on,
        growing_medium: growing.compost_mix,
        location: growing.location,
        first_growth_on: growing.first_germinated_on,
        num_started: growing.num_sown,
        num_growing: growing.num_germinated,
        num_lost: nil,
        notes: growing.notes
      )
    end
  end
end
