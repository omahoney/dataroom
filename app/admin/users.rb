ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role
  #
  # or
  #
  #permit_params do
  #  permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role]
  #  permitted << :other if params[:action] == 'create' && current_user.admin?
  #  permitted
  #end

  permit_params :email,
                :password,
                :password_confirmation

  index do
    selectable_column
    id_column
    column :email

    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation

#      companies.each do |company|
#        label_tag dom_id(company), company.name
#        select_tag dom_id(company), options_for_select(roles, user.role_on(company)), name: "roles[#{company.id}]", include_blank: true
#      end
    end
    f.actions
  end

end


#def build_roles_for(user)
#  role_data = params.fetch(:roles, [])
#  role_data.each do |company_id, role_name|
#    if role_name.present?
#      user.roles.build(company_id: company_id, role: role_name)
#    end
#  end
#end
