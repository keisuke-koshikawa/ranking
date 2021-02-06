class Company < ApplicationRecord
  with_options dependent: :destroy do
    has_many :employees
    has_many :departments
    has_many :orders
    has_many :positions
  end
end
