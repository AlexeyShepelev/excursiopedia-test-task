ActiveAdmin.register Excursion, as: 'FillingExcursions' do
  config.filters = false
  config.batch_actions = false
  actions :index, :edit, :update

  permit_params :description

  form do |f|
    f.inputs do
      f.input :title, input_html: { disabled: true }
      f.input :description
    end
    f.actions do
      action(:submit)
    end
  end

  controller do
    def scoped_collection
      super.unscoped
    end

    def index
      excursion = Excursion.unscoped.undescribed.first
      if excursion
        redirect_to edit_admin_filling_excursion_path(excursion)
      else
        @page_title = t('active_admin.filling_excursions.page_title')
        render 'index', layout: 'active_admin'
      end
    end
  end
end
