module Admin
  class PropertiesController < ApplicationController
    before_action :set_resources, only: [:index]

    def index
      presenter_params = {
        properties: @properties,
        filter_category: @filter_category
      }
      @indexPresenter = PropertyIndexPresenter.new(presenter_params)
    end

    private

    def set_resources
      if permitted_params[:filter].nil?
        @properties = Property.all
        return
      end

      category = permitted_params[:filter].to_s.downcase.strip
      raise ArgumentError, 'Invalid filter' unless Property.category_enum_valid?(category)

      @properties = Property.send(category)
      @filter_category = category
    end

    def permitted_params
      params.permit(:filter)
    end
  end
end
