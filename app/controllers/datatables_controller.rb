class DatatablesController < ActionController::Base
  before_action :load_i18n_file, only: [:datatable_i18n]

  def datatable_i18n
    render json: @i18n_data
  end

  private

  def load_i18n_file
    file_path = Rails.root.join('config', 'locales', 'datatables', "#{permitted_params[:lang]}.json")
    file = File.open file_path
    @i18n_data = JSON.load file
    file.close
  end

  def permitted_params
    params.permit(:lang)
  end
end
