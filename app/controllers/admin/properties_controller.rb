module Admin
  class PropertiesController < ApplicationController
    before_action :set_filter_category, only: [:index, :datatable]
    before_action :set_property, only: [:show, :edit, :update, :destroy]

    def index
      presenter_params = {
        filter_category: @filter_category
      }
      @indexPresenter = PropertyIndexPresenter.new(presenter_params)
    end

    def show
      @property = @property.decorate
    end

    def update
      respond_to do |format|
        if @property.update(property_params)
          format.html { redirect_to admin_property_path(@property), notice: 'property was successfully updated.' }
          format.json { render :show, status: :ok, location: @property }
        else
          format.html { render :edit }
          format.json { render json: @property.errors, status: :unprocessable_entity }
        end
      end
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

    def set_property
      @property = Property.find(permitted_params[:id])
    end

    def permitted_params
      params.permit(:filter, :id)
    end

    def property_params
      params.require(:property).permit(
        :bathrooms, :category, :description, :furniture, :parking_space,
        :pet_friendly, :property_type_id, :price, :reference, :rooms, :size,
        :title
      )
    end
  end
end
