json.extract! dashboard, :id, :company_id, :description, :contact, :deadline, :completed, :notes, :created_at, :updated_at
json.url dashboard_url(dashboard, format: :json)
