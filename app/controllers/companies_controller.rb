class CompaniesController < ApplicationController
    def index
        @companies = Company.find(params[:id])
    end

    def show
        @companies = Company.find(params[:id])
    end
end
