ActiveAdmin.register Company do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name,
                :shortname,
                :formation_date,
                :entity,
                :address,
                :city,
                :state,
                :zip,
                :country,
                :phone,
                :email,
                :web,
                :fein,
                :status,
                :active,
                :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :shortname, :formation_date, :entity, :address, :city, :state, :zip, :country, :phone, :email, :web, :fein, :status, :active, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
