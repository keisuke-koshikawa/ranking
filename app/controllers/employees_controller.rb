class EmployeesController < ApplicationController
  def index
    @employees = Employee.preload(:company)
  end
end