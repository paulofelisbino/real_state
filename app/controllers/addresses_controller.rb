class AddressesController < ApplicationController
  before_action :sanitize_zipcode

  def find_by_zipcode
    address = Address.find_by(zipcode: @zipcode)
    address = Correios::CEP::AddressFinder.get(@zipcode) if address.nil?

    respond_to do |format|
      format.js { render json: address.to_json }
    end
  end

  private

  def sanitize_zipcode
    @zipcode = permitted_params[:zipcode].strip.tr('-', '')
  end

  def permitted_params
    params.permit(:zipcode)
  end
end
