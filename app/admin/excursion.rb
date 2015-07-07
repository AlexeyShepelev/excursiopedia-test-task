ActiveAdmin.register Excursion do
  permit_params :title, :description, :city_id, :published, category_excursion_ids: []

  filter :translations
  filter :city
  filter :category_excursions
  filter :published
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :title
    column :city
    column :category_excursions do |excursion|
      has_many_to_links(excursion, :category_excursions)
    end
    column :published
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title, input_html: { disabled: cannot?([:create, :edit], f.object) }
      f.input :description

      if can?([:create, :edit], f.object)
        f.input :city
        f.input :category_excursions, multiple: true, include_blank: true, input_html: { size: 5 }
        f.input :published
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :city
      row :category_excursions do |excursion|
        has_many_to_links(excursion, :category_excursions)
      end
      row :published
      row :created_at
      row :updated_at
    end

    panel 'Log' do
      table_for excursion.versions do
        column :event
        column :user do |version|
          User.find(version.whodunnit).email if version.whodunnit.present?
        end
        column :changes do |version|
          version.changeset
        end
        column :created_at do |version|
          l(version.created_at)
        end
      end
    end
  end

  controller do
    def update
      params[:excursion].slice!(:description) if can?(:translate, Excursion)
      super
    end
  end
end
