json.extract! finance, :id, :company_id, :person_id, :stockplan_id, :title, :doc_date, :description, :status, :active, :complete, :notes, :created_at, :updated_at
json.url finance_url(finance, format: :json)
