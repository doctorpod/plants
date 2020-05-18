json.extract! growing_stage, :id, :growing_id, :stage_type, :started_on, :growing_medium, :location, :first_growth_on, :num_started, :num_growing, :num_lost, :notes, :created_at, :updated_at
json.url growing_stage_url(growing_stage, format: :json)
