json.extract! contract, :id, :company_id, :contractor, :address, :city, :state, :zip, :country, :start_date, :end_date, :term, :terms, :notes, :created_at, :updated_at
json.url contract_url(contract, format: :json)
