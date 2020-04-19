module Admin
  class PropertiesController < ApplicationController
    before_action :set_filter_category, only: [:index, :datatable]

    def index
      presenter_params = {
        filter_category: @filter_category
      }
      @indexPresenter = PropertyIndexPresenter.new(presenter_params)
    end

    def datatable
      datatable_params = {
        filter_category: @filter_category
      }
      render json: PropertyDatatable.new(params, datatable_params)
    end

    private

    def set_filter_category
      filter = permitted_params[:filter]
      return if filter.nil?

      Property.validate_filter_category(filter)

      @filter_category = filter
    end

    def permitted_params
      params.permit(:filter)
    end
  end
end
