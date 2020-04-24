class HomeController < ApplicationController
  def index
    redirect_to admin_properties_path
  end
end
