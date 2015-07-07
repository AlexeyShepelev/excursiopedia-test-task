ActiveAdmin.register Excursion do
  permit_params :title, :description, :city_id, :published, category_excursion_ids: []

  filter :translations
  filter :city
  filter :category_excursions
  filter :published
  filter :created_at
  filter :updated_at

  index do |object|
    selectable_column
    id_column
    column :title

    if can?(:manage, object)
      column :city
      column :category_excursions do |excursion|
        has_many_to_links(excursion, :category_excursions)
      end
      column :published
      column :created_at
      column :updated_at
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title, input_html: { disabled: cannot?(:manage, f.object) }
      f.input :description

      if can?(:manage, f.object)
        f.input :city
        f.input :category_excursions, multiple: true, include_blank: true, input_html: { size: 5 }
        f.input :published
      end
    end
    f.actions
  end

  show do |object|
    attributes_table do
      row :id
      row :title
      row :description

      if can?(:manage, object)
        row :city
        row :category_excursions do |excursion|
          has_many_to_links(excursion, :category_excursions)
        end
        row :published
        row :created_at
        row :updated_at
      end
    end
  end

  controller do
    def update
      params[:excursion].slice!(:description) if cannot?(:manage, Excursion)
      super
    end
  end
end
