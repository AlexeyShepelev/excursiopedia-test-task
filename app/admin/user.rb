ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role

  filter :email
  filter :role, as: :select, collection: UserRole.to_a
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :email
    column :role do |user|
      user.role_humanize
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: UserRole.to_a, include_blank: false
    end
    f.actions
  end

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete('password')
        params[:user].delete('password_confirmation')
      end
      super
    end
  end
end
