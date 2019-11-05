json.extract! stockplan, :id, :company_id, :resolution_id, :stock_class, :series, :date_authorized, :par_value, :shares_authorized, :shares_issuable, :shares_reserved, :rights, :active, :notes, :created_at, :updated_at
json.url stockplan_url(stockplan, format: :json)
