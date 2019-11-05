json.extract! company, :id, :name, :shortname, :formation_date, :entity, :address, :city, :state, :zip, :country, :phone, :email, :web, :fein, :status, :active, :notes, :created_at, :updated_at
json.url company_url(company, format: :json)
