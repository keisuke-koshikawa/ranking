class CompaniesController < ApplicationController
  def show
    @compan = Company.find(params[:id])
  end
end
