class CompaniesController < ApplicationController
  def show
    @companies = Company.find(params[:id])
  end
end
