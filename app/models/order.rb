class Order < ApplicationRecord
  belongs_to :employee
  belongs_to :company

  enum status: [:un_official, :fixed]
end
