json.extract! valuation, :id, :company_id, :stock_plan_id, :price, :event, :provider, :valuation_date, :safeharbor_date, :active, :notes, :created_at, :updated_at
json.url valuation_url(valuation, format: :json)
